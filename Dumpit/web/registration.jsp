<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>

<html>
<title>Registration</title>
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

<script> 
          
            // Function to check Whether both passwords 
            // is same or not. 
            function checkPassword() { 
                 = password1.value; 
                 = password2.value; 
  var  = document.getElementById("password1");
var  = document.getElementById("password2");
                // If password not entered 
                if (password1 === '') 
                    alert ('Please enter Password'); 
                      
                // If confirm password not entered 
                else if (password2 === '') 
                    alert ('Please enter confirm password'); 
                      
                // If Not same return False.     
                else if (password1 !== password2) { 
                    alert ('\nPassword did not match: Please try again...') ;
                    return false; 
                } 
  
                // If same return True. 
                else{ 
                    
                    return true; 
                } 
            } 
        </script> 
<body>
<jsp:include page="home_header.jsp"/>
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

<!-- Sidebar on small screens when clicking the menu icon -->



<!--Registration-->
<br><br><br><br>
<form  action="registration.jsp" method="post" onsubmit="checkPassword()">

<table border="5" id="customers" bordercolor="#272785" method="post"align="center" width="41%" bgcolor="#FBFBFB" >

<caption><strong><h2>Registration</strong></h2></caption>

<tr>

<th>Enter your name</th>

<td><center><input type="text" name="name" id="name" maxlength="20"  placeholder="   Enter your name" required/></td>
</center>
</tr>

<tr>

<th>Enter your password</th>

<td><center><input type="password" name="password1" pattern=".{6,}" title="Six or more characters" placeholder="   Enter password" required/></td>
</center>
</tr>

<tr>

<th>ReEnter your password</th>

<td><center><input type="password" name="password2"placeholder="   Plz Re-enter your password" required/></td>
</center>
</tr>

<tr>

<th>Enter your email</th>

<td><center><input name="email"type="email" placeholder="   Enter your email" required/></td>
</center>
</tr>

<tr>

<th>Enter your mobile</th>

<td><center><input  type="text" pattern="[0-9]{8-10}" name="mobile" titel="Enter proper mobile no" placeholder="Enter your Mobile no." required/></td>
</center>
</tr>

<tr>

<th>Enter your address</th>

<td><center><textarea rows="4" cols="20" name="address"></textarea></td>
</center>
</tr>
<tr>

<th>Select your City</th>

<td><center>

<select name="city"    required>

<option value="" selected="selected" disabled="disabled">Select your City</option>
<option value="vashi">vashi</option>
<option value="govandi">govandi</option>
<option value="mansarovar">mansarovar</option>
<option value="belapur">belapur</option>
<option value="bandra">bandra</option>
<option value="mankhurd">mankhurd</option>
<option value="chembur">chembur</option>
<option value="kurla">kurla</option>
<option value="sanpada">sanpada</option>
<option value="nerul">nerul</option>
<option value="panvel">panvel</option>

</select>
</center>
</td>

</tr>
<tr>

<th>Select your gender</th>

<td><center>

<input type="radio" name="gender" value="Male"/>Male
<input type="radio" name="gender" value="Female"/>Female
</center>
</td>

</tr>


<tr>

<th>Select your DOB</th>

<td><center><input type="date" name="dob"  required/></td>
</center>
</tr>




<tr>

<td colspan="2" align="center"><input type="submit" name="register" value="Register"/>

<input type="reset" value="Reset Data"/>

</td>

</tr>

</table>

</form>

<br><br>

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
<%-- 
    Document   : reg_code
    Created on : Aug 25, 2019, 2:02:47 AM
    Author     : Deepak
--%>

<%
    if(request.getParameter("register")!=null){
        try{
       String name=request.getParameter("name");
	   String pass=request.getParameter("password1");
        String selectedcity=request.getParameter("city");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");
                        
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
String password =hexString.toString();
                
                
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("insert into user_detail values(?,?,?,?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, email);       
        ps.setString(3,mobile);
        ps.setString(4, address);
        ps.setString(5, gender);
        ps.setString(6,dob);
        ps.setString(7, selectedcity);
                int i=ps.executeUpdate();
                if(i>0)
                {
                    PreparedStatement login=con.prepareStatement("insert into user_login values(?,?)");
		
                    login.setString(1, email);
                    login.setString(2,password);
                    login.executeUpdate();
                    out.print("<script>alert('Register Successfully Please go and Login');</script>");
                    response.sendRedirect("login.jsp");
                    
                }
                else
                {
                      out.print("<script>alert('Some Thing wnt wrong try again');</script>");
                   
                }
		
           
          
        }catch(Exception ex){
          
        
            out.print(ex);
            out.print("<script>alert('"+ex+"');</script>");
        }
    }
    
  
%>

