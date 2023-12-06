<%-- 
    Document   : Signup
    Created on : Oct 22, 2023, 10:28:52 PM
    Author     : ACER
--%>

<%@page import="dto.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link
            href="https://fonts.googleapis.com/css?family=Josefin+Sans:ital,wght@0,100;0,300;0,400;0,500;0,600;0,700;1,100;1,200;1,300;1,400;1,500;1,600;1,700&family=Montserrat:wght@700;800;900&display=swap"
            rel="stylesheet">
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        
        <header>
            <%@include file="UserNavigationBar.jsp" %>
        </header>
        
            <% 
           
            AccountDTO user =(AccountDTO) session.getAttribute("Loginrole");
            request.setAttribute("user", user);
            %>
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
                <form action="MainServlet" method="POST">
                    <input type="hidden" value="<%= user.getAccID()%>" name="txtid"/>
                    <h1 style="font-family: 'Josefin Sans', sans-serif;
                        font-size: 38px;
                        text-align: center;
                        ">Your Profile</h1> 

                    <div style="width: 100%;
                         height: 30px;
                         margin: 30px 0;
                         ">
                        <input class="input_text" type="email" name="txtemail" value="<%= user.getEmail() %>" placeholder="Email" required=/><br>
                        <i class='bx bxs-user'></i>
                    </div>

                    <div style="width: 100%;
                         height: 30px;
                         margin: 30px 0;
                         ">
                        <input class="input_text" type="text" name="txtpass" value="<%= user.getPassword()%>" placeholder="Password"  required=/><br>
                        <i class='bx bxs-lock-alt' ></i>
                    </div>

                    <div style="width: 100%;
                         height: 30px;
                         margin: 30px 0;
                         ">
                        <input class="input_text" type="text" name="txtname"  value="<%= user.getFullname()%>" pattern="[a-z][A-Z]{1,15 placeholder="Full name"  required=/><br>
                        <i class='bx bx-user-pin' ></i>
                    </div>

                    <div style="width: 100%;
                         height: 30px;
                         margin: 30px 0;
                         ">
                        <input class="input_text" type="text" name="txtaddress" value="<%= user.getAddress() %>" placeholder="Address" required=/><br>
                        <i class='bx bx-home-alt-2'></i>
                    </div>

                    <div style="width: 100%;
                         height: 30px;
                         margin: 30px 0;
                         ">
                        <input class="input_text" type="text" name="txtphone" pattern="[0-9]{10}" value="<%= user.getPhone() %>" placeholder="Phone number" required=/><br>
                        <i class='bx bxs-phone' ></i>
                    </div>

                    ${requestScope.ERROR}<br>
                    <input type="submit" value="Update Profile" name="action" class="btn"/>
                </form>
            </div>
        </section>

        <style>
            .input_text::-webkit-input-placeholder { color: white; font-family: 'Josefin Sans', sans-serif; }
            .input_text{
                width: 92.5%;
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
            }
            .bxs-user {position: absolute; right:80px; top:24.3%; transform: translateY(35%); font-size: 20px}
            .bxs-lock-alt {position: absolute; right: 80px; top:34.6%; transform: translateY(35%); font-size: 20px}
            .bx-home-alt-2 {position: absolute; right: 80px; top:55.45%; transform: translateY(35%); font-size: 20px}
            .bx-user-pin {position: absolute; right: 80px; top:45.45%; transform: translateY(35%); font-size: 20px}
            .bxs-phone {position: absolute; right: 80px; top:66%; transform: translateY(35%); font-size: 20px}
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
        </style>

        <footer>
            <%@include file="footer.jsp" %>
        </footer>
    </body>
</html>