<%-- 
    Document   : flowerDetail
    Created on : Dec 4, 2023, 9:40:30 PM
    Author     : ntmanh
--%>

<%@page import="controller.IMyConstant"%>
<%@page import="controller.IMyConstant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.CategoryDTO"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower Detail</title>
    </head>
  <body style="background: #f7e1e1">
        <nav class="navbar">
            
<a class="brand" style="font-size: 30px;" href="MainServlet?action=<%= IMyConstant.ADMINPAGE_DEFAULT%>">Flower Shop <i class='bx bxs-florist'></i></a>
  
<a href="MainServlet?action=<%= IMyConstant.MANAGEFLOWER %> ">Other Orders</a>
        </nav>
         <h1 style="font-size: 50px; text-align: center">New Flower </h1>
        <div class="Flower">
            
            <form action="MainServlet" style="padding: 30px ">
            <div>Flower: <input type="text" name="txtFlowName" required=""/></div>
            <div>Price: <input name="txtFlowPrice" type="number" min="50000" max="1000000" required=""></div>
            <div>Image: <input type="text" name="txtFlowImg" value="images\default.png"/></div>
            <div> Description: <input type="text" name="txtFlowDesc"></div>
            <div>Status
                <select name="status">
                    <option value="1">In stock</option>
                    <option value=0"">Out of Stock</option>
                </select>
            </div>
            
            <div>
                Category
                <select name="category">
                    <% ArrayList<CategoryDTO> cateList;
                    cateList = CategoryDAO.getCategory();
                    for(CategoryDTO cate:cateList){
                    %>
                    <option value="<%=cate.getCateID()%>"><%=cate.getCateName()%></option>
                    <%}%>
                </select>
            </div>
                <div><input class="button" type="submit" value="Add Flower" name ="action"></div>
                
        </form>
        </div>
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
.Flower{
    width: 700px;
    border: solid;
    margin: 0 auto;
   
}

.Flower div{
   padding: 10px 40px;
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
