<%-- 
    Document   : OrderDetail
    Created on : Nov 1, 2023, 11:53:49 AM
    Author     : ntmanh
--%>

<%@page import="dto.OrderDTO"%>
<%@page import="controller.IMyConstant"%>
<%@page import="dao.FlowerDAO"%>
<%@page import="dto.FlowerDTO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="java.util.List"%>
<%@page import="dto.ordDetailDTO"%>
<%@page import="dto.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background: #f7e1e1">
        <nav class="navbar">
            
<a class="brand" style="font-size: 30px;" href="MainServlet?action=<%= IMyConstant.USERPAGE_DEFAULT%>">Flower Shop <i class='bx bxs-florist'></i></a>
  
<a href="MainServlet?action=<%=IMyConstant.ORDERINFOR%>" >Other Orders</a>
        </nav>
        
         
       
        <%
            AccountDTO user =(AccountDTO) session.getAttribute("Loginrole");
            String ordID = request.getParameter("txtOrdID");
            List<ordDetailDTO> list = OrderDAO.orderDetail(ordID);
            
            

        %>
         <% OrderDTO order = OrderDAO.getOrderByID(ordID);
         int status = order.getOrdID();
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
   
   <h1 style="font-size: 50px; text-align: center">Order <%= ordID %> </h1>
   <hr style="width: 90%; margin-bottom: 30px">
         <div class="Order">
             
             <p style="font-weight: bold; display: inline-block">Status:</p><p style="display: inline-block"> <%= display %></p> <br>
             <p style="font-weight: bold;display: inline-block">Order date:</p><p style="display: inline-block"> <%=order.getOrdDate() %></p> <br>
        <p style="font-weight: bold;display: inline-block">Ship date  :</p><p style="display: inline-block"> <%= order.getShipDate() %> </p>
        
       <% if(status == 1){ %>
                               <form action="MainServlet">
                                    <input type="hidden" value="<%= ordID %>" name="txtOrdID">
                        <input type="submit" value="Delete" name="action">
                               </form>
                    
                  <% } %> 

        
        
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
         </nav>
         <p style="background: black;color: whitesmoke;font-weight: bold;font-size: 30px">Total : <%= total %></p>
        
          
                     
                  <style>
 .navbar {
    background-color: black;
 
    display: flex;
    justify-content: space-between;
    align-items:center;
    padding: 30px;
}

.navbar a {
    color: pink;
    font-weight: bolder;
    font-size: 30px;
    
}

.navbar .brand {
    display: block;
    color: pink;
    padding: 0 24px;
}



.navbar a:hover,
.navbar a:focus {
    color: white;
    transition: ease-in-out 0.5s;
}
.Order{
    width: 700px;
    border: solid;
    margin: 0 auto;
   
}

.Order p{
   padding: 5px 40px;
}
table{
    margin : 30px;
}

table tr th{
    align-content: center;
    width: 100px;    
    height: 40px;
    font-size: 20px;
    border-bottom: 1px;

  
}
table tr td{
    text-align: center;
    align-content: center;
    height: 70px;
    fon-size: 15px;
    
   
}

  

.button{
    background-color: black;
    color: pink;
    padding: 20px 20px;
   
    
    text-align: center;
    


}
.button:hover{
    background-color: pink;
    color: black;
    transition: .5s;
}





        </style>
       
    </body>
</html>
