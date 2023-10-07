/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.Controller;

import huyttl.cart.Cart;
import huyttl.order.OrderDAO;
import huyttl.order_details.OrderDetailsDTO;
import huyttl.product.ProductDAO;
import huyttl.product.ProductDTO;
import huyttl.user.UserDTO;
import huyttl.util.MyAppConstants;
import huyttl.util.Notification;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class CheckOutServlet extends HttpServlet {

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

        //Which button did user click ?
        String button = request.getParameter("btAction");
        //1, Get context scope
        ServletContext context = this.getServletContext();
        //2, Get SiteMaps
        Properties siteMaps = (Properties) context.getAttribute("SITE_MAPS");
        //3, The SiteMaps to get URL Pattern
        String url = (String) siteMaps.get(MyAppConstants.OrderFeature.VIEW_ORDER_CONTROLLER);

        ProductDAO dao = new ProductDAO();

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("CART");

        if (cart == null) {
            cart = new Cart();
        }

        ArrayList<ProductDTO> products = new ArrayList<>();

        Map<Integer, Integer> items = cart.getItems();
        if (items == null) {
            items = new HashMap<>();
        }

        double total = 0;
        try {
            for (int productId : items.keySet()) {
                ProductDTO product = dao.getProductById(productId);
                if (product != null) {
                    product.setQuantity(cart.getItems().get(productId));
                    products.add(product);
                    total += product.getQuantity() * product.getPrice();
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            log("Error at " + this.getServletName() + ": " + ex.getMessage());
        }
        UserDTO currentUser = ((UserDTO) session.getAttribute("LOGINED_USER"));
        if (currentUser == null) {
            // must login to checkout
            request.setAttribute("NOTIFICATION", new Notification("You must login to checkout!", false));
            request.getRequestDispatcher(url).forward(request, response);
            return;
        }
        int currentUserId = currentUser.getUserId();

        //parse value of mobiles to order details list
        ArrayList<OrderDetailsDTO> orderDetailsList = new ArrayList<>();
        for (ProductDTO product : products) {
            OrderDetailsDTO orderDetails
                    = new OrderDetailsDTO(product.getProductId(), product.getQuantity(), product.getPrice(), 1);
            orderDetailsList.add(orderDetails);
        }

        OrderDAO orderDao = new OrderDAO();

        try {
            if (!orderDetailsList.isEmpty() && orderDao.add(orderDetailsList, currentUserId, total)) {
                session.setAttribute("CART", null);
                url = (String) siteMaps.get(MyAppConstants.SearchFeature.SEARCH_CONTROLLER);
                request.setAttribute("NOTIFICATION", new Notification("Checkout Successfully!", true));
            } else {
                request.setAttribute("NOTIFICATION", new Notification("Checkout Failed, please try again!", false));
            }
        } catch (Exception ex) {
            log("Error at " + this.getServletName() + ": " + ex.getMessage());
            request.setAttribute("NOTIFICATION", new Notification("Checkout Failed, please try again!", false));
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
        processRequest(request, response);
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
