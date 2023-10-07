/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.Controller;

import huyttl.category.CategoryDAO;
import huyttl.category.CategoryDTO;
import huyttl.product.ProductDAO;
import huyttl.product.ProductDTO;
import huyttl.product.ProductValidator;
import huyttl.util.MyAppConstants;
import huyttl.util.Notification;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;

/**
 *
 * @author DELL
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB 
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)   	// 100 MB
public class CreateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //1, Get context scope
        ServletContext context = this.getServletContext();
        //2, Get SiteMaps
        Properties siteMaps = (Properties) context.getAttribute("SITE_MAPS");
        //3, The SiteMaps to get URL Pattern
        String url = (String) siteMaps.get(MyAppConstants.CRUDFeatureProduct.CREATE_CONTROLLER);

        String productName = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");
        String statusStr = request.getParameter("status");
        String categoryIdStr = request.getParameter("categoryId");
        Part filePart = request.getPart("file");
        
        try {
            this.loadCategories(request);
            
        } catch (SQLException ex) {
            Logger.getLogger(CreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        ProductValidator validator = new ProductValidator(productName, description, priceStr, statusStr, categoryIdStr);
        if (validator.hasError()) {
            request.setAttribute("NOTIFICATION", new Notification("Create failed - Invalid Fields!", false));

            for (Notification notification : validator.getListChecked()) {
                if (!notification.isResult()) {
                    request.setAttribute(notification.getErrorField() + "_ERROR", notification.getMessage());
                }
            }
        } else {
            try {
                int price = Integer.parseInt(priceStr);
                int categoryId = Integer.parseInt(categoryIdStr);
                boolean status = false;
                if(statusStr.equals("true")) status = true; 
                InputStream imageStream = filePart.getInputStream();
                byte[] image = imageStream.readAllBytes();
                
                ProductDAO dao = new ProductDAO();
                boolean result = dao.store(new ProductDTO(productName, price, description, "", status, categoryId), image);
                if(result) {
                    url = (String) siteMaps.get(MyAppConstants.SearchFeature.SEARCH_CONTROLLER);
                    
                    request.setAttribute("NOTIFICATION", new Notification("Create successfully!", true));
                } else {
                    request.setAttribute("NOTIFICATION", new Notification("ERROR - Please, try again!", false));
                }
            } catch (Exception ex) {
                String msg = ex.getMessage();
                log("CreateProductServlet_ SQL " + msg);
                if (msg.contains("duplicate")) {
                    request.setAttribute("NOTIFICATION", new Notification("Product name is existed", false));
                }
            }
        }
        
        request.getRequestDispatcher(url).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            this.loadCategories(request);
        } catch (SQLException ex) {
            Logger.getLogger(CreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        //1, Get context scope
        ServletContext context = this.getServletContext();
        //2, Get SiteMaps
        Properties siteMaps = (Properties) context.getAttribute("SITE_MAPS");
        //3, The SiteMaps to get URL Pattern
        String url = (String) siteMaps.get(MyAppConstants.CRUDFeatureProduct.CREATE_PAGE);
        request.getRequestDispatcher(url).forward(request, response);
    }
    
    private void loadCategories(HttpServletRequest request) throws SQLException, ClassNotFoundException {
        CategoryDAO dao = new CategoryDAO();

        ArrayList<CategoryDTO> list = dao.getAllCategories();
        request.setAttribute("LIST_CATEGORIES", list);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
