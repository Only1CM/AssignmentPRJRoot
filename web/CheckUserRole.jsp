<%-- 
    Document   : CheckUserRole
    Created on : Jun 27, 2024, 12:20:12 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        request.setAttribute("error", "Please login first");
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    } else {
        User checkUser = (User) session.getAttribute("user");
        if (!checkUser.getRole().equalsIgnoreCase("User")) {
            request.setAttribute("error", "Your account do not have permission to access");
            session.removeAttribute("user");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
%>
