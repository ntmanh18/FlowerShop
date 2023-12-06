<%-- 
    Document   : ViewCart
    Created on : Oct 25, 2023, 2:10:25 PM
    Author     : ntmanh
--%>

<%@page import="dto.AccountDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="controller.IMyConstant"%>
<%@page import="dto.FlowerDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: #f7e1e1">
        <div class="navbar" >
        <a class="brand" style="font-size: 30px;" href="MainServlet?action=<%= IMyConstant.USERPAGE_DEFAULT%>">Flower Shop <i class='bx bxs-florist'></i></a>
        <h1 style="clear: both">Your cart</h1>
         </div>
         <% float total = 0 ;%>
         <% 
   
             
            AccountDTO user =(AccountDTO) session.getAttribute("Loginrole");
            HashMap<FlowerDTO, Integer> cart =new HashMap<>();
            cart =     (HashMap<FlowerDTO, Integer>) session.getAttribute("cart");
         
            if (cart==null) {
                cart = new HashMap<>();
                %>
                <h1 style="text-align: center   " >Your cart is empty</h1> 
            <%}else{
           
                                 
        %>
    
       
        <table>
            <tr>
                <th>ID</th>
                <th>NAME</th>

                <th>IMG</th>
                <th>PRICE</th>
                <th>QUANITY</th>
                <th></th>

            </tr>
            
             <% 
                 
            for(FlowerDTO it : cart.keySet()){
          

             %>
            
             <tr>
            <form action="MainServlet">
                <input type="hidden" name="txtid" value="<%=it.getFlowID()%>" style="display: none" />
           
                
                    <td><%=it.getFlowID()%></td>
                    <td><%=it.getFlowName()%></td>
                    <td><img src="<%=it.getImgPath()%>" style="width:100px;height:100px"></td>
                    <td><%=it.getPrice()%></td>
                    <td><input type="number" value="<%=cart.get(it)%>" min="1"max="10" name="txtquantity"></td>
                    <td>
                        <input type="submit" value="update" name="action" class="button">
                        <br/>
                        <input type="submit" value="remove" name="action" class="button">
                    </td>
                    
          </tr>
          
       </form>
                     <%    
                total +=  it.getPrice()*cart.get(it);
                
            %>
            
            <%}%>
             </table>
            <%}%>
            <% if(total!=0){ %>
            
            <p style="text-align: right; font-size: 30px; display: block;color: pink;background-color: black;padding: 10px">
                
                Total: <%= total%></p> <%}%>
            
            <div class="Order" style="clear: both">
                 <h1>Order Information</h1>
             <form action ="MainServlet">
                 <input type="hidden" name="txtTotal" value="<%= total%>"
                 <p>Phone: <input type="text" name="txtphone" value="<%= user.getPhone()%>"></p>
                 <p>Address: <input type="text" name="txtaddress" value="<%=user.getAddress()%>" ></p>
                 <% if(total != 0){%>
                 <p><input type="submit" value="Order" name="action" class="button"></p>
                 <%}%>
             </form>
            </div>
            
             
             
             </br>
            
             <style>
                 
.navbar {
    background-color: black;
    display: flex;
    justify-content: space-between;
    align-items:center;
    padding: 0.5em;
    clear: both;
}

.navbar a {
    color: whitesmoke;
    font-weight: bolder;
    color: pink;
}

.navbar h1 {
    margin-right: 50px;
    list-style-type: none;
    justify-content: center;
    align-items: flex-end;
    color: pink;
}

.navbar .brand {
    display: block;
    color: pink;
    padding: 0 24px;
}

                 table tr th{
    align-content: center;
    width: 200px;    
    height: 70px;
    font-size: 20px;
    border-bottom: 1px;

  
}
table tr td{
    text-align: center;
    align-content: center;
    height: 70px;
    fon-size: 15px;
    
   
}

table{
    margin-top: 60px;
     align-items: 0 auto;
    border: 0 0 0 1;
    
    
}
.button{
    background-color: black;
    color: pink;
    padding: 10px 10px;
   
    margin-bottom: 5px;
    text-align: center;
    


}
.button:hover{
    background-color: pink;
    color: black;
    transition: .5s;
}

.Order{ 
    text-align: center;
    border: solid;
    
}
             </style>
    </body>
</html>
