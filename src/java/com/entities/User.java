/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

/**
 *
 * @author classic
 */
public class User {
    
    public int id ;
    public String name;
    public String mobile_no;
    public String email;
    public String password;
    public String state;
    public String gender;
    public String datetime;
    public String profile;

    
    
    public User(int id, String name, String mobile_no, String email, String password, String state, String gender) {
        this.id = id;
        this.name = name;
        this.mobile_no = mobile_no;
        this.email = email;
        this.password = password;
        this.state = state;
        this.gender = gender;

        
    }

    public User(String name, String mobile_no, String email, String password, String state, String gender) {
        this.name = name;
        this.mobile_no = mobile_no;
        this.email = email;
        this.password = password;
        this.state = state;
        this.gender = gender;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile_no() {
        return mobile_no;
    }

    public void setMobile_no(String mobile_no) {
        this.mobile_no = mobile_no;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

   
    
    
    
    
    
    
}
