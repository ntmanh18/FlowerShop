<%-- 
    Document   : AdminNavigationBar
    Created on : Oct 21, 2023, 12:18:51 AM
    Author     : Tuan Hung
--%>

<%@page import="controller.IMyConstant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdminNavigationBar Page</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link
            href="https://fonts.googleapis.com/css?family=Josefin+Sans:ital,wght@0,100;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Montserrat:wght@700;800;900&display=swap"
            rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <a style="display: flex; 
           justify-content: center;
           color: #e7e7e7;
           font-size: 36px;
           margin-top: 1em;
           font-weight: bold;" 
           href="">Flower Shop <i style='margin-left: 10px; font-size: 32px;' class='bx bxs-florist'></i>
        </a>
        
        <nav class="Admin_navbar">

            <ul>
                <li>
                    <a href="MainServlet?action=<%=IMyConstant.MANGEUSER %>" style="font-size: 28px;"><i class='bx bxs-user-account'></i> Account</a>
                </li>

                <li>
                    <a href="MainServlet?action=<%= IMyConstant.ORDERMANAGE %>" style="font-size: 28px;"><i class='bx bxs-spreadsheet' ></i> Orders</a>
                </li>

                <li>
                    <a href="MainServlet?action=<%= IMyConstant.MANAGEFLOWER%> "  style="font-size: 28px;"><i class='bx bx-store-alt'></i> Plants</a>
                </li>

               
                
                <li>
                    <a href="MainServlet?action=<%= IMyConstant.LOGOUT%>" style="font-size: 28px;"><i class='bx bx-log-out' ></i> Logout</a>
                </li>  
            </ul>

            <style>
                .Admin_navbar{
                    background-color: transparent;
                    display: flex;
                    justify-content: center;
                    align-items:center;
                    padding: 0.5em;
                }

                .Admin_navbar a {
                    color: #e7e7e7;
                    font-weight: bolder;
                }

                .Admin_navbar ul {
                    margin: 0;
                    padding: 0;
                    list-style-type: none;
                    display: flex;
                    justify-content: center;
                }
                
                .Admin_navbar li {
                    padding: 0 30px;
                }

                .Admin_navbar ul li a {
                    color: #e7e7e7;
                    padding: 24px;
                    display: block;
                    transition: ease-in-out 0.5s;
                }

                .Admin_navbar ul a:hover,
                .Admin_navbar ul a:focus {
                    color: black;
                    transition: ease-in-out 0.5s;
                }
            </style>
        </nav>


    </body>
</html>
