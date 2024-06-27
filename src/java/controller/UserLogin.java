/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.*;

/**
 *
 * @author Admin
 */
public class UserLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            request.getRequestDispatcher("index.html").forward(request, response);
        }
        String username = request.getParameter("username");
        String password = request.getParameter("pass");
        response.setContentType("text/html;charset=utf-8");
        UserDAO userDao = new UserDAO();
        String error;
        User user = userDao.getByUsernamePassword(username, password);
        if (user == null) {
            error = "Wrong username or password";
            request.setAttribute("error", error);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else if (username != null && password != null) {
            String role = user.getRole();
            //luu vao session
            session.setAttribute("user", user);
                if (role != null && !role.isEmpty()) {
                    if (role.equalsIgnoreCase("admin")) {
                        request.getRequestDispatcher("AdminPage.jsp").forward(request, response);
                    } else if (role.equalsIgnoreCase("user")) {
                        request.getRequestDispatcher("UserPage.jsp").forward(request, response);
                    } else if (role.equalsIgnoreCase("Staff")) {
                        request.getRequestDispatcher("Staff.jsp").forward(request, response);
                    }
                }
        }
    }
}
