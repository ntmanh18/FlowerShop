    <%-- 
    Document   : UserNavigationBar
    Created on : Oct 20, 2023, 10:58:18 PM
    Author     : Tuan Hung
--%>

<%@page import="controller.IMyConstant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UserNavigationBar Page</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link
            href="https://fonts.googleapis.com/css?family=Josefin+Sans:ital,wght@0,100;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Montserrat:wght@700;800;900&display=swap"
            rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <nav class="navbar">

            <a class="brand" style="font-size: 31px;" href="MainServlet?action=<%= IMyConstant.USERPAGE_DEFAULT%>">Flower Shop <i class='bx bxs-florist'></i></a>

            <ul>
                <li>
                    <a href="MainServlet?action=<%= IMyConstant.USERPAGE_DEFAULT%>" style="font-size: 23px;"><i class='bx bxs-home'></i> Home</a>
                </li>

                <li>
                    <a href="MainServlet?action=<%= IMyConstant.PROFILE%>" style="font-size: 22px;"><i class='bx bxs-user-circle' ></i> Profile</a>
                </li>

                <li>
                    <a href="MainServlet?action=<%= IMyConstant.SEARCHORDER%>&order=0" style="font-size: 22px;"><i class='bx bxs-spreadsheet'></i> Orders</a>
                </li>

                <li>
                    <a href="MainServlet?action=<%=IMyConstant.VIEWCART%>" style="font-size: 22px;"><i class='bx bxs-cart'></i> View Cart</a>
                </li>

                <li>
                    <a href="MainServlet?action=<%= IMyConstant.LOGOUT%>" style="font-size: 22px;"><i class='bx bx-log-out' ></i> Logout</a>
                </li>     
            </ul>

            <form action="" method="post" class="search_bar">
                <input class="search_bar-input" type="text" placeholder="Search here" name="txtsearch" value="${param.txtsearch}">

                <button type="submit" name="action" style="margin-top: 1em; padding-left: 0.3em; border: none; background-color: transparent; cursor: pointer;">
                    <i style="color: #e7e7e7; font-weight: bolder; font-size: 2em; top:10%; transform: translateY(27%); " class='bx bx-search'></i>
                </button>

                <br>

                <div style="display: flex; justify-content: flex-end; margin-right: 2.25em; margin-top: 0.5em;">
                    <select style="font-family: 'Josefin Sans', sans-serif;" class="select_search" name="searchby">
                        <option value="byname">Name</option>
                        <option value="bycate">Category</option>
                    </select>
                </div>

                <style>
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
            </form>

        </nav>
    </body>
</html>
