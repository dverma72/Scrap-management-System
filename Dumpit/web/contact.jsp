<!DOCTYPE html>

<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<title>Contact</title>
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
background-size: 100% 100%
}

.w3-bar .w3-button {
  padding: 16px;
}
</style>
<body>

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
<%}%>
<!-- Contact Section -->
<div class="w3-container w3-light-grey" style="padding:128px 16px" id="contact">
  <h2 class="w3-center"><strong>CONTACT</strong></h2>
  <p class="w3-center w3-large">Lets get in touch. Send us a message:</p>
  <div style="margin-top:48px">
  
    <form action="contact.jsp" method="post">
      <p><input class="w3-input w3-border" type="text" placeholder="Name*" required name="name"></p>
      <p><input class="w3-input w3-border" type="text" placeholder="Email*" required name="email"></p>
      <p><input class="w3-input w3-border" type="text" placeholder="Address*" required name="addr"></p>
      <p><input class="w3-input w3-border" type="text" placeholder="Subject*" required name="subject"></p>
      <p> <br><textarea class="w3-input w3-border" placeholder="MESSAGE*" rows="10" cols="20" name="message"></textarea></p>
      <p>
        <button class="w3-button w3-black" type="submit" name="send">
          <i class="fa fa-paper-plane"></i> SEND MESSAGE
        </button>
      </p>
		
    </form>
	<p><i class="fa fa-map-marker fa-fw w3-xxlarge w3-margin-right"></i> Mumbai ,India</p>
    <p><i class="fa fa-phone fa-fw w3-xxlarge w3-margin-right"></i> Phone: +91 9967723728</p>
    <p><i class="fa fa-envelope fa-fw w3-xxlarge w3-margin-right"> </i> Email: myanonymousquora@gmail.com</p>
   
    <br> <br> <br> <br> <br>
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
<%
    if(request.getParameter("send")!=null){
        try{
       String name=request.getParameter("name");
	   String email=request.getParameter("email");
        String addr=request.getParameter("addr");
		String subject=request.getParameter("subject");
		String message=request.getParameter("message");
                       
	
                
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("insert into contact values(?,?,?,?,?)");
        ps.setString(1, name);
        ps.setString(2, email);       
        ps.setString(3,addr);
        ps.setString(4, subject);
        ps.setString(5, message);
                int i=ps.executeUpdate();
                if(i>0)
                {
                  
                    out.print("<script>alert('Message send successfully');</script>");
                    
                }
                else
                {
                      out.print("<script>alert('Some Thing wnt wrong try again');</script>");
                   
                }
		
           
          
        }catch(Exception ex){
          
            out.print("<script>alert('"+ex+"');</script>");
        }
    }
    
  
%>
