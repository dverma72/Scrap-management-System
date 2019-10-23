<!DOCTYPE html>
<html>
<title>Vendor</title>
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
}

.w3-bar .w3-button {
  padding: 16px;
}
</style>
<body>
    <% if(session.getAttribute("user")==null && session.getAttribute("vendor")==null && session.getAttribute("admin")==null){
    response.sendRedirect("login.jsp");
} %>
    
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
<!-- Sidebar on small screens when clicking the menu icon -->



<!-- Description --><br>


<!-- Contact Section -->
<div class="w3-container w3-light-grey" style="padding:128px 16px" >
  <center><Strong><b><h1>Join As Vendor</h1><b></strong>
<hr size="8">

<div class="dim2">
<strong><p>Who are Vendors?</p></strong>
<p class="text-left">Vendors are traditional Kabadiwala’s , work as virtual part of our team. Traditional scrap dealers, who buy &amp; stockpile the goods from the customers to sell it back to big fish in the pond.</p>
<strong><p class="strong-bold">Why vendors in our business?</p></strong>
<p class="text-left">We collaborate with traditional trustworthy vendors to join us to bring them a wide customer base to quadruple their revenues, which is impossible in their regular scrap trading business.</p>
<strong><p class="strong-bold">Benefits for vendors-</p></strong>
<p class="text-left">1) Boost their revenues by joining them with a huge customer base.</p>
<p class="text-left">2) Making them interested in online scrap market.</p>
<p class="text-left">3) Ethical business format for vendors to work more professionaly.</p>
<p class="text-left">4) Engaging them in their sinking traditional business.</p>
<p class="text-left">5) Converting them into online vendors for a better lifestyle &amp; respect they need.</p>

</center>
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
    <p><i class="fa fa-envelope fa-fw w3-xxlarge w3-margin-right"> </i> Email: myanonymousquora@mail.com</p>
   
    <!-- Image of location/map -->
    <img src=".\images\map.jpg" class="w3-image w3-greyscale" style="width:100%;margin-top:48px">
  </div>
</div>

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
