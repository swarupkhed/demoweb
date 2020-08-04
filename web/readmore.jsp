<%-- 
    Document   : readmore
    Created on : Jun 16, 2020, 8:08:35 AM
    Author     : classic
--%>

<%@page import="com.dao.likeddao"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.Category"%>
<%@page import="com.entities.post"%>
<%@page import="com.connection.connectionProvider"%>
<%@page import="com.dao.PostDao"%>
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

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

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
                font-size: 48px;
          

            }
            .primary-background{
                background-color:#007bff;
            }
        
        </style>
    </head>
    <body>
             <!--start navigation bar-->

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
                        <a class="nav-link " href="#" data-toggle="modal" data-target="#po-modal" > &emsp13;   &emsp13;  &emsp13;<small>Do posts</small></a>
                    </li>

                    <li class="nav-item">
                        <span ><i><ion-icon name="log-out-outline" ></ion-icon></i></span>
                        <a class="nav-link " href="logoutServlet" tabindex="-1" aria-disabled="true"> &emsp13;   &emsp13;  &emsp13;<small>Logout</small></a>
                    </li>

                    <li class="nav-item " >
                        <span><i><ion-icon name="person-add"></ion-icon></i></span>
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#exModal">&emsp13;   &emsp13;  &emsp13;&emsp13;   &emsp13;  &emsp13;<%= user.getName()%></a>
                    </li>



            </div>
        </div>
    </nav>

    <!--end navigation bar-->


    <!--modals-->
    <!--profile details edit or for view Modal -->
    <div class="modal fade" id="exModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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

    <div class="modal fade" id="po-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                    PostDao post = new PostDao(connectionProvider.getConnection());
                                    ArrayList<Category> ar = post.getAllCategories();
                                    for (Category c : ar) {


                                %>

                                <option value="<%= c.getCid()%>"  ><%= c.getName()%></option>

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




    <%            int a = Integer.parseInt(request.getParameter("post_idd"));

        PostDao dao = new PostDao(connectionProvider.getConnection());
        post p = (post) dao.getpostbypostid(a);
        UserDao u=new UserDao(connectionProvider.getConnection());
         User getpu=(User)u.getuserbypostid(p.getUserId());
         likeddao d=new likeddao(connectionProvider.getConnection());
         


    %>

    <div class="container text-center ">

        <div class="row">
            <div class="col-md-6 offset-md-3" >
                <div class="card mt-4">
                    <div class="card-header"><%= p.getpTitle()%></div>
                    <div class="row">
                        <div class="col-md-6 offset-md-0">
                                <p><%= getpu.getName() %> is posted on :</p>
                        </div>
                        <div class="col-md-6">
                            <%= p.getpDate().toLocaleString() %>
                        </div>
                    </div>
                
                    <div class="card-body"><%=p.getpContent()%></div>
                    <div class="card-footer primary-background">
                        <a href="#" id="clic" class="btn btn-light  view-like"><i> <ion-icon name="thumbs-up-outline"></ion-icon></i><span><%= d.countlikeonPost(p.getPid()) %> </span></a>
                      
                        <a href="#" class="btn btn-light"> <ion-icon name="chatbubble-ellipses-outline"></ion-icon></i><span>0</span></a>
                    </div>
                </div>
            </div>
           
        </div>

    </div>

   





    <script src="https://unpkg.com/ionicons@5.0.0/dist/ionicons.js"></script>

    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

    <script>
      
        $(document).ready(function(){
                
             $('#clic').on('click',function (){
                 var ppid=<%= p.getPid()%>;
                 var ccid=<%= user.getId()%>;
                 
                 const s={
                    pid:ppid,
                    cid:ccid,
                    operation:'like'
                 
                 };
                 
                 $.ajax({
                       url:"LikeServlet",
                       data:s,
            
                       
                       success: function (data, textStatus, jqXHR) {
                        
                           if(data.trim() === "true"){
                                   
                                 var c= $('.view-like').html();
                                 c++;
                                 $('.view-like').html(c);
                             } 
                           
                           
                       },
                       error: function (jqXHR, textStatus, errorThrown) {
                           console.log("error"); 
                       }
                       
                      
                  })
        
             });
               
                
        });
                
    </script>
    
</body>
</html>
