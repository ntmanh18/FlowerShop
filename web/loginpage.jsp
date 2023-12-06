<%-- 
    Document   : loginpage
    Created on : Oct 14, 2023, 11:25:01 AM
    Author     : Tuan Hung
--%>

<%@page import="controller.IMyConstant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Josefin+Sans:ital,wght@0,100;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Montserrat:wght@700;800;900&display=swap"
            rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <section style="display: flex;
                 justify-content: center;
                 align-items: center;
                 min-height: 100vh;
                 ">
            <div 
                style="width: 420px;
                background: transparent;
                border: 2px solid rgba(255, 255, 255, .2);
                color: white;
                position: relative;
                border-radius: 2em;
                padding: 4em;
                backdrop-filter: blur(20px);
                "
                >
                <form action="MainServlet?action=<%= IMyConstant.LOGIN%>" method="POST">
                    <h1 style="font-family: 'Josefin Sans', sans-serif;
                        font-size: 38px;
                        text-align: center;
                        ">
                        Login
                    </h1>

                    <div style="width: 100%;
                         height: 50px;
                         margin: 30px 0;
                         ">
                        <input type="text" name="txtemail" class="PH" placeholder="Email" required=""
                               style="width: 92.5%;
                               height: 100%;
                               background: transparent;
                               border: none;
                               outline: none;
                               border: 1.5px solid rgba(255, 255, 255, .2);
                               border-radius: 2em;
                               font-size: 16px;
                               color: white;
                               padding: 0.5em;
                               padding-left: 1.6em;
                               ">
                       
                    </div>

                    <div style="width: 100%;
                         height: 50px;
                         margin: 30px 0;
                         ">
                        <input type="password" name="txtpassword" class="PH" placeholder="Password" required=""
                               style="width: 92.5%;
                               height: 100%;
                               background: transparent;
                               border: none;
                               outline: none;
                               border: 1.5px solid rgba(255, 255, 255, .2);
                               border-radius: 2em;
                               font-size: 16px;
                               color: white;
                               padding: 0.5em;
                               padding-left: 1.6em;
                               ">
                       
                    </div>

                    <style>
                        .PH::-webkit-input-placeholder { color: white; font-family: 'Josefin Sans', sans-serif; }
                        .bxs-user {position: absolute; right:80px; top:31.8%; transform: translateY(35%); font-size: 20px}
                        .bxs-lock-alt {position: absolute; right: 80px; top:47%; transform: translateY(72%); font-size: 20px}
                        .btn { 
                            width: 100%; 
                            height: 45px; 
                            background: white; 
                            border: none; 
                            outline: none; 
                            border-radius: 2em; 
                            box-shadow: 0 0 10px rgba(0, 0, 0, .1); 
                            cursor: pointer; 
                            font-size: 16px; 
                            color: #333; font-weight: bold; 
                            font-family: 'Josefin Sans', sans-serif; 
                            margin-top: 1em;
                            transition: ease-in-out 0.3s;
                        }
                        .btn:hover {background-color: black; color: white; transition: ease-in-out 0.3s; }
                        .register_link{font-size: 14.5px; text-align: center; margin-top: 20px; }
                        div.register_link a{color: white; font-weight: 900; transition: ease-in-out 0.3s;}
                        div.register_link a:hover { 
                            color:black;
                            transition: ease-in-out 0.3s;
                        }
                    </style>

                    <br>
                    <button type="submit" class="btn">Login</button>
                     <%
            String s = (String)request.getAttribute("THONGBAO");
          if(s!=null){
              %>
             <div style="text-align: center; background-color: black; color: yellow;margin:15px;padding: 20px; font-size: 20px;border-radius: 20px">Invalid User name or password</div>
              <% } %>
                     
                    <div class="register_link">
                        <p>Don't have an account? <a href="MainServlet?action=<%= IMyConstant.SIGNUPPAGE%>"> Register here </a></p>
                    </div>
                </form>
                   
            </div>
                    
        </section>

        
              
        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>
