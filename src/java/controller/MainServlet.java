/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tuan Hung
 */
public class MainServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String s = request.getParameter("action");
            String url = "error.jsp";
            if (s == null) {
                s = IMyConstant.DEFAULT;
            }
            switch (s) {
                case IMyConstant.DEFAULT:
                    url = "index.jsp";
                    break;

                case IMyConstant.SIGNUPPAGE:
                    url = "Signup.jsp";
                    break;

                case IMyConstant.LOGINPAGE:
                    url = "loginpage.jsp";
                    break;

                case IMyConstant.USERPAGE_DEFAULT:
                    url = "Userpage.jsp";
                    break;

                case IMyConstant.ADMINPAGE_DEFAULT:
                    url = "Adminpage.jsp";
                    break;
                    
                    case IMyConstant.SHIPPERPAGE_DEFAULT:
                    url = "Shipperpage.jsp";
                    break;

                case IMyConstant.LOGIN:
                    url = "LoginServlet";
                    break;
                case IMyConstant.ADDTOCART:
                    url ="addToCartServlet";
                    break;
                   
                case IMyConstant.VIEWCART:
                    url="ViewCart.jsp";
                    break;
                case IMyConstant.UPDATECART :
                    url="updateCartQuantity";
                    break;
                case IMyConstant.REMOVECART:
                    url="updateCartQuantity";
                    break;    
                case IMyConstant.ORDER:
                    url="SaveCartServlet";
                    break;
                case IMyConstant.ORDERINFOR:
                    url ="order.jsp";
                    break;
                case IMyConstant.ORDERDETAIL:
                    url ="OrderDetail.jsp";
                    break;
                   
                case IMyConstant.SEARCHORDER:
                    url = "OrderServlet";
                    break;
                case IMyConstant.DELETEORDER:
                    url ="cancleOrderServlet";
                    break;
                    
                case IMyConstant.MANAGEFLOWER:
                    url ="FlowerManagement.jsp";
                    break;
                case IMyConstant.DELETEFLOWER:
                    url ="deleteFlowerServlet";
                    break;
                case IMyConstant.RESTOCKFLOWER:
                    url ="deleteFlowerServlet";
                    break;
                
                case IMyConstant.UPDATEFLOWER:
                    url ="updateFlowerServlet";
                    break;
                case IMyConstant.SEARCHFLOWER:
                    url ="LoadFlowerServlet";
                    break;
                case IMyConstant.DETAILFLOWER:
                    url ="flowerDetail.jsp";
                    break;
                case IMyConstant.ADDFLOWER:
                    url = "AddFlowerServlet";
                    break;
                case IMyConstant.LOGOUT:
                    url ="LogoutServlet";
                    break;
                case  IMyConstant.SIGNUP:
                    url ="Signup.jsp";
                    break;
                case IMyConstant.REGISTER:
                    url="RegisterServlet";
                    break;
                case  IMyConstant.PROFILE:
                    url="Profile.jsp";
                    break;
                case IMyConstant.UPDATEPROFILE:
                    url="UpdateProfileServlet";
                    break;
                case IMyConstant.MANGEUSER:
                    url="Account.jsp";
                    break;
                case IMyConstant.ACTIVEUSER:
                    url="deleteUser";
                    break;
                case IMyConstant.DELETEUSER:
                    url="deleteUser";
                    break;
                    
                case IMyConstant.ORDERMANAGE:
                    url="OrderMange.jsp";
                    break;
                case IMyConstant.LOADORDER:
                    url="ManageOrderServlet";
                    break;
                case IMyConstant.UPDATEORDER:
                    url="OrderUpdate.jsp";
                    break;
                case IMyConstant.HANDLEUPDATEORDER:
                    url="UpdateOrderServlet";
                    break;
            }
           
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
