<!DOCTYPE html>
<html>
<title>User Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="project.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

body, jsp {
  height: 100%;
  line-height: 1.8;
background-image:url("./images/background.jpeg");
  background-attachment:fixed;
  background-size: 100% 100%;
}



.w3-bar .w3-button {
  padding: 16px;
}

</style>
<body >

<jsp:include page="user_header.jsp"/>
	<%if(session.getAttribute("user")==null){
            response.sendRedirect("login.jsp");
        }%>
<!-- Navbar (sit on top) -->


<!-- servives --><br><br>
<Center><h2><b>Services</b></h2>
<img src=".\images\pickup.png" ><br><a href="request.jsp" ><b>Scrap pickup</b></a>
<p> Raise a pickup now! Our vendor will come to you on the scheduled time to pick up your scrap in exchange for money.</p>


<img src=".\images\ratecard_calculator.png" ><br><a href="rate_calculator.jsp" ><b>Scrap rate calculator</b></a>
<p> Want to know the worth of your scrap before selling it of? Use our calculator to calculate how much your waste is worthy.</p>


<img src=".\images\corporate.png" ><br><a href="#" ><b>Corporate Tie-up</b></a>
<p> We have customized panel for corporates to systematically get rid of the scrap and get certificates of recycling.</p>

</center>

<!-- rate acrd-->
<Center><a href="rate.jsp" ><h2>
<b>Rate Card</b></h2></a></center>

   <div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-red w3-padding-16">
        <div class="w3-left"><img src=".\images\rate\iron.png" ></div>
        <div class="w3-center">
          <strong><span class="text-success">Rs</span> 10.00 <small>per Kg</small></strong>
        </div>
 
        <h3>Iron</h3>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16">
        <div class="w3-left"><img src=".\images\rate\brass.png" ></div>
        <div class="w3-center">
          <strong><span class="text-success">Rs</span> 240.00 <small>per Kg</small></strong>
        </div>
      
        <h4>Brass</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-teal w3-padding-16">
        <div class="w3-left"><img src=".\images\rate\copper.png" ></div>
        <div class="w3-center">
        <strong><span class="text-success">Rs</span> 350.00 <small>per Kg</small></strong>
        </div>
        
        <h4>Copper</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-orange w3-text-white w3-padding-16">
        <div class="w3-left">   <img src=".\images\rate\newspaper.png" ></i></div>
        <div class="w3-center">
          <strong><span class="text-success">Rs</span> 10.00 <small>per Kg</small></strong>
        </div>
       
        <h4>Newspaper</h4>
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
