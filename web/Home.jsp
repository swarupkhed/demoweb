<%-- 
    Document   : newjsp
    Created on : Jun 2, 2020, 7:04:46 PM
    Author     : classic
--%>

<%@page import="com.connection.connectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <style>
            li{
                text-decoration: none;
            }    
        </style>
            
    </head>
    <body>

            
          <nav class="navbar  sticky-top   navbar-expand-lg   navbar-light" style="background-image: url(http://localhost:50878/pic/logo-strip_2.png) ;color: #e3f2fd">
         
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarcoll" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon  "></span>
                </button>

                <div  class=" navbar-collapse" id="navbarcoll">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active ">
                            <a class="nav-link" href="Home.jsp"><small> Home</small> <span class="sr-only">(current)</span></a>
                        </li>
                        
                        <li class="nav-item  ">
                            <a class="nav-link" href="about.jsp"><small>  &emsp13;   &emsp13;  &emsp13;About Us</small></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle  " href="#" id="navbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><small> &emsp13;   &emsp13;  &emsp13;Department</small>
                            </a>
                            <ul class="dropdown-menu dropdown bg-light" aria-labelledby="navbarDropdown" ">
                                <li  class="submenu" ><a class="dropdown-item" href="#">Action</a>
                                    <ul>
                                        <li><a href="#">first</a></li>
                                        <li><a href="#">second</a></li>

                                        <li><a href="#">third</a></li>
                                  

                                    </ul>
                                </li>
                                   
                                <li><a class="dropdown-item" href="#">Another action</a> </li> 
                                <hr class="bg-secondary"/>
                               <li> <a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                          <li class="nav-item">
                            <a class="nav-link " href="#" aria-disabled="true"><small> &emsp13;   &emsp13;  &emsp13;Admission</small></a>
                        </li>
                          <li class="nav-item">
                            
                            <a class="nav-link " href="#"  aria-disabled="true"><small> &emsp13;   &emsp13;  &emsp13;College Authorities</small></a>
                        </li> 
            
                  
                        <li class="nav-item">
                            <a class="nav-link " href="contact.aspx" tabindex="-1" aria-disabled="true"> &emsp13;   &emsp13;  &emsp13;<small>Contact</small></a>
                        </li>
                          <li class="nav-item">
                            
                            <a class="nav-link " href="login.jsp"  aria-disabled="true"><small> &emsp13;   &emsp13;  &emsp13;login</small></a>
                        </li> 
            
                  
                        <li class="nav-item">
                            <a class="nav-link " href="signup.jsp" tabindex="-1" aria-disabled="true"> &emsp13;   &emsp13;  &emsp13;<small>sign up</small></a>
                        </li>
                    </ul>
                    <div class="form-inline my-2 my-lg-0">
                        <input type="search" class="form-control  mr-sm-2" placeholder="search" style="float:right;width:200px;">
                        <button class="btn btn-outline-success my3 my-sm-0" type="submit" style="float: right;background-color: blueviolet">Search</button>
                    </div>
                </div>
            </nav>

        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        
   </body>
</html>
