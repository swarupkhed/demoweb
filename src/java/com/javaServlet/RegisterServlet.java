/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaServlet;

import com.connection.connectionProvider;
import com.dao.UserDao;
import com.entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@ WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Thread.sleep(2000);

            String ch = request.getParameter("ucheck");
            String name = request.getParameter("uname");
            String mobile_no = request.getParameter("umobile");
            String email = request.getParameter("uemail");
            String password = request.getParameter("upass");
            String state = request.getParameter("ustate");
            String gender = request.getParameter("ugender");
            if (ch == null) {
                out.println("box not checked");
            }
            if(email.isEmpty()|| password .isEmpty() || name.isEmpty())
            {
                out.println("empty");
            }
            else{
                
                User us = new User(name, mobile_no, email, password, state, gender);

                UserDao userd = new UserDao(connectionProvider.getConnection());
              
                if (userd.saveuser(us)) {
                    out.println("done");

                }

            }

        }
        catch(Exception e){
            e.printStackTrace();
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
        processRequest(request, response);
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
