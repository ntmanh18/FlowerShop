/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.FlowerDAO;
import dto.FlowerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ntmanh
 */
public class addToCartServlet extends HttpServlet {

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
            String id = (String) request.getParameter("txtid");
           
            FlowerDTO it = FlowerDAO.getFlowerById(id);
            if(it.getStatus() == 0){
            request.setAttribute("OutStock", "Sản phẩm đã hết hàng");
            }else{
            
             HttpSession session = request.getSession();
                HashMap<FlowerDTO,Integer> cart =(HashMap<FlowerDTO,Integer>) session.getAttribute("cart");
                if(cart==null){
                cart=new HashMap<>();
                cart.put(it, 1);

            }else{
                boolean flag=false;
                for(FlowerDTO tmp:cart.keySet()){
                    if(tmp.getFlowID()==it.getFlowID()){
                        flag=true;
                        int quantity =cart.get(tmp);
                        quantity++;
                        cart.put(tmp,quantity);

                    }

                }

                if(!flag){
                    cart.put(it,1);
                }
            }
                      session.setAttribute("cart",cart);      
            }
            request.getRequestDispatcher("MainServlet?action="+IMyConstant.USERPAGE_DEFAULT).forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(addToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
            //luu cart vao session cho lan buy sau
            

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
