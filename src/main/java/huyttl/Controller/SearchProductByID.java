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
import huyttl.util.MyAppConstants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class SearchProductByID extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
        String url = (String) siteMaps.getProperty(MyAppConstants.CRUDFeatureProduct.UPDATE_PAGE);
        
        try {
            //get value from client
            String searchValue = request.getParameter("searchValue");
            int productId = 0;
            
            if(searchValue != null) {
                productId = Integer.parseInt(searchValue.trim());
            }
            
            ProductDAO productDAO = new ProductDAO();
            ProductDTO product = productDAO.getProductById(productId);

            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<CategoryDTO> listC = categoryDAO.getAllCategories();

            request.setAttribute("SEARCH_RESULT", product);
            request.setAttribute("LIST_CATEGORIES", listC);

        } catch (SQLException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
