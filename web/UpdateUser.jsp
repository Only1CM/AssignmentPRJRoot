<%-- 
    Document   : UpdateUser
    Created on : Jun 19, 2024, 6:04:48 PM
    Author     : 84777
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="d-flex justify-content-center">
            <div>
                <h1>Update person</h1>
                <form action="UpdateUser" method="post" class="form-min-width">
                    <input type="hidden" name="user_id" value="${user_id}">

                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" name="username" class="form-control" id="username" placeholder="username" value="${person.username}" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="password" value="${person.password}" required>
                    </div>

                    <div class="mb-3">
                        <label for="age" class="form-label">Role:</label><br>
                            <input type="radio" id="admin" name="choose" value="admin">
                            <label for="admin">Admin</label>
                            <input type="radio" id="staff" name="choose" value="staff">
                            <label for="staff">Staff</label>
                            <input type="radio" id="user" name="choose" value="user">
                            <label for="user">User</label>
                    </div>

                    <input type="submit" class="btn btn-primary" value="Update" />
                </form>
            </div>
        </div>
    </body>
</html>
