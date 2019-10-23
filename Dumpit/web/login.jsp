<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Login</title>
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
  background-size: 100% 100%;
  background-image: url("./images/background.jpeg"); 
}


.w3-bar .w3-button {
  padding: 16px;
}
</style>
<body >

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-blue w3-card"  id="myNavbar">
    <a href="Home.jsp" ><img src=".\images\logo.png" height="70" width="150" > </a>
    <!-- Right-sided navbar links -->
	
    

  
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon 
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close ÃÂ</a>
  <a href="about.html" onclick="w3_close()" class="w3-bar-item w3-button">About</a>
  <a href="request.html" onclick="w3_close()" class="w3-bar-item w3-button">Request for pickup</a>
  <a href="#work" onclick="w3_close()" class="w3-bar-item w3-button">WORK</a>
  <a href="rate.html" onclick="w3_close()" class="w3-bar-item w3-button">Srcap rate</a>
  <a href="rate_calculator.html" onclick="w3_close()" class="w3-bar-item w3-button">Srcap rate Calculator</a>
  <a href="contact.html" onclick="w3_close()" class="w3-bar-item w3-button">Contact</a>
  <a href="login.html" onclick="w3_close()" class="w3-bar-item w3-button">Log In</a>
  <a href="Registration.html" onclick="w3_close()" class="w3-bar-item w3-button">SignUp</a>
</nav>
-->

<!--Login-->
<br><br><br><br><br><br>
<div class="w3-container">

<form action="login.jsp"  method="post" >
<table width="35%" height="50%" bgcolor="white" border="2" align="center">

<tr>
    <th  colspan=2><center><font size=4><b> Login Page</b></font></center></th>
</tr>

<tr>
<td><b>Email id:</b></td>
<td><input type="text" size=25 name="userid"/></td>
</tr>

<tr>
<td><b>Password:</b></td>
<td><input type="Password"  size=25 name="pwd"/></td>
</tr>

<tr>
<td><b>Plz Select Login Type:</b></td>


<td><center>

<select name="type"  required>

<option value="user"  >Customer</option>
<option value="vendor">Vendor</option>
<option value="admin">Admin</option>
</select>
</center>
</td>
</tr>
<tr>
    <td colspan="2"><center>
        <input class="w3-button w3-green"  type="submit" name="login"  value="Login"/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Or&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="registration.jsp" <i class="w3-button w3-red">Register</i></a>
</center></td></tr>
</table>
</form>
</div>
<br><br><br><br><br><br><br><br><br><br><br>

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
<!DOCTYPE html>
<%
    String login_type= request.getParameter("type");
    String Email_id =request.getParameter("userid");
    String pass=request.getParameter("pwd");
    
    if(request.getParameter("login")!= null){
        
        try{
                Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
       
           if(login_type.equals("user")){
    
               //----------MD5 Implementation--------------------------------------------------------	
        MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(pass.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
    pass = Integer.toHexString(0xFF & digest[i]);

    if (pass.length() < 2) {
        pass = "0" + pass;
    }

    hexString.append(pass);
}
    String password=hexString.toString();
    
 //-------------------------------------------------------------------------------   
    
               PreparedStatement ps=con.prepareStatement("select *from  user_login where user_id like '"+Email_id+"' and pass like '"+password+"'");
         ResultSet rs=ps.executeQuery();
            
    if(rs.next()){

        PreparedStatement ps_name=con.prepareStatement("select name from  user_detail where e_mail like '"+Email_id+"'");
            ResultSet rs_name=ps_name.executeQuery();          
            if(rs_name.next()){
             String name= rs_name.getString("name") ;
               session.setAttribute("name",name);
            }
             session.setAttribute("user",Email_id);
            response.sendRedirect("user_home.jsp");
            
        out.print("<script>alert('success');</script>");
    }
    else{
        out.print("<script>alert('Invailid Email_id or password');</script>");
    }
                
           }
        ////--------------------  For Vendor------------------   
          
       if(login_type.equals("vendor")){
   //----------MD5 Implementation--------------------------------------------------------	
        MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(pass.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
    pass = Integer.toHexString(0xFF & digest[i]);

    if (pass.length() < 2) {
        pass = "0" + pass;
    }

    hexString.append(pass);
}
    String password=hexString.toString();
    
 //-------------------------------------------------------------------------------   
    
           
           
          PreparedStatement ps=con.prepareStatement("select *from  vendor_login where vendor_id like '"+Email_id+"' and pass like '"+password+"'");
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                 PreparedStatement ps_name=con.prepareStatement("select name from  vendor_detail where e_mail like '"+Email_id+"'");
            ResultSet rs_name=ps_name.executeQuery();          
            if(rs_name.next()){
             String name= rs_name.getString("name") ;
               session.setAttribute("name",name);
            }

        response.sendRedirect("vendor_home.jsp");
        session.setAttribute("vendor",Email_id);
       }
        else{
            out.print("<script>alert('Invailid Email_id or password');</script>");
        }
    
       }
       
       //  for Admin
           if(login_type.equals("admin")){
         
       PreparedStatement ps=con.prepareStatement("select *from  admin_login where admin_id like '"+Email_id+"' and pass like '"+pass+"'");
         
        ResultSet rs=ps.executeQuery(); 
        if(rs.next()){
            
            PreparedStatement ps_name=con.prepareStatement("select name from  admin_login where admin_id like '"+Email_id+"'");
            ResultSet rs_name=ps_name.executeQuery();          
            if(rs_name.next()){
             String name= rs_name.getString("name") ;
             session.setAttribute("name",name);
            }
             session.setAttribute("admin",Email_id);
                response.sendRedirect("admin_home.jsp");
        }
        else{
            out.print("<script>alert('Invailid Email_id or password');</script>");
        }

                   }
       }
                    catch(Exception ex){
                   out.println("<script>alert('"+ex+"');</script>");
            }
            }

        %>
