<%-- 
    Document   : ChangPassword
    Created on : Jun 22, 2024, 5:55:54 PM
    Author     : Admin
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : Login
    Created on : Jun 13, 2024, 12:04:48 PM
    Author     : Admin
--%>
<!DOCTYPE html>
<html>

    <head>
        <title>Change Password</title>
        <meta charset="UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="ChangePassword.css">

    </head>
    <%
        String success = (String) request.getAttribute("success");
        User userChangePass = (User) session.getAttribute("user");
        String usernameChangePass = userChangePass.getUsername();
    %>
    <body>
        <div class="login_page">
            <div class="head">
                <h1>Change Password</h1>
            </div>
            <div>
                <p style="color: red; font-size: 20px; font-style: italic; font-weight: bold"><%=success != null && !success.equals("") ? success : "" %></p>
            </div>
            <div>
                <div id="form_login">
                    <form class="bieumau" method="post" action="ChangePassword">
                        <div class="container-input">
                            <input id="custom-input-user" placeholder="Username" class="nhap" type="text" name="username" value="<%=usernameChangePass%>"><br />
                        </div>
                        <div class="container-input">
                            <input id="custom-input-pass" placeholder="Old Password" class="nhap" type="password" name="pass"><br />
                            <input type="hidden" name="roles" value="user">

                        </div>
                        <div class="container-input">
                            <input id="custom-input-re-pass" placeholder="New password" class="nhap" type="password" name="new-pass"><br />
                        </div>
                        <div class="container-input">
                            <input id="custom-input-re-pass" placeholder="Re-enter new password" class="nhap" type="password" name="re-newpass"><br />
                        </div>
                        <input class="login" type="submit" value="Submit">
                    </form>  
                    <a href="Login.jsp"> <button class="button-back-to-login">Back to login</button>
                </div>
            </div>
        </div>
    </body>

</html>



