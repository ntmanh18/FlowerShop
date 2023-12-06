/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ntmanh
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
        try (PrintWriter out = response.getWriter()) {
             response.setContentType("text/html;charset=UTF-8");
       
            String phonePattern = "\\d{10}";
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("txtemail");
            String fullname = request.getParameter("txtname");
            String password = request.getParameter("txtpass");
            String address = request.getParameter("txtaddress");
            String phone = request.getParameter("txtphone");
            String role = request.getParameter("txtrole");
             if (!phone.matches(phonePattern)) {
                request.setAttribute("txtemail", email);
                request.setAttribute("txtfullname", fullname);
                request.setAttribute("txtaddress", address);
                request.setAttribute("ERROR", "this phone number is invalid");
                request.getRequestDispatcher("Signup.jsp").forward(request, response);
            } else {
                
                int status = 1;
                boolean rs=  UserDAO.InsertUser(email, password, fullname, phone, status, role, address);
                response.sendRedirect("loginpage.jsp");
             }    
            
        }
        catch (Exception e) {
        // Handle any exception that occurred during processing
        // You can log the exception or display an error message
       
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
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
