<%-- 
    Document   : List
    Created on : Jun 19, 2024, 4:41:31 PM
    Author     : 84777
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <%@include file="CheckAdminRole.jsp" %>
            <div style="min-width: 400px">
                <h1 class="mt-5 mb-3">User</h1>
                <a href="AdminPage.jsp"><button>Back to main page</button></a>

                <br/>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${allUser}">
                            <tr>
                                <td>${user.user_id}</td>
                                <td>${user.username}</td>
                                <td>${user.password}</td>
                                <td>${user.role}</td>
                                <td style="text-align: center">
                                    <form action="UpdateUser" method="GET">
                                        <input type="hidden" name="user_id" value="${user.user_id}">
                                        <button type="submit" class="btn btn-light">🖊</button>
                                    </form>
                                </td>
                                <td style="text-align: center">
                                    <form action="DeleteUser" method="POST">
                                        <input type="hidden" name="user_id" value="${user.user_id}">
                                        <button type="submit" class="btn btn-light">✖</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <p>${msg}</p>
                <c:set var="msg" value="${null}" scope="session"></c:set>
            </div>
        </div>
    </body>
</html>
