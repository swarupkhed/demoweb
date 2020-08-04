<%-- 
    Document   : profile
    Created on : Jun 6, 2020, 12:15:43 PM
    Author     : classic
--%>


<%@page import="java.util.List"%>
<%@page import="com.entities.post"%>
<%@page import="com.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Category"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.connection.connectionProvider"%>
<%@page import="com.entities.User"%>
<%@page  errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    HttpSession g = request.getSession();
    User user = new User();

    user = (User) g.getAttribute("currentuser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }


%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/alert.js" type="text/javascript"></script>

        <link href="css/boot.css" rel="stylesheet" type="text/css"/>
        <style>
            ion-icon{
                font-size: 24px;
                color:#007bff;
                padding: 8px;
                padding-top: 0px;

            }  
            ul li {

                text-decoration: none;

            }
            .db ion-icon{
                font-size: 32px;
          

            }
            .primary-background{
                background-color:#007bff;
            }
        
        </style>
    </head>
    <body>
<!--        navigation bar of profile page-->
        <nav class="navbar  sticky-top   navbar-expand-lg primary-background   navbar-light" style="color: #e3f2fd">

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
                        <a class="nav-link " href="#" tabindex="-1" aria-disabled="true"> &emsp13;   &emsp13;  &emsp13;<small>Contact</small></a>
                    </li>
                     <li class="nav-item">
                         <a class="nav-link " href="#" data-toggle="modal" data-target="#postmodal" > &emsp13;   &emsp13;  &emsp13;<small>Do posts</small></a>
                    </li>

                    <li class="nav-item">
                        <span ><i><ion-icon name="log-out-outline" ></ion-icon></i></span>
                        <a class="nav-link " href="logoutServlet" tabindex="-1" aria-disabled="true"> &emsp13;   &emsp13;  &emsp13;<small>Logout</small></a>
                    </li>

                    <li class="nav-item " >
                        <span><i><ion-icon name="person-add"></ion-icon></i></span>
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal">&emsp13;   &emsp13;  &emsp13;&emsp13;   &emsp13;  &emsp13;<%= user.getName()%></a>
                    </li>



            </div>
        </div>
    </nav>
  <!--end of navigation bar-->
    
    <!--print msg-->
    
    <%  
         Message   msgg= (Message)session.getAttribute("msg");
        
        if(msgg !=null){
    
    %>
      <div class="alert <%= msgg.getCssclass()%>" role="alert">
         
          <%= msgg.getContent()%>

      </div>
    <%
        session.removeAttribute("msg");
        
      }
    %>
    <!--end msg-->
    <!--show all post--> 
    <!--here is the body of profile page with post-->
    <div class="container mt-4">
        
        <div class="row">
            <div class="col-md-4">
                
                <div class="list-group">
                    
                    <a href="#" onclick="getpost(0,this)" class="a-link list-group-item list-group-item-action active">All Posts</a>
                    <!--categories-->
                    <%
                        PostDao dao=new PostDao(connectionProvider.getConnection());
//                        if method return string then we stored value in the string ex.String p=dao.getfaod();
//                         but here method return arraylist(list) and that's why we need to store 
                        ArrayList<Category> p= dao.getAllCategories();
//                        here we can get value from the arraylist using object of category of evey row
                        for(Category cc:p){

                    %>
                    <a href="#" onclick="getpost(<%= cc.getCid() %>,this)" class="a-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                    <%
                        }
                            
                    %>
                    
                </div>
                    
                
            </div>
            <div class="col-md-8">
               
                <div class="container  " >
                      <div class="row col-md-6" >
                     
                              <div class="io" id="he"></div>
                   
                      </div>
                </div>
                   
                         
           
            </div>
        </div>
        
        
    </div>
   

    <!--profile details edit or for view Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  embed-responsive" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                    <div class="modal-body" id="m1">
                        <div class="container " style=" width:550px;margin-top:0px;">
                            <div class="row">
                                <div class=" col-sm-6">
                                    <img src="pic/<%= user.getProfile()%>" class="img-fluid"   style=" border-radius: 50%; border-radius: ;margin-left:55px;width:150px" alt="problem" />
                                </div>
                                <div class="col-sm-6">
                                    <h4 class=" text-primary float-sm-right" style=" margin-top: 70px; font-size: 27px;font-family:cursive"  > <%= user.getName()%></h4>
                                </div>
                            </div>


                        </div>



                        <table class="table">

                            <tbody>
                                <tr>
                                    <th scope="row">ID :</th>
                                    <td><%= user.getId()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Email :</th>
                                    <td><%= user.getEmail()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Gender :</th>
                                    <td><%= user.getGender()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Mobile_NO :</th>
                                    <td><%= user.getMobile_no()%></td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                <div class=" modal-body" id="m2">
                    <form action="updateu" method="POST" enctype="multipart/form-data">
                        <div class="container " style=" width:550px;margin-top:0px;">
                            <div class="row">
                                <div class=" col-sm-6">
                                    <img src="pic/<%= user.getProfile()%>" class="img-fluid"   style=" border-radius: 50%; border-radius: ;margin-left:55px;width:150px" alt="problem" />
                                </div>
                                <div class="col-sm-6">
                                    <h4 class=" text-primary float-sm-right" style=" margin-top: 70px; font-size: 27px;font-family:cursive"  > <%= user.getName()%></h4>
                                </div>
                            </div>


                        </div>
                        <table class=" table">
                            <tbody>

                                <tr>
                                    <th scope="row">ID</th>
                                    <td><%= user.getId()%></td>
                                </tr>
                            <tr>
                            <th>Name</th>
                            <td> <input type="text" name="uname"  value="<%= user.getName()%>"></td> 

                            </tr>
                            <tr>
                            <th>Email</th>
                            <td><input type="email" name="uemail"  value="<%= user.getEmail()%>"></td>
                            </tr>
                            <tr>
                            <th>mobile_no</th>
                            <td> <input type="text" name="umobile"  value="<%= user.getMobile_no()%>"></td> 

                            </tr>
                            <tr>
                            <th>new_profile</th>
                            <td> <input type="file" name="upic"  value="<%= user.getProfile()%>"></td> 

                            </tr>
                            <tr>
                            <th>Gender</th>
                            <td><%= user.getGender().toUpperCase()%></td>
                            </tr>
                            </tbody>
                        </table>

                        <button type="submit" class="btn btn-success" id="save">save</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary center-block" id="ed1">Edit details</button>
                </div>
            </div>
        </div>
    </div>
                            
    
<!--    modal for post data-->

        <div class="modal fade" id="postmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog  embed-responsive" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="post-modal">Provide post details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                    <div class="modal-body" id="m3">
                        <form action="addpostt" method="POST" >
                        <div class="form-group">
                            <select class="form-control" name="cate">
                                <option selected disabled>====Select Category ===</option>
                                <%
                                     PostDao post=new PostDao(connectionProvider.getConnection()); 
                                      ArrayList<Category> ar=post.getAllCategories();
                                      for(Category  c:ar){
                                          
                                      
                                %>
                                    
                                <option value="<%= c.getCid() %>"  ><%= c.getName() %></option>

                                <%
                                    }
                                    
                                %>
                            </select>
                        </div>
                        <div class=" form-group">
                            <input type="text" name="ptitle" placeholder="Enter post title" class="form-control" />
                            
                        </div>
                        <div class="form-group">
                            <textarea class="form-control"  name="pcontent" style="height:200px;" placeholder="enter your content..." ></textarea>
                        </div>
                          <div class="form-group">
                              <textarea class="form-control" name="pcode" style="height:200px"  placeholder="enter your program(IF any)..." ></textarea>
                        </div>

                            <label>Select your pic:</label>
                            <br>
                            <input type="file" name="ppic" class="form-control" />
                            
                            <button type="submit" id="sub" class="btn btn-outline-success" >add</button>
                        </form> 
                    </div>

            </div>
        </div>
    </div>
             

     
    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>
  
     <script src="js/jquery.js" type="text/javascript"></script>
     <script src="js/bootstrap.min.js" type="text/javascript"></script>
     <script src="js/popper.min.js" type="text/javascript"></script>
    <script>

        $(document).ready(function () {
            console.log("welcome");
              $("#sub").on("submit",function(event){
                        
                event.preventDefault();
                 console.log("you have clicked on submit");
                 
                 let form=new FormData(this);              
                 
    
            
              $.ajax({
                  
                 url:"addpostt",
                 type:'POST',
                 data:form,
                 
                 success: function (data, textStatus, jqXHR) {
                     console.log("successful");
                     if(data.trim() === "add post successfullty done"){
                         
                         console.log("successs");
                     }  
                 },
                  error: function (jqXHR, textStatus, errorThrown) {
                        
                  },
                  
                  processData:false,
                  contentType:false
        
              });
            });

            swal("Login Successful!", "welcome <%=user.getName()%>!", "success");
            $("#m1").show();
            $("#m2").hide();
            let editstatus = false;

            $("#ed1").click(function () {
                if (editstatus === false) {
                    $("#m1").show();
                    $("#m2").hide();
                    editstatus = true;
                    $("#ed1").text("Edit details ");
                } else {
                    $("#m1").hide();
                    $("#m2").show();
                    editstatus = false;
                    $("#ed1").text("back");

                }


            });
        });
    </script>
    <script>
             
         function getpost(cId,temp){
             
            $('.a-link').removeClass('active');  
            $.ajax({
                url:"load_posts.jsp",
                data:{cid:cId},
                
         
                

                success: function (data, textStatus, jqXHR) {
                        $('#he').html(data);
                        $(temp).addClass('active');
                
                         
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log("error in loading post");
                    }
                 
                
            });
           
        }
            
        $(document).ready(function (){
             var getdefacultp=$('.a-link')[0];
             getpost(0,getdefacultp);
            
        });  
    </script>
    
    

</body>
</html>
