<%-- 
    Document   : Cartpage
    Created on : Oct 25, 2023, 1:45:57 AM
    Author     : ntmanh
--%>

<%@page import="controller.IMyConstant"%>
<%@page import="dto.FlowerDTO"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <h1>Welcome</h1>
        <% 
            HashMap<FlowerDTO, Integer> cart = (HashMap<FlowerDTO, Integer>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<>();
                out.print("Your car is empty");     
            }
        %>
        <h1>Your cart</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>NAME</th>

                <th>IMG</th>
                <th>PRICE</th>
                <th>QUANITY</th>

            </tr>
            <% 
            for(FlowerDTO it : cart.keySet()){ %>
                 <input type="hidden" name="txtid" value="<%=it.getFlowID()%>"
                  <tr>
                    <td><%=it.getFlowID()%></td>
                    <td><%=it.getFlowName()%></td>
                    <td><img src="img/<%=it.getImgPath()%>" style="width:100px;height:100px"></td>
                    <td><%=it.getPrice()%></td>
                    <td><input type="number" value="<%=cart.get(it)%>" min="1"max="10" name="txtquantity"></td>
<!--                    <td>
                        <input type="submit" value="update" name="btnType">
                        <input type="submit" value="remove" name="btnType">
                    </td>-->

                </tr>
            
            <%}%>
        
        <a href="MainServlet?action=<%= IMyConstant.DEFAULT%>" > Home</a>
        
        
    </body>
</html>
