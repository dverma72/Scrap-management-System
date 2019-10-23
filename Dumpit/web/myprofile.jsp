<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>My Profile</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="project.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

body, html {
  height: 100%;
  line-height: 1.8;
  background-image: url("./images/background.jpeg");
  background-size: 100% 100%;
}


#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  
}
</style>
<body >
<% if(session.getAttribute("user")==null && session.getAttribute("vendor")==null && session.getAttribute("admin")==null){
    response.sendRedirect("login.jsp");
}


%>
<!-- Navbar (sit on top) -->
   <%
    boolean flag= false;
	if(session.getAttribute("vendor")!=null)
	{ flag=true;
%>
<jsp:include page="vendor_header.jsp"/>
	<%}%>
        
        
<%
	if(session.getAttribute("user")!=null)
	{flag=true;
%>
<jsp:include page="user_header.jsp"/>
	<%}%>
<%
	if(session.getAttribute("admin")!=null)
	{flag=true;
%>
<jsp:include page="admin_header.jsp"/>
	<%}%>
        <% if(flag==false)
        {%>
<jsp:include page="home_header.jsp"/>
<%}%><br><br><br><br>
<%
	if(session.getAttribute("admin")!=null)
	{
%>
<center><h1><strong>I am Admin</strong></h1></center>

	<%}else {%>
<center><h1><strong>My Profile</strong></h1></center>


<%     if(session.getAttribute("user")!= null){
           String email=session.getAttribute("user").toString();
           
            try{

              Class.forName("com.mysql.jdbc.Driver");
             Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
             PreparedStatement ps=con.prepareStatement("select * from  user_detail where e_mail like '"+email+"'");
             ResultSet rs=ps.executeQuery();

                 while(rs.next()){
%>
<table  border="5" id="customers" bordercolor="#272785" align="center" width="40%" bgcolor="#FBFBFB" >

<tr>
<th>Name</th><td><%=rs.getString("name") %></td></tr>
<th>Email_id</th><td><%=rs.getString("e_mail") %></td></tr>
<th>Phone no</th><td><%=rs.getString("phone") %></td></tr>
<th>address</th><td><%=rs.getString("address") %></td></tr>
<th>Gender</th><td><%=rs.getString("gender") %></td></tr>
<th>Date of birth</th><td><%=rs.getString("dob") %></td></tr>
<th>City</th><td><%=rs.getString("city") %></td></tr>
<tr>
    
    <td colspan="2">
     <center><a href="delete.jsp?remove&d=<%=rs.getString("e_mail")%>" ><i class="w3-button w3-red">Delete my Account</i></a>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <a href="update.jsp?edit&email=<%=rs.getString("e_mail")%>"><i class="w3-button w3-green">&nbsp;&nbsp;&nbsp;&nbsp;Edit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></a>
   </center></td>



<%
            }          
}catch(Exception ex){out.print(ex);}  
}
%>


</center></table>
<!----------------------------------------------vendor profile------------------------------------------------>

<%     if(session.getAttribute("vendor")!= null)
{
        String email= session.getAttribute("vendor").toString();
        
       try{
         Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("select * from  vendor_detail where e_mail like '"+email+"'");
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
%>
<table  border="5" id="customers" bordercolor="#272785" align="center" width="40%"  bgcolor="#FBFBFB" >


<tr><th>Name</th><td><%=rs.getString("name") %></td></tr>
<tr><th>Email_id</th><td><%=rs.getString("e_mail") %></td></tr>
<tr><th>Phone no</th><td><%=rs.getString("phone") %></td></tr>
<tr><th>address</th><td><%=rs.getString("address") %></td></tr>
<tr><th>Gender</th><td><%=rs.getString("gender") %></td></tr>
<tr><th>Date of birth</th><td><%=rs.getString("dob") %></td></tr>
<tr><th>City</th><td><%=rs.getString("city") %></td></tr>
<tr><td  colspan="2">
<center> <a href="delete.jsp?vendorremove&d=<%=rs.getString("e_mail")%>" ><i class="w3-button w3-red">Delete my Account</i></a>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <a href="update.jsp?vendoredit&email=<%=rs.getString("e_mail")%>"><i class="w3-button w3-green">&nbsp;&nbsp;&nbsp;&nbsp;Edit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></a>
    </td></center></tr>

<%
            }          
             }
            catch(Exception ex){out.print(ex);}
           
    }
%>


</center></table>


<%}%>



<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
<!-- Footer -->
<jsp:include page="footer.jsp" ></jsp:include>
 
<script>
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}


// Toggle between showing and hiding the sidebar when clicking the menu icon
var mySidebar = document.getElementById("mySidebar");

function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
  } else {
    mySidebar.style.display = 'block';
  }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
}
</script>

</body>
</html>
