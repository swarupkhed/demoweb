/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.connection;

import java.sql.Connection;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author classic
 */
public class connectionProvider {
    
     private static Connection con;
     public static Connection getConnection() throws SQLException{
         try{
      
                 Class.forName("com.mysql.jdbc.Driver");
                 con=DriverManager.getConnection("jdbc:mysql://localhost:3307/webdata?zeroDateTimeBehavior=convertToNull", "root", "");
                 
                 
 
         } catch (ClassNotFoundException ex) {
             Logger.getLogger(connectionProvider.class.getName()).log(Level.SEVERE, null, ex);
         }
         
         
         
         return con;
         
     }

  
}
