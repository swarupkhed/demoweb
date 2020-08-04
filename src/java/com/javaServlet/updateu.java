/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaServlet;

import com.connection.connectionProvider;
import com.connection.helper;
import com.dao.UserDao;
import com.entities.Message;
import com.entities.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.InputStream;

/**
 *
 * @author classic
 */
@MultipartConfig
public class updateu extends HttpServlet {

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
            out.println("<title>Servlet updateu</title>");            
            out.println("</head>");
            out.println("<body>");
               String name=request.getParameter("uname");
               String email=request.getParameter("uemail");
               String mobileno=request.getParameter("umobile");
           
               Part part=request.getPart("upic");
               String oldname=request.getParameter("upic");
               String imagename=part.getSubmittedFileName();
               
               
               
               
               // get user from session
               
               HttpSession s=request.getSession();
               
               User user=(User)s.getAttribute("currentuser");
               
               user.setName(name);
               user.setEmail(email);
               user.setMobile_no(mobileno);
               user.setProfile(imagename);
               
               //update data
               
               UserDao dao=new UserDao(connectionProvider.getConnection());
               if(dao.updateuser(user)){
                   Message ms=new Message("user profile details updated", "success", "alert-success");
                    s.setAttribute("msg",ms);
                    response.sendRedirect("profile.jsp");
                   
//                   String path=request.getRealPath("/")+"pic"+File.separator+user.getProfile();
//           
//                   if(helper.savefile(part.getInputStream(), path)){
//                      out.println("profile updated....");
//                  }
               }
               
               else{
                   out.println("database not submitted");
               }
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(updateu.class.getName()).log(Level.SEVERE, null, ex);
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
