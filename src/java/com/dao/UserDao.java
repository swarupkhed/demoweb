/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author classic
 */
public class UserDao {
    
       private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
       
    public boolean saveuser(User user) {
           boolean f = false;
        try{
             String query = "insert into registerweb(name,mobile_no,email,password,state,gender)values(?,?,?,?,?,?)";

            PreparedStatement pre = this.con.prepareStatement(query);

            pre.setString(1, user.getName());
            pre.setString(2, user.getMobile_no());
            pre.setString(3, user.getEmail());
            pre.setString(4,user.getPassword());
            pre.setString(5, user.getState());
            pre.setString(6, user.getGender());
    
        
            pre.executeUpdate();
            f=true;
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return f;
    }

    /**
     *
     * @param em
     * @param pass
    
     * @return
     */
    public User getuserbyemailidandpassword(String em ,String pass)
    {
          User user=null;
        
        try{
            
            
            String getlog=" select * from registerweb where email=? and password=?";
            
            PreparedStatement prelog=con.prepareStatement(getlog);
            
            prelog.setString(1,em);
            prelog.setString(2, pass);
            
               ResultSet rs=prelog.executeQuery();
               
            
            if(rs.next()){
//                 here we set user info to the user object 
                      user = new User();
                      user.setId(rs.getInt("id"));
                      user.setMobile_no(rs.getString("mobile_no"));
                     user.setName(rs.getString("name"));
                     user.setEmail(rs.getString("email"));
                     user.setPassword(rs.getString("password"));
                     user.setState(rs.getString("state"));
                    user.setGender(rs.getString("gender"));
                    user.setDatetime(rs.getString("timestamp"));
                    user.setProfile(rs.getString("profile"));
                    
                       
            }
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
           return user;
    }
    
    public boolean updateuser(User user) {
        
           boolean d = false;
       try{
           
       
         String query ="update registerweb set name=? , email=? ,mobile_no=? ,profile=? where id=?";
         
         PreparedStatement pre= con.prepareStatement(query);
        
         pre.setString(1,user.getName());
         pre.setString(2,user.getEmail());
         pre.setString(3,user.getMobile_no());
         pre.setString(4,user.getProfile());
         pre.setInt(5,user.getId());
         
         pre.executeUpdate();
         d=true;
       }   catch (SQLException ex) {
               Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
           }
       
           return d;
         
         
    }
    public User getuserbypostid(int pid){
         

           User user=null;
        
        try{
            
            
            String getlog=" select * from registerweb where id=?";
            
            PreparedStatement prelog=con.prepareStatement(getlog);
            
            prelog.setInt(1,pid);

            
               ResultSet rs=prelog.executeQuery();
               
            
            if(rs.next()){
//                 here we set user info to the user object 
                      user = new User();
                      user.setId(rs.getInt("id"));
                      user.setMobile_no(rs.getString("mobile_no"));
                     user.setName(rs.getString("name"));
                     user.setEmail(rs.getString("email"));
                     user.setPassword(rs.getString("password"));
                     user.setState(rs.getString("state"));
                    user.setGender(rs.getString("gender"));
                    user.setDatetime(rs.getString("timestamp"));
                    user.setProfile(rs.getString("profile"));
                    
                       
            }
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
           return user;

    }
}
