<!DOCTYPE html>
<html>
<title>Admin Dashboard</title>
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
  background-image:url("./images/background.jpeg");
  background-attachment:fixed;
  background-size:100% 100%;
}



.w3-bar .w3-button {
  padding: 16px;
}
.w3-container{background-image: url("./images/background.jpeg");}
</style>
<body >
<% if(session.getAttribute("user")==null && session.getAttribute("vendor")==null && session.getAttribute("admin")==null){
    response.sendRedirect("login.jsp");
} %>
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
<%if(session.getAttribute("admin")==null){
            response.sendRedirect("login.jsp");
        }%>
<!-- servives --><br><br><h1><b><i class="fa fa-dashboard"></i> My Dashboard</b></h1>
  
<br>

<center><form action="search.jsp" method="post">
    Enter Email_id :-<input type="text" name="Email_id">&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" name="search" value="Search"></form>
  <br><br>     
</center>
<form action="add.jsp" method="post">
   <div class="w3-row-padding w3-margin-bottom">
   <div class="w3-quarter ">
     <div class="w3-clear w3-center w3-padding-16">
            <button class="w3-red w3-text-white" name="addvendor" > <h4>Add Vendor</h4>
      </div>
    </div>
       
         <div class="w3-quarter ">
     
        <div class="w3-clear w3-center w3-padding-16">
            <button class="w3-red w3-text-white" type="submit" name="addscarp" > <h4>Add Scrap</h4></a>
       
      </div>
    </div>
</form>
<form action="output.jsp" method="post">
<div class="w3-quarter ">
     
        <div class="w3-clear w3-center w3-padding-16">
            <button class="w3-red w3-text-white" type="submit" name="user_details" > <h4>Show Customer Details</h4></a>
       
      </div>
    </div>

<div class="w3-quarter ">
     
        <div class="w3-clear w3-center w3-padding-16">
            <button class="w3-red w3-text-white" type="submit" name="message" > <h4>Show Messages</h4></a>
       
      </div>
    </div>

        
       
       <div class="w3-quarter ">
     
        <div class="w3-clear w3-center w3-padding-16">
            <button class="w3-red w3-text-white" type="submit" name="payment" > <h4>Show payment Details</h4></a>
       
      </div>
    </div>    
       
       <div class="w3-quarter ">
     
        <div class="w3-clear w3-center w3-padding-16">
            <button class="w3-red w3-text-white" type="submit" name="vendor_detail" > <h4>Show Vendor Details</h4></a>
       
      </div>
    </div>  <div class="w3-quarter ">
     
        <div class="w3-clear w3-center w3-padding-16">
            <button class="w3-red w3-text-white" type="submit" name="pickup_request" > <h4>Show Scarp Collect Request</h4></a>
       
      </div>
    </div>
    <div class="w3-quarter ">
     
        <div class="w3-clear w3-center w3-padding-16">
            <button class="w3-red w3-text-white" type="submit" name="totalpayment" > <h4>Total Stock Available</h4></a>
       
      </div>
    </div>

</div></form>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
<!-- Footer -->
<jsp:include page="footer.jsp"/>
 
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
