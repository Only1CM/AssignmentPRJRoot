<%-- 
        Document   : CheckStaffRole
    Created on : Jun 22, 2024, 2:15:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%
    if (session.getAttribute("user") == null) {
        request.setAttribute("error", "Please login first");
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    } else {
        User checkUser = (User) session.getAttribute("user");
        if (!checkUser.getRole().equalsIgnoreCase("staff") && !checkUser.getRole().equalsIgnoreCase("admin")) {
            request.setAttribute("error", "Your account do not have permission to access");
            session.removeAttribute("user");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
%>