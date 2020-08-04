/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.connection;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.InputStream;

/**
 *
 * @author classic
 */
public class helper {
    
    public static boolean deletefile(String path){
        boolean fd=false;
        
        File f=new File(path);
         fd=f.delete();
         
        return fd;
        
    }
    public static boolean savefile(InputStream is,String path){
        
        boolean a = false;
        try {
            byte b[]=new byte[is.available()];
            is.read(b);
            
            try (FileOutputStream fos = new FileOutputStream(path)) {
                fos.write(b);
                fos.flush();
            }
            a=true;
            
        } catch (IOException ex) {
            Logger.getLogger(helper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
        return a;        
        
    }
    
}
