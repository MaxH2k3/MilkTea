/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.Controller;

import huyttl.user.UserDAO;
import huyttl.user.UserDTO;
import huyttl.util.MyAppConstants;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class AuthLoginServlet extends HttpServlet {

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
        String userName = request.getParameter("txtUserName");
        String password = request.getParameter("txtPassword");

        //1, Get context scope
        ServletContext context = this.getServletContext();
        //2, Get SiteMaps
        Properties siteMaps = (Properties) context.getAttribute("SITE_MAPS");
        //3, The SiteMaps to get URL Pattern
        String url = (String) siteMaps.get(MyAppConstants.LoginFeatures.LOGIN_PAGE);

        try {

            UserDAO dao = new UserDAO();
            boolean result = dao.checkLogin(userName, password);

            if (result) {

                HttpSession session = request.getSession();

                UserDTO loginedUser = dao.getLoginedUser();

                session.setAttribute("LOGINED_USER", loginedUser);

                Cookie cookie = new Cookie(userName, password);
                cookie.setMaxAge(60 * 10);
                response.addCookie(cookie);

                if (loginedUser.getRoleId() == 1) {
                    url = (String) siteMaps.get(MyAppConstants.AdminFeature.ADMIN_PAGE);
                } else {
                    url = (String) siteMaps.get(MyAppConstants.ShopFeature.HOME_PAGE);
                }

                request.setAttribute("INFO_MESSAGE", "WELCOME BACK, " + loginedUser.getName());
            } else {
                request.setAttribute("ERROR_MESSAGE", "Invalid UserName or Password");
            }
        } catch (SQLException ex) {
            log("Error at " + this.getServletName() + ": " + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            log("Error at " + this.getServletName() + ": " + ex.getMessage());
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
