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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.User;

/**
 *
 * @author 84777
 */
public class ListUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListUser</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        ArrayList<User> list = userDAO.getAll();
        HttpSession session = request.getSession();
        
        //Phân quyền: chỉ tài khoản đã đăng nhập và là tài khoản admin mới được truy xuất vào
        if (session.getAttribute("user") == null) {
            request.setAttribute("error", "Please login first");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            User checkUserRole = (User) session.getAttribute("user");
            if(!checkUserRole.getRole().equalsIgnoreCase("admin")) {
               request.setAttribute("error", "Your account do not have permission to access");
               session.removeAttribute("user");
               request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                String msg = (String) request.getAttribute("msg");
                request.setAttribute("msg", msg);
                request.setAttribute("allUser", list);
                request.getRequestDispatcher("ListUser.jsp").forward(request, response);
            }
        }
        // Search by name
        String searchName = request.getParameter("name");
        if (searchName != null) {
            ArrayList<User> searchedList = new ArrayList<>();
            for (User user : list) {
                if (user.getUsername().toLowerCase().contains(searchName.toLowerCase())) {
                    searchedList.add(user);
                }
            }
            request.setAttribute("list", searchedList);
            request.setAttribute("name", searchName);
        } else {
            request.setAttribute("list", list);
        }
        
        request.getRequestDispatcher("ListUser.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
