/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ntmanh
 */
public class UpdateOrderServlet extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          String id =  request.getParameter("txtOrd");
          String status = request.getParameter("status");
          String ordDate = request.getParameter("ordDate");
          String shipDate = request.getParameter("shipDate");
          SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//                   try {
//              java.util.Date date1 =  formatter.parse(ordDate);
//         java.util.Date date2 =  formatter.parse(shipDate);
//            if(date2.compareTo(date1) > 0 ){
//              String msg = "Invalid shipDate";
//            request.setAttribute("Message", msg);
//            request.getRequestDispatcher("MainServlet?action=Update").forward(request, response);
//          }
//        } catch (ParseException e) {
//            e.printStackTrace();
//            
//        }

//          /*          Date date1 = (Date) new SimpleDateFormat("dd/MM/yyyy").parse(ordDate);
//          if(date2.compareTo(date1) > 0 ){
//              String msg = "Invalid shipDate";
//            request.setAttribute("Message", msg);
//            request.getRequestDispatcher("MainServlet?action=Update").forward(request, response);
//          }else{
          int  rs = OrderDAO.updateOrder(status, ordDate, shipDate, id);
            String msg = "Update Order Successfully";
            request.setAttribute("Message", msg);
            request.getRequestDispatcher("MainServlet?action=Update&txtID+{id}").forward(request, response);
//          }
            
            
            
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UpdateOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UpdateOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
