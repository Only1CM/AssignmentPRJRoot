/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.User;

/**
 *
 * @author 84777
 */
public class UserSignUp extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserSignUp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserSignUp at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("pass");
        String rePassword = request.getParameter("re-pass");

        //check tài khoản mật khẩu
        if (password.equals(rePassword)) {
            if (username != null && password != null && !username.equals("") && !password.equals("")) {
                if (!username.contains("_")) {
                    UserDAO adminDAO = new UserDAO();
                    User usernameCheck = adminDAO.getByUsername(username);
                    if (usernameCheck == null) {
                        User newUser = new User(username, password, "User");
                        adminDAO.add(newUser);
                        request.setAttribute("message", "Sign-up successfully!");
                        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "Account already exists");
                        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("message", "Please don't use _ in username");
                    request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("message", "Enter again");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "Re-password is not match with password");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
        }
    }

}
