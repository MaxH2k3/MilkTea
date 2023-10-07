/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.Controller;

import huyttl.user.UserDAO;
import huyttl.user.UserDTO;
import huyttl.user.UserValidator;
import huyttl.util.MyAppConstants;
import huyttl.util.Notification;
import java.io.IOException;
import java.io.PrintWriter;
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
public class RegisterServlet extends HttpServlet {

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
        String url = (String) siteMaps.get(MyAppConstants.RegisterFeature.REGISTER_PAGE);

        String name = request.getParameter("txtName");
        String phone = request.getParameter("txtPhone");
        String address = request.getParameter("txtAddress");
        String email = request.getParameter("txtEmail");
        int role = Integer.parseInt(request.getParameter("txtRole"));
        String username = request.getParameter("txtUserName");
        String password = request.getParameter("txtPassword");
        String confirmPassword = request.getParameter("txtConfirmPassword");
        int gender = Integer.parseInt(request.getParameter("txtGender"));

        try {

            UserValidator validator = new UserValidator(name, phone, address, email, username, password, confirmPassword);
            if (validator.hasError()) {
                request.setAttribute("NOTIFICATION", new Notification("Create failed - Invalid Fields!", false));

                for (Notification notification : validator.getListChecked()) {
                    if (!notification.isResult()) {
                        request.setAttribute(notification.getErrorField() + "_ERROR", notification.getMessage());
                    }
                }
            } else {
                HttpSession session = request.getSession();

                UserDTO user = (UserDTO) session.getAttribute("LOGINED_USER");

                UserDAO dao = new UserDAO();
                boolean result = dao.createAccount(new UserDTO(username, password, name, phone, address, email, role, (gender == 1) ? true : false));
                if (user != null) {
                    if (result && user.getRoleId() == 2) {

                        url = (String) siteMaps.get(MyAppConstants.LoginFeatures.LOGIN_PAGE);

                        request.setAttribute("NOTIFICATION", new Notification("Create successfully!", true));
                    } else if (result && user.getRoleId() == 1) {
                        url = (String) siteMaps.get(MyAppConstants.AdminFeature.ADMIN_PAGE);

                        request.setAttribute("NOTIFICATION", new Notification("Create successfully!", true));
                    }
                } else {
                    url = (String) siteMaps.get(MyAppConstants.LoginFeatures.LOGIN_PAGE);

                    request.setAttribute("NOTIFICATION", new Notification("Create successfully!", true));
                }
            }
        } catch (Exception ex) {
            String msg = ex.getMessage();
            log("CreateAccountServlet_ SQL " + msg);
            if (msg.contains("duplicate")) {
                request.setAttribute("NOTIFICATION", new Notification("Username is existed", false));
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

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
