<%-- 
    Document   : Header
    Created on : Jun 23, 2024, 12:10:31 PM
    Author     : 84777
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <c:if test="${user.role == 'admin' || user.role == 'staff'}">
                <c:forEach var="msg" items="${hurryMSG}" varStatus="status">
                    <c:if test="${msg != null}">
                        <form action="Test2" method="post">
                            <input type="hidden" name="_method" value="DELETE">
                            <input type="hidden" name="msgIndex" value="${status.index}">
                            <div class="alert alert-success m-2 alert-dismissible" role="alert">
                                ${msg}
                                <input type="submit" aria-label="Close"></input>
                            </div>
                        </form>
                    </c:if>
                </c:forEach>
            </c:if>
        </div>
        <hr>
    </body>
</html>
