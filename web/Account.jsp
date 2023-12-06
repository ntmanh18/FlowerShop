<%-- 
    Document   : Account
    Created on : Dec 5, 2023, 2:31:35 AM
    Author     : ntmanh
--%>

<%@page import="controller.IMyConstant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.AccountDTO"%>
<%@page import="dto.AccountDTO"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Manage</title>
    </head>
    <body style="background-color: #f7e1e1;">
        <%
           ArrayList<AccountDTO> userList=UserDAO.getAllAccount();
           if(userList != null){
        %>
         <div class="navbar" >
        <a class="brand" style="font-size: 30px;" href="MainServlet?action=<%= IMyConstant.ADMINPAGE_DEFAULT%>">Flower Shop <i class='bx bxs-florist'></i></a>
        <h1 style="clear: both">User Management</h1>
         </div>
        <table>
        
            <tr>
                <th>ID</th>
                <th>Role</th>
                <th>Email</th>
                <th>Name</th>
                <th>Address</th>
                <th>Phone</th>
                <th>Status</th>
                <th></th>
            </tr>
            <% for(AccountDTO user:userList){ %>
            
            <tr>
                 <form action="MainServlet">
                 <input type="hidden" name="txtid" value="<%=user.getAccID() %>">
                <td><%=user.getAccID()%></td>
               
                <% if(user.getRole() == 0) {%>
               <td>Admin</td><%}else{%>
               <td>User</td><%}%>
                
                <td><%=user.getEmail()%></td>
                <td><%=user.getFullname()%></td>
                <td><%=user.getPhone()%></td>
                 <% if(user.getStatus()== 0) {%>
                 <td style="color: red">Blocked</td><%}else{%>
               <td>Active</td><%}%>
               <% if(user.getStatus() == 1) {%>
               <td><input class="button" type="submit" name="action" value="Disable"/>
                   <input class="button" type ="hidden" value="0" name="setstatus"/>
               </td><%}else{%>
               <td><input class="button" type="submit" name="action" value="Undisable"/>
               <input class="button" type ="hidden" value="1" name="setstatus"/></td><%}%>
               

                </form>
            </tr>
            <%}%>
                 
        </table>
        <%}else{%>
        <h1>There is no user</h1>
        <%}%>
       
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
