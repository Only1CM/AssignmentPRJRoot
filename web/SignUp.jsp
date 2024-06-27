<%-- 
    Document   : SignUp
    Created on : Jun 13, 2024, 1:04:59 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="SignUp.css.css">

    </head>
    <% String message=(String) request.getAttribute("message"); %>

    <body>
        <div class="login_page">
            <div class="head">
                <h1>Welcome to sign up!</h1>
            </div>
            <div>
                <p style="color: red; font-size: 20px; font-style: italic; font-weight: bold"><%=message != null && !message.equals("") ? message : "" %></p>
            </div>
            <div>
                <div id="form_login">
                    <form class="bieumau" method="post" action="UserSignUp">
                        <div class="full_name">
                            <input id="first" placeholder="First name" class="nhap" type="text" name="first_name">
                            <input id="last" placeholder="Last name" class="nhap" type="text" name="last_name">
                        </div>
                        <div class="container-input">
                            <input id="custom-input-user" placeholder="Phone number" class="nhap" type="text"
                                   name="phone">
                        </div>
                        <div class="container-input">
                            <input id="custom-input-user" placeholder="Email" class="nhap" type="text" name="email">
                        </div>
                        <div class="container-input">
                            <input id="custom-input-user" placeholder="Username" class="nhap" type="text"
                                   name="username"><br />
                        </div>
                        <div class="container-input">
                            <input id="custom-input-pass" placeholder="Password" class="nhap" type="password"
                                   name="pass"><br />
                            <input type="hidden" name="roles" value="user">

                        </div>
                        <div class="container-input">
                            <input id="custom-input-re-pass" placeholder="Re-enter password" class="nhap"
                                   type="password" name="re-pass"><br />
                        </div>
                        <input class="login" type="submit" value="Submit">
                    </form>
                    <a href="Login.jsp"> <button class="button-back-to-login">Back to login</button>
                </div>
            </div>
        </div>
    </body>
</html>