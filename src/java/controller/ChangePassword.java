/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import dal.*;

/**
 *
 * @author Admin
 */
public class ChangePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            request.setAttribute("error", "Please login first");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            String newPassword = request.getParameter("new-pass");
            String reNewPassword = request.getParameter("re-newpass");
            String oldPassword = request.getParameter("pass");
            String username = request.getParameter("username");
            UserDAO userDAO = new UserDAO();
            User userChangePass = (User) session.getAttribute("user");
            if (!oldPassword.equals(userChangePass.getPassword())) {
                request.setAttribute("success", "Old password is not correct");
                request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
            } else {
                if (!newPassword.equals(reNewPassword)) {
                    request.setAttribute("success", "New password is not match with re-new password");
                    request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
                } else {
                    userDAO.changePassword(userChangePass, newPassword);
                    request.setAttribute("success", "Password is changed successfully!");
                    request.getRequestDispatcher("ChangePassword.jsp").forward(request, response);
                    session.removeAttribute("user");
                }
            }
        }
    }
}
