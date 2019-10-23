<!DOCTYPE html>
<html>
<title>About</title>
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
  background-image: url("./images/background3.jpeg");
  background-position:right;  
  background-repeat: no-repeat;
   background-size: cover;
   background-attachment: fixed;
}


.w3-bar .w3-button {
  padding: 16px;
}
</style>
<body>
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
<!-- About Section -->
<div class="w3-container w3-light-grey" style="padding:128px 16px" id="about">

  <strong><h2 class="w3-center">About Us</h2></strong>
 <img  style="display: block; margin-left: auto; margin-right: auto;" width="700" height="500"  src=".\images\pickup.png" >
  <p>Dumpit is a startup with a bull’s eye vison whose only ambition is to serve our
nation folks with a GO Green Environment. Our organization is an absolute blend
of two words Junk &amp; art, Junk goes for scrap you will sell online to keep your
homeland clean and art is the technology friendly creative touch we give to erode
away scrap from your home in exchange of some valuable cash which can be
accessed through any devices or gadgets resourced with our mobility &amp; web solutions.</p>
<p>Dumpit landed its feet in online Scrap market to resolve all the loopholes related
to Buy &amp; Sell of waste from the customers online. We made a wider impact in our
flourishing waste management industry by collaborating with all the vendors to
form a profitable chain management with a hassle free online pick up
pre-arrangement for our customers through a dedicated Mobile Application &amp; a
vendor purposed mobility solution to crack down nerve free communication
between customers and vendors where our team monitors all the web process
for a smooth functioning. Exchange of scrap with reference to our well-defined
rate card (based on up &amp; down market) for distress free giving away of cash or the
accounted amount.</p>
<p><strong>Join Us.</strong></p>
<div class="row"><h1 class="col-sm-12 center">Know Us Who We Are and How We Are</h1></div>
<hr><div class="row"><div class="row home-tile"><div class="col-sm-6 home-title-text"><div class="row"><h2>
Debunking the mythologies of Scrap business in India.</h2>
<img  style="display: block; margin-left: auto; margin-right: auto;"  src=".\images\garbage.png" alt="Scrap collector">
<p>India is a painstaking importer of scrap from other neighboring countries, this comes
to a pause. As we be familiar with our population and raw material
lashes out the world, we have a high quantity- productivity of scrap, but
again a messy and unorganized business layout in this traditional market
us down. So, our team very well analyzed the fact in numbers and took an
step towards shaping an unorganized scrap business environment.</p>
</div>
</div>

<h2>How we engage traditional scrap vendors?</h2>
<img  style="display: block; margin-left: auto; margin-right: auto;"  src=".\images\compost.png" alt="Scrap collector">

<p>Traditional scrap vendors work with chock-full hardships, but the capital they gain
exchange of that is very poor or underprivileged. So, we firmly decided to
them with our Startup to form a strong workforce on field &amp; outfield.
Hindi- Lingual mobile application for our vendors to facilitate the ease of
communication with our customers to arrange a time-saving pick up solution.
</p>

<h2>Money-making scrap market for vendors &amp; customers.</h2>
<img  style="display: block; margin-left: auto; margin-right: auto;"  src=".\images\shredder.png" alt="Scrap collector">

<p>Our vendors &amp; customers are surprised with the money worth outcomes we
integrating our customized approach to master the world of Kabadiwala
some unique attitude for revolving waste into a mutual benefiting cash cow.
customers are satisfied with curiosity to come back again.</p>




  <p class="w3-center w3-large">Key features of our company</p>
  <div class="w3-row-padding w3-center" style="margin-top:64px">
    <div class="w3-quarter">
      <i class="fa fa-desktop w3-margin-bottom w3-jumbo w3-center"></i>
      <p class="w3-large">Responsive</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
    </div>
    <div class="w3-quarter">
      <i class="fa fa-heart w3-margin-bottom w3-jumbo"></i>
      <p class="w3-large">Passion</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
    </div>
    <div class="w3-quarter">
      <i class="fa fa-diamond w3-margin-bottom w3-jumbo"></i>
      <p class="w3-large">Design</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
    </div>
    <div class="w3-quarter">
      <i class="fa fa-cog w3-margin-bottom w3-jumbo"></i>
      <p class="w3-large">Support</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
    </div>
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
