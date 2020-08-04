/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class likeddao {
     Connection con;

    public likeddao(Connection con) {
        this.con = con;
    }

    public Boolean insertdoliked(int pid,int uid) {
        
         boolean f = false;
         try {

            String query = "insert into liked (pid,uid) values(?,?)";

            PreparedStatement pr = this.con.prepareStatement(query);

            pr.setInt(1, pid);
            pr.setInt(2, uid);
            
            pr.executeUpdate();
            
            f=true;
            
            
        } catch (SQLException ex) {
             Logger.getLogger(likeddao.class.getName()).log(Level.SEVERE, null, ex);
         }
         return f;
        
    }
    
    public int countlikeonPost(int pid){
         
        int count=0;
        
        String s="select count(*) from liked where  pid=?";
        
        try{
            
            PreparedStatement prr=this.con.prepareStatement(s);
            
            prr.setInt(1, pid);
            
            ResultSet rs=prr.executeQuery();
            
            while(rs.next()){
                 
                count=rs.getInt("count(*)");
                
                
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        
        
        return count;
        
    }
     
    public boolean islikedbyuser(int pid,int cid){

         boolean d = false;
        
        try{
            String q="select * from liked where pid=? and cid=?";
            PreparedStatement pr=this.con.prepareStatement(q);
            pr.setInt(1, pid);
            pr.setInt(2, cid);
            
            ResultSet set=pr.executeQuery();
            
            while(set.next()){
                 
                d=true;
                
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
       return d;
    }
    
    public boolean deleteLike(int pid , int uid){
         boolean h = false;
         try{
             String d="delete from liked where pid=? and uid=?";
             
             PreparedStatement p=this.con.prepareStatement(d);
             p.setInt(1, pid);
             p.setInt(2, uid);
             
             p.executeUpdate();
             h=true;
         } catch (SQLException ex) {
             Logger.getLogger(likeddao.class.getName()).log(Level.SEVERE, null, ex);
         }
         
         return h;
    }
     
}
