<%-- 
    Document   : Navigation
    Created on : Oct 6, 2023, 3:49:35 PM
    Author     : Tuan Hung
--%>

<%@page import="controller.IMyConstant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link
            href="https://fonts.googleapis.com/css?family=Josefin+Sans:ital,wght@0,100;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Montserrat:wght@700;800;900&display=swap"
            rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <nav class="navbar">

            <a class="brand" style="font-size: 30px;" href="MainServlet?action=<%= IMyConstant.DEFAULT%>">Flower Shop <i class='bx bxs-florist'></i></a>

            <ul>
                <li>
                    <a href="MainServlet?action=<%= IMyConstant.DEFAULT%>" style="font-size: 23px;"><i class='bx bxs-home'></i> Home</a>
                </li>
                <li>
                    <a href="MainServlet?action=<%= IMyConstant.SIGNUP %>" style="font-size: 23px;"><i class='bx bxs-edit-alt'></i> Register</a>
                </li>
                <li>
                    <a href="MainServlet?action=<%= IMyConstant.LOGINPAGE%>" style="font-size: 23px;"><i class='bx bx-log-in'></i> Login</a>
                </li>
                <li>
                    <a onclick="myFunction()"  style="font-size: 23px; cursor: pointer;"><i class='bx bxs-cart'></i> View Cart</a>
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
                      #snackbar {
                        visibility: hidden;
                        min-width: 250px;
                        margin-left: -125px;
                        background-color: black;
                        color: #fff;
                        text-align: center;
                        border-radius: 1.5em;
                        padding: 26px;
                        position: fixed;
                        z-index: 1;
                        left: 44.5%;
                        bottom: 30px;
                        font-size: 17px;
                        font-weight: bold;
                    }

                    #snackbar.show {
                        visibility: visible;
                        -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                        animation: fadein 0.5s, fadeout 0.5s 2.5s;
                    }

                    @-webkit-keyframes fadein {
                        from {bottom: 0; opacity: 0;} 
                        to {bottom: 30px; opacity: 1;}
                    }

                    @keyframes fadein {
                        from {bottom: 0; opacity: 0;}
                        to {bottom: 30px; opacity: 1;}
                    }

                    @-webkit-keyframes fadeout {
                        from {bottom: 30px; opacity: 1;} 
                        to {bottom: 0; opacity: 0;}
                    }

                    @keyframes fadeout {
                        from {bottom: 30px; opacity: 1;}
                        to {bottom: 0; opacity: 0;}
                    }
                

                </style>
            </form>

        </nav>
                 <script>
            function myFunction() {
                var x = document.getElementById("snackbar");
                x.className = "show";
                setTimeout(function () {
                    x.className = x.className.replace("show", "");
                }, 3000);
            }
        </script>

        <a id="snackbar" href="MainServlet?action=<%= IMyConstant.LOGINPAGE%>" >Please log in to use this feature <i class='bx bx-pointer'></i></a>


    </body>
</html>
