<%-- 
    Document   : FlowerManagement
    Created on : Nov 7, 2023, 6:44:56 PM
    Author     : ntmanh
--%>

<%@page import="controller.IMyConstant"%>
<%@page import="dao.FlowerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.FlowerDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower Management</title>
    </head>
    <body style="background-color: #f7e1e1">
      
         <div class="navbar" >
        <a class="brand" style="font-size: 30px;" href="MainServlet?action=<%= IMyConstant.ADMINPAGE_DEFAULT%>">Flower Shop <i class='bx bxs-florist'></i></a>
        <div>
              <form action="" method="post" class="search_bar">
                <input class="search_bar-input" type="text" placeholder="Search here" name="txtsearch" value="${param.txtsearch}">

                <button type="submit" name="action" style="margin-top: 1em; padding-left: 0.3em; border: none; background-color: transparent; cursor: pointer;">
                    <i style="color: #fff; font-weight: bolder; font-size: 2em; top:10%; transform: translateY(27%); " class='bx bx-search'></i>
                </button>

                <br>

                <div style="display: flex; justify-content: flex-end; margin-right: 2.25em; margin-top: 0.5em;">
                    <select style="font-family: 'Josefin Sans', sans-serif;" class="select_search" name="searchby">
                        <option value="byname">Name</option>
                        <option value="bycate">Category</option>
                    </select>
                </div>        </div>
         </div>
                <h1 style="text-align: center; font-size: 50px;">Flower Management</h1>
                <hr style="width: 90%">
                
              
         <% 
          String keyword = request.getParameter("txtsearch");
                    String searchby = request.getParameter("searchby");
                    ArrayList<FlowerDTO> list;
                    if (keyword == null && searchby == null) {
                        list = FlowerDAO.getFlowers("", "");
                    } else {
                        list = FlowerDAO.getFlowers(keyword, searchby);
                    }
                    if (list != null && !list.isEmpty()) {
                      
         %>
       
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Image</th>
                <th>Price</th>
                <th>Status</th>
                <th>Categories</th>
                 </tr>
                 <%
                        for (FlowerDTO f : list) {
                %>
                <tr>
                    <form action="MainServlet">
                    <input type="hidden" name="txtid" value="<%= f.getFlowID() %>">
                    
                    <td><%= f.getFlowID() %></td>
                    <td><input type="text" value="<%= f.getFlowName()%>" name="txtFlowName"  pattern="[A-Za-z]{5-30}"></td>
                    <td style="width: 10%"><img src="<%=f.getImgPath()%>" style="width: 100%; border-radius: 0.8em" alt="Flower Image"></td>
                   
                    <td><input value="<%= f.getPrice()%>" name="txtFlowPrice" type="number" min="50000" max="1000000"></td>
                    
                    <% if(f.getStatus() == 0){%>
                    <td>Out of stock</td>
                    <%}else{%>
                    <td>In stock</td>
                    <%}%>
                    <td><%= f.getCatename()%><td>
                   
                    <td><input class="button" type="submit" value="Update Flower" name="action"/></td>
                    
                    <% if(f.getStatus() == 0){%>
                    <td><input class="button" type="submit" value ="Restock Flower" name="action"/></td>
                    <input class="button" type="hidden" value="1" name="txtstatus"/>
                    <%}else{%>
                    <td><input class="button" type="submit" value="Delete Flower" name="action"/></td>
                    <input class="button" type="hidden" value="0" name="txtstatus"/>
                    <%}%>
                    
                    
                    
                    
                    </td>
                    </form>    
                </tr>
           
            <% }
}
else { %>
    <h1></h1>
    <% } %>

        </table>
    <a class="button" href="MainServlet?action=<%=IMyConstant.DETAILFLOWER%>" style="display: block;text-align: center; text-decoration: none; font-size: 30px">New Flower</a>
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
.search_bar-input::-webkit-input-placeholder { 
                        color: black; 
                        font-family: 'Josefin Sans', sans-serif; 
                    }

                    .search_bar-input{
                        padding: 0.5em;
                        padding-left: 1.2em;
                        border: none;
                        background-color: #e7e7e7;
                        border-radius: 2em;
                        height: 20px;
                    }

                    .select_search{
                        padding: 0.5em;
                        border: none;
                        background-color: #e7e7e7;
                        border-radius: 2em;
                        height: 30px;
                    }
             </style>

                   
    </body>
</html>
