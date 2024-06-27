/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author 84777
 */
public class Test2 extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet Test2</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Test2 at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String msg = request.getParameter("msg");
        ServletContext context = getServletContext();
        context.setAttribute("msg", msg);
        request.getRequestDispatcher("Header.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("_method");
        if (method != null && method.equalsIgnoreCase("delete")) {
            doDelete(request, response);
        } else {
            String msg = request.getParameter("msg");
            ServletContext context = getServletContext();
            context.setAttribute("msg", msg);
            request.getRequestDispatcher("Header.jsp").forward(request, response);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         ServletContext context = getServletContext();
        List<String> hurryMSG = (List<String>) context.getAttribute("hurryMSG");
        if (hurryMSG != null) {
            String msgIndexStr = request.getParameter("msgIndex");
            if (msgIndexStr != null) {
                int msgIndex = Integer.parseInt(msgIndexStr);
                if (msgIndex >= 0 && msgIndex < hurryMSG.size()) {
                    hurryMSG.remove(msgIndex);
                }
            }
        }
        response.sendRedirect("Header.jsp"); // Redirect to the JSP after deleting the message
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
