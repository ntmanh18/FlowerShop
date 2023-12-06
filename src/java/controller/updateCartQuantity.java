/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.FlowerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ntmanh
 */
public class updateCartQuantity extends HttpServlet {

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
             String id = request.getParameter("txtid");
                String quantity = request.getParameter("txtquantity");
                String type = request.getParameter("action");
                
                
                 HttpSession session = request.getSession();
            HashMap<FlowerDTO, Integer> cart = (HashMap<FlowerDTO, Integer>) session.getAttribute("cart");
            
             if (cart != null) {
                boolean flag = false;
                FlowerDTO rs = null;
                for (FlowerDTO it : cart.keySet()) {

                    if (it.getFlowID() == Integer.parseInt(id.trim())) {
                        flag = true;
                        rs = it;
                    }
                    if (flag) {
                        if (type.equalsIgnoreCase("update")) { //update quantity
                            cart.put(rs, Integer.parseInt(quantity.trim()));    
                        }    
                            else{
                                
                            cart.remove(rs);
                            
                        }
                         session.setAttribute("cart", cart);
            request.getRequestDispatcher("MainServlet?action="+IMyConstant.VIEWCART).forward(request, response);
                        
                    }

                }
                
            }
            
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
