<%-- 
    Document   : signup
    Created on : Jun 4, 2020, 8:20:02 PM
    Author     : classic
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page errorPage="error_page.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            
            ::-ms-input-placeholder{
                color:#3300ff;
                font-size:30px;
                
            }
            div{
                font-size: 16px;
            }
            input:enabled{
                font-size: 14px;
                background:transparent;
                border-radius:9px;
                
            }
            input:hover{
             
                border:none;
            }
            input:focused{
                background: transparent;
                color:#3300ff
            }
            
            .backg{
                background-image:url("images/bg1.jpg");
                background-size:cover;
                width:100 vh;
                height: 100vh;
                background-origin:border-box;
            }
        </style>
        <script src="js/alert.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="Home.jsp" %>
        <div class="backg">
            
  
        <div class="container ">
           
                  
            <div class="card "  style="width:500px;height: 400px;margin-top: 10%;margin-left: 20%;background:transparent">
                <div class="card-header">
                    <div class="card-title">
                        Register here
                    </div>
                </div>   
                <form action="register" method="POST" id="myform">
                <div class="card-body">
                 
                        <div class="form-group">
                            <label for="name">Name </label>
                            <input type="text" name="uname" class="form-control" placeholder="username.."/>
                        </div>
                        <div class="form-group">
                            <label for="mobile">Mobile No </label>
                            <input type="mobile" name="umobile" class="form-control" placeholder="contact no.."/>
                        </div>
                        <div class="form-group">
                            <label for="emaila">Email Id </label>
                            <input type="email" name="uemail" class="form-control" placeholder="Email Address.."/>
                        </div>
                      <div class="form-group">
                            <label for="pass">Password</label>
                            <input type="password" name="upass" class="form-control" placeholder="password.."/>
                        </div>
                    
                        <div class="form-group">
                            <label for="State">State </label>
                            <input type="text" name="ustate" class="form-control" placeholder="State.." />
                        </div>
                        <div class=" form-group">
                            <label for="gender">Gender </label>
                            <input type="radio"  name="ugender" value="male" />
                            <input type="radio" name="ugender" value="female" />

                        </div>
                       <div class="form-group" >
                           <input type="checkbox" name="ucheck" class="form-check">
                           <label class="form-check-label">Accept<a href="#"> terms and condition</a></label>
                       
                       </div>

                    <div class=" spinner spinner-border" id="loder" style="margin-left: 50%;width:30px;height: 30px;display: none"></div>

                </div>
                <div class="card-footer">
                    <button class="btn btn-success btn-outline-danger btn-lg" type="submit"  style="color: #99ffff">submit</button>
                </div>
                </form>
          
                </div>
            </div>
        </div>
             </div>
        
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery.js" type="text/javascript"></script>
  
        <script>
            $(document).ready(function(){
                 $('#myform').on('submit',function(event){
                       console.log("loading..");
                       $('#loder').show();
                       
                        event.preventDefault();
                          let form=new FormData(this);
                         //send register servlet
                         $.ajax({
                            url:"register",
                            type:'POST',
                            data:form,
                            
                            success:function(data,textStatus,jqXHR){
                                console.log(data);
                                $('#loder').hide();
                                    
                                 if(data.trim()==="done"){
                                       alert("Registration successfully..");
                                
                                 }
                                 if(data.trim()==="empty")
                                 {
                                     alert("please fill up all fields");
                                 }
                                 if(data.trim()==="box not checked")
                                 {
                                      alert("accept terms and condition");
                                      
                                 }
                                 if(data.trim()===""){
                                     alert("email id already exist");
                                 }

                            },
                            error:function(jqXHR,textStatus,errorThrown){
                                console.log(jqXHR)
                                $('#loder').hide();
                                alert("something goes wrong");
                                   
                            },
                            processData:false,
                            contentType:false
                         });
                     
                 });
                 
        
        
            });
            
        </script>
            
    </body>
</html>
