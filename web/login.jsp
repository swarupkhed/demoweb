<%-- 
    Document   : login
    Created on : Jun 2, 2020, 8:38:29 PM
    Author     : classic
--%>

<%@page import="com.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  errorPage="error_page.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        
        <style>

            label{
                color: blueviolet;
            }
            ion-icon{
                text-align: center;
                font-size:40px;
                margin-left:48%;
            }
            input[type=submit]{
                text-align: center;
                justify-content: center;
                margin-left: 48%;
            }
           
        </style>
    </head>
    <body>
        <%@include file="Home.jsp" %>
        <div class="container">
         
                <div class="card" style="width:400px;height: 450px ;margin: 100px">
                    <div class="card-header">
                        <span class=" text-center" style=" text-align: center;font-size:17px"><i><ion-icon src="E:\netbean EE project\WebApplication2\web\images\login.jpg"></ion-icon></i></span>
                        <div class="card-title" style="color:royalblue;font-size:20px;text-align: center">Login</div>  
                    </div>
                    
                    <%
                        Message m = (Message) session.getAttribute("msg");

                        if (m != null) {


                    %>
                    <div class="alert <%= m.getCssclass()%>" role="alert">
                        <%= m.getContent()%>

                    </div>
                    <%
                            session.removeAttribute("msg");
                        }

                    %>   

                        
                    <div class="card-body">
                        <form action="logins" method="post">
                            <div class="form-group">
                                <label  for="email id" >Email id </label>
                                <input type="email"  required name="loemail" placeholder="enter email" class="form-control">
                            </div>
                            <div class="form-group">
                                <label  for="password">Password </label>
                                <input type="password" required name="lopassword" placeholder="enter password" class="form-control">
                            </div>
                            
                                
                            <a href="signup.jsp" style="margin: 10px">create account</a>
                            <div class=" container text-center">
                            <br>
                            <button type="submit"  class="btn btn-primary" style="margin-top: 20px">Submit</button>
                            </div>
                        </form> 
                    </div> 
                </div>
                 
               
        </div>                
          
        <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery.js" type="text/javascript"></script>
  
    </body>
</html>
