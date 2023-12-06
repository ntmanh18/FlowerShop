<%-- 
    Document   : order.jsp
    Created on : Nov 1, 2023, 10:27:45 AM
    Author     : ntmanh
--%>

<%@page import="controller.IMyConstant"%>
<%@page import="java.util.List"%>
<%@page import="dto.AccountDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dto.OrderDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            
        <title>Orders</title>
    </head>
    <body style="background-color: #f7e1e1">
        <nav class="navbar"> 
        <a class="brand" style="font-size: 30px;" href="MainServlet?action=<%= IMyConstant.USERPAGE_DEFAULT%>">Flower Shop <i class='bx bxs-florist'></i></a>
        
             <ul>
                <li>
                    <a href="MainServlet?action=Search&order=0" style="font-size: 23px;"><i class='bx bxs-home'></i> All</a>
                </li>
                <li>
                    <a href="MainServlet?action=Search&order=1" style="font-size: 23px;"><i class='bx bxs-edit-alt'></i> Processing</a>
                </li>
                <li>
                    <a href="MainServlet?action=Search&order=2" style="font-size: 23px;"><i class='bx bx-log-in'></i> Shipping</a>
                </li>
                <li>
                    <a href="MainServlet?action=Search&order=3"  style="font-size: 23px; cursor: pointer;"><i class='bx bxs-cart'></i> Cancled </a>
                </li>
                 <li>
                    <a href="MainServlet?action=Search&order=4"  style="font-size: 23px; cursor: pointer;"><i class='bx bxs-cart'></i> Completed </a>
                </li>
            </ul>
        
        </nav>
        
                

        
        <% if(request.getAttribute("message")!=null){
            OrderDTO ord = (OrderDTO)request.getAttribute("ord");
        
        %>
        
        <h2><%= request.getAttribute("message")%></h2>
        <h3>Order <%= ord.getOrdID() %></h3>
        <p>Order Date <%= ord.getOrdDate() %></p>
        <p>Total <%= ord.getTotal() %></p>
       <% }%>
       
       <% if(request.getAttribute("CancleMessage") != null){
       %>
       <h1>Đã hủy đơn hàng <%= request.getAttribute("CancleID") %></h1>
       <%}%>
        <%  Integer type = (Integer) request.getAttribute("type");
            List<OrderDTO> list = null ;
            list=(List<OrderDTO>) request.getAttribute("orderList");
            String display=" ";
            
            
            if(type != null){
            
            if(type == 1){
                display = "Proccessing Order";
            }else if(type == 2){
                display ="Shipping Order";
                
            }else if(type == 3){
                display = "Cancled Order";
            }else if(type == 0){
                display ="All of your Order";
            }else if(type == 4){
                display="Completed Order";
            }else{
                display =" " ;
            }
            }else
            {type = 5;
            display=" ";}
            if (list != null){
            
             
        %>
        <h1 style="text-align: center; color: black; font-size: 50px"><%= display%></h1>
        <table>
            <tr>
                <th  >ID</th>
                <th >Date</th>
               
                <th >Total</th>
                <th >Detail</th>
                
                <th></th>

            
            </tr>
            <hr style="align-content: center; width: 90%">
            <%  
              
                 
            for(OrderDTO tmp:list){
                
            
            %>
           
            <form action="MainServlet">
              
               <input type="hidden" value="<%= tmp.getOrdID()%>" name="txtOrdID">
                    <tr style="border :solid">   
                <td><%= tmp.getOrdID()%></td>
                <td><%= tmp.getOrdDate().toString()%></td>  
                <td><%= tmp.getTotal()%></td>
                
                
                 <td>
                     
                     <input type="submit" value="Detail" name="action" class="button">
                   
                        
                        
                    </td>
                  
                    <% 
                        if(tmp.getOrdStatus() == 1){ %>
                              <td>
                                  <input class="button  " type="submit" value="Delete" name="action">
                        
                    </td>
                  <% } %>      
            </tr>
         </form>

            <%}
}%>
        </table >
       
</div>
        
        <style>
    .navbar {
    background-color: black;
 
    display: flex;
    justify-content: space-between;
    align-items:center;
    padding: 0.5em;
}

.navbar a {
    color: whitesmoke;
    font-weight: bolder;
}

.navbar ul {
    margin: 0;
    padding: 0;
    list-style-type: none;
    display: flex;
    justify-content: center;
}

.navbar .brand {
    display: block;
    color: whitesmoke;
    padding: 0 24px;
}

.navbar ul li a {
    color: whitesmoke;
    padding: 24px;
    display: block;
    transition: ease-in-out 0.5s;
}

.navbar ul a:hover,
.navbar ul a:focus {
    color: pink;
    transition: ease-in-out 0.5s;
}
table tr th{
    align-content: center;
    width: 400px;    
    height: 70px;
    font-size: 30px;
    border-bottom: 1px;

  
}
table tr td{
    text-align: center;
    align-content: center;
    height: 70px;
    fon-size: 15px;
    
   
}

table{
     align-items: 0 auto;
    border: 0 0 0 1;
    
    
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
