<%-- 
    Document   : OrderUpdate
    Created on : Dec 6, 2023, 4:20:48 AM
    Author     : ntmanh
--%>

<%@page import="dto.AccountDTO"%>
<%@page import="dao.FlowerDAO"%>
<%@page import="dto.FlowerDTO"%>
<%@page import="dto.OrderDTO"%>
<%@page import="dto.ordDetailDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.OrderDAO"%>
<%@page import="controller.IMyConstant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <nav class="navbar">
            
<a class="brand" style="font-size: 30px;" href="MainServlet?action=<%= IMyConstant.ADMINPAGE_DEFAULT%>">Flower Shop <i class='bx bxs-florist'></i></a>
  
<a href="MainServlet?action=<%=IMyConstant.ORDERMANAGE %>" >Other Orders</a>
        </nav>
         <%
            AccountDTO user =(AccountDTO) session.getAttribute("Loginrole");
            String ordID = request.getParameter("txtOrd");
            List<ordDetailDTO> list = OrderDAO.orderDetail(ordID);
            
            

        %>
        <% OrderDTO order = OrderDAO.getOrderByID(ordID);
         int status = order.getOrdStatus();
             
         String display = " "; 
         if(status == 1){
         display = "Processing";
} else if(status == 2){ 
display ="Shipping";
}else if(status == 3){
display="Cancle";
}else if(status ==4){
display = "completed";
}
   %>
        <h1 style="font-size: 50px; text-align: center">Order <%= ordID%> </h1>
        <form action="MainServlet">
            <input type="hidden" value="<%= ordID%>" name="txtOrd" />
            <p>Status: <%= display%>
                <input type="radio"  name="status" value="1" required="">
            <label>Processing</label>
            <input type="radio"  name="status" value="2">
            <label>Shipping</label>
            <input type="radio"  name="status" value="3">
            <label>Canceled</label>
            <input type="radio"  name="status" value="4">
            <label>Completed</label>
            </p>  
            <p>Order Date: <input type="date" value="<%=order.getOrdDate() %>"name="ordDate" readonly=""></p>
            <p>Ship Date: <input type="date" value="<%=order.getShipDate() %>"name="shipDate"></p>
            <p class="button"><input type="submit" name="action" value="Update Order"></p>
        </form>
        <table>
            <tr>
                
                <th>Flower</th>              
                <th>Quantity</th>
                <th>Price</th>


            </tr>
            
            <% 
                double total =0;
                
            for(ordDetailDTO tmp:list){
                
            
            %>
           
          
                  
                <tr>   
                <% FlowerDTO flower=FlowerDAO.getFlowerById(String.valueOf(tmp.getFlowID()));  
                    total += (tmp.getPrice() * tmp.getQuantity());
                   
                
                
                %> 
                <td><%=flower.getFlowName()%></td>  
                <td><%=tmp.getQuantity()%></td>
                <td><%= tmp.getPrice() * tmp.getQuantity()%></td>
                
                 
            </tr>
            

         <%}
         
         
         %>
        </table>
        <p style="background: black;color: whitesmoke;font-weight: bold;font-size: 30px">Total : <%= total %></p>
         <% if(request.getAttribute("Message") != null){
       %>
       <h1><%= request.getAttribute("Message") %></h1>
       <%}%>
        
    </body>
</html>
