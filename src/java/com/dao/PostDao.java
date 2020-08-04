/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entities.Category;
import com.entities.post;
import java.sql.Connection;
import java.sql.*;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PostDao {
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
//    note :public "STring" get() return string when fetch we get value in String ex. "String" p=dao.get();
//    note: public "ArrayList<Category>" get() return ArrayList<Category> when fetch we get value in String ex. "ArrayList<Category>" p=dao.get();
    public ArrayList<Category> getAllCategories(){
        
        ArrayList<Category> list=new ArrayList<>();
        
        try{
            
            String q="select * from categories";
            
            Statement st=this.con.createStatement();
            
            ResultSet rs=st.executeQuery(q);
            
            while(rs.next()){
                int id=rs.getInt("cid");
                String name=rs.getString("name");
                String description=rs.getString("description");
                
                Category c=new Category(id, name, description);
//                here we store object of each and every row to get data of each row it store in arraylist with object on each object contain different key:value pairs it just little bit similar to xml or json formate
                list.add(c);
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        
        return list;
        
        
        
    }
    
    public boolean doopo(post p){
        boolean geb = false;
        try {
            String query="insert into posts(pTitle ,pContent,pCode,pPic,catID,userId)values(?,?,?,?,?,?)";
            
            PreparedStatement pre=this.con.prepareStatement(query);
            pre.setString(1,p.getpTitle());
            pre.setString(2,p.getpContent());
            pre.setString(3,p.getpCode());
            pre.setString(4,p.getpPic());
            pre.setInt(5,p.getCatId());      
            pre.setInt(6,p.getUserId());
            pre.executeUpdate();
            geb=true;
        
        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
        
        
        return geb;
        
        
        
        
    }
    
    public List<post> getallposts(){
        List<post> li=new ArrayList<>();    
        try {
           
            
            String query="select * from  posts ";
            
            PreparedStatement pre=con.prepareStatement(query);
            
             ResultSet rs =pre.executeQuery();
            
            while(rs.next()){
                 int pid=rs.getInt("pid");
                 String ptitle=rs.getString("pTitle");
                 String pcontent=rs.getString("pContent");
                 String pcode=rs.getString("pCode");
                 String ppic=rs.getString("pPic");
                 Timestamp pdate=rs.getTimestamp("pDate");
                 int catid=rs.getInt("catID");
                 int userId=rs.getInt("catId");
                 
              
                 post p=new post(pid,ptitle,pcontent,pcode,ppic,pdate,catid,userId);
                
                li.add(p);
            }


        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return li;




    }
     public List<post> getallpostsbycatid(int catid){
        List<post> li=new ArrayList<>();    
        try {
           
            
            String query="select * from  posts where catID=?";
            
            PreparedStatement pre=con.prepareStatement(query);
            pre.setInt(1, catid);
             
             ResultSet rs =pre.executeQuery();
            
            while(rs.next()){
                 int pid=rs.getInt("pid");
                 String ptitle=rs.getString("pTitle");
                 String pcontent=rs.getString("pContent");
                 String pcode=rs.getString("pCode");
                 String ppic=rs.getString("pPic");
                 Timestamp pdate=rs.getTimestamp("pDate");
                 int userId=rs.getInt("catId");
                 
              
                 post p=new post(pid,ptitle,pcontent,pcode,ppic,pdate,catid,userId);
                
                li.add(p);
            }


        } catch (SQLException ex) {
            Logger.getLogger(PostDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return li;




    }
     
     public post postob(post p){
        
          post get= null;
          
          try{
              
              String a="select * from posts";
              
              PreparedStatement pt=this.con.prepareStatement(a);
              
              ResultSet rs=pt.executeQuery();
              
              while(rs.next()){
                  
                  get=new post();
                  
                   int  id=rs.getInt("pid");
                   String title=rs.getString("pTitle");
                   String content=rs.getString("pContent");
                   String code=rs.getString("pCode");
                   String pic=rs.getString("pPic");
                   Timestamp date=rs.getTimestamp("pDate");
                   int cat=rs.getInt("catID");
                   int user=rs.getInt("userId");
                   
                  
                  get=new post(id,title,content,code,pic,date,cat,user);
                  
                  
                  
              }
              
              
          }catch(Exception e){
              e.printStackTrace();
          }
         
         
         
         
         
         return get;
        
         
     }
     public post getpostbypostid(int pid){
        
           post pp=null;
           try{
               
               String l="select * from posts where pid=?";
               
               PreparedStatement pr=this.con.prepareStatement(l);
               pr.setInt(1, pid);
 
               ResultSet rs=pr.executeQuery();
               
               while(rs.next()){
                   
                   pp=new post();
                   
                   pp.setPid(rs.getInt("pid"));
                   pp.setpTitle(rs.getString("pTitle"));
                   pp.setpContent(rs.getString("pContent"));
                   pp.setpCode(rs.getString("pCode"));
                   pp.setpPic(rs.getString("pPic"));
                   pp.setpDate(rs.getTimestamp("pDate"));
                   pp.setCatId(rs.getInt("catID"));
                   pp.setUserId(rs.getInt("userId"));
                   
                   
               }
               
               
           }catch(Exception e)
           {
               e.printStackTrace();
           }         
         
         
         
         
         
         
         return pp;

     }
    
}
