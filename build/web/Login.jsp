<%-- 
    Document   : Login
    Created on : Jun 13, 2024, 12:04:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="Login.css">

    </head>
    <%
        String error = (String) request.getAttribute("error");
        String username = request.getParameter("username");
    %>
    <body>
        <div class="login_page">
            <div class="head">
                <h1>Welcome!</h1> 
            </div>
            <div>
                <p style="color: red; font-size: 20px; font-style: italic; font-weight: bold"><%=error == null ? "" : error%></p>
            </div>
            <div>
                <div id="form_login">
                    <form class="bieumau" method="post" action="user">
                        <div class="container-input">
                            <input id="custom-input-user" class="nhap" placeholder="Username" type="text" name="username" value = <%=username != null ? username : ""%>><br />
                        </div>
                        <div class="container-input">
                            <input id="custom-input-pass" placeholder="Password" class="nhap" type="password" name="pass"><br />
                        </div>
                        <input class="login" type="submit" value="Login">
                        <div class="remember_me">
                            <input class="csscheck" type="checkbox" name="remember" id="nho">
                            <label for="nho">Remember me</label><br />
                            <div class="sign_up">
                                <p>You don't have account ? <a href="SignUp.jsp">Sign up</a></p>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

</html>
