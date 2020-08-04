 <%@page import="java.util.List"%>
<%@page import="com.entities.post"%>
<%@page import="com.entities.post"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.connection.connectionProvider"%>
<%
    PostDao daof = new PostDao(connectionProvider.getConnection());
    
    List<post> gp=null;

    int cidd=Integer.parseInt(request.getParameter("cid"));
    
    if(cidd==0){
        gp = daof.getallposts();
    }
    else{
        gp=daof.getallpostsbycatid(cidd);
    }
    
    for (post grp : gp) {


%>

<div class="card mr-3" style="margin-top: 1em; width: 200px" >
        <div class="card-body" style="width: 200px"> 
            <b>  <%= grp.getpTitle()%></b>
            <p> Ans:<%= grp.getpContent()%></p>
            <p>code :<%= grp.getpCode()%></p> 
            <p><%= grp.getpDate()%></p>
        </div>
        <div class="card-footer primary-background " style="align-content:flex-start">
            <a href="" class="btn btn-outline-light"><i> <ion-icon name="thumbs-up-outline"></ion-icon></i><span>5</span></a>
            <a href="readmore.jsp?post_idd=<%=grp.getPid()%> " class="btn btn-outline-light"> Read More</a>
            <a href="#" class="btn btn-outline-light"> <ion-icon name="chatbubble-ellipses-outline"></ion-icon></i><span>20</span></a>
        </div>

   </div>
<%
    }

%>

