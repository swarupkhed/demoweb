/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javaServlet;

import com.connection.connectionProvider;
import com.connection.helper;
import com.dao.PostDao;
import com.entities.User;
import com.entities.post;
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

/**
 *
 * @author classic
 */
@MultipartConfig
public class addpostt extends HttpServlet {

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

//            get data from post modal
            String ptitle=request.getParameter("ptitle");
            String pcontent=request.getParameter("pcontent");
            String pcode=request.getParameter("pcode");
            Part part=request.getPart("ppic");
            String imname=part.getSubmittedFileName();
//            foreign key indexed to category id
            int catid=Integer.parseInt(request.getParameter("cate"));
//            getting user info from thier session
            HttpSession s=request.getSession();
            
            User user=(User)s.getAttribute("currentuser");
            
//            create object of entities post class to get all info 
//         pass value to object
            
             post pp=new post(ptitle,pcontent,pcode,imname,null,catid,user.getId());
             
            try {
                PostDao dao=new PostDao(connectionProvider.getConnection());
                
                if(dao.doopo(pp)){
                   
                    out.println("add post successfullty done");
                }
                else{
                    out.println("post not submitted");
                }
            } catch (SQLException ex) {
                Logger.getLogger(addpostt.class.getName()).log(Level.SEVERE, null, ex);
            }
             

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
