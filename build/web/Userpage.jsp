<%-- 
    Document   : Userpage
    Created on : Oct 21, 2023, 12:13:10 AM
    Author     : Tuan Hung
--%>

<%@page import="dao.FlowerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.FlowerDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home for Flower Lover</title>
    </head>
    <body>

        <header>
            <%@include file="UserNavigationBar.jsp" %>
        </header>

        <h2 style="color: white; display: flex; justify-content: center;">Welcome back </h2>
        
        <section>           
            <div class="container">
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
                        for (FlowerDTO f : list) {
                %>
                
                 <div class="card">
                    
                    <form action="MainServlet">
                    <input type="hidden" name="txtid" value="<%= f.getFlowID() %>">
                    <img src="<%=f.getImgPath()%>" style="width: 100%; border-radius: 0.8em" alt="Flower Image">
                    <h2 style="text-align: center; margin-top: 0.5em;"><%=f.getFlowName()%></h2>
                    <h5 style="text-align: center; margin-top: 0.5em;"><%=f.getCatename()%></h5>
                    <br>
                    <p style="text-align: center; margin-top: 0.5em;"><%=f.getPrice()%></p>

                    <div style="display: flex; justify-content: center;">
                       <% if(f.getStatus()==1){%>
                       <div><input type="submit" class="add-to-cart" value="Add to cart" name="action"/>
</div>
<%} else{%>
<div class="add-to-cart" style="background-color: red"/>Out of stock
</div>
<%}%>

<!--                        <p><a href="MainServlet?action="><button class="add-to-cart">Add to Cart <i class='bx bxs-cart' style="font-size: 12px; margin-left: 0.2em; "></i></button></a></p>-->
                    </div>
                    <br>
                    <p class="description"><%=f.getDescription()%></p>
                    </form>
                    
                </div>

                <style>
                    .add-to-cart{
                        font-family: 'Josefin Sans', sans-serif; 
                        background-color: blue;
                        color: white;
                        padding: 8px 16px;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                        transition: ease-in-out 0.3s;
                        display: flex;
                        justify-content: center;
                    }

                    .add-to-cart:hover{
                        transition: ease-in-out 0.3s;
                        background-color: darkblue;
                    }

                    .description{
                        margin-left: 1em; 
                        margin-right: 1em;  
                        margin-top: 0.5em; 
                        padding-bottom: 1em;
                    }
                </style>

                <%
                        }
                    }
                %>
            </div>
        </section>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>

    </body>
</html>
