
<div class="w3-top">
  <div class="w3-bar w3-blue w3-card"  id="myNavbar">
    <a href="vendor_home.jsp" ><img src=".\images\logo.png" height="70" width="150" > </a>
    <!-- Right-sided navbar links -->
	
	<div class="w3-right w3-hide-small">
            <a href="myprofile.jsp" class=" w3-arial" style="text-decoration:none" ><strong><b><h4>Welcome &nbsp;<%=session.getAttribute("name")%></h4></b></strong></a>
	 <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button" title="Notifications">Learn More<i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="about.jsp" class="w3-bar-item w3-button">About</a>
      <a href="rate_calculator.jsp" class="w3-bar-item w3-button">scrap Rate Calculator</a>
      <a href="how.jsp" class="w3-bar-item w3-button">How It Works</a>
    </div>
</div>
	<div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button" title="Notifications">Tie Up <i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
    
      <a href="#" class="w3-bar-item w3-button">Corporate Tie Up</a>
      <a href="#" class="w3-bar-item w3-button">Partners</a>
    </div>
</div>

      <a href="rate.jsp" class="w3-bar-item w3-button"><i class="fa fa-usd"></i>Rate Card</a>
      <a href="contact.jsp" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> Contact</a>
      
     <a href="output.jsp?pickup_request" class="w3-bar-item w3-button">Scarp collect reqeust's</a>
      
      <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-button" title="Notifications">Payment's <i class="fa fa-caret-down"></i></button>  
      <div class="w3-dropdown-content w3-card-4 w3-bar-block">
   <a href="add.jsp?payment" class="w3-bar-item w3-button">Make Payment</a>
      <a href="output.jsp?mypayment" class="w3-bar-item w3-button">My Payment</a>
    </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button" title="Notifications">My Account <i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="myprofile.jsp" class="w3-bar-item w3-button" fa fa-user>My profile</a>
      <a href="logout.jsp" class="w3-bar-item w3-button">Logout</a>
    </div>
</div>

    </div>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close ×</a>

  <a href="addvendor.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Pickup Request's</a>
  
  <a href="myprofile.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Hello <%=session.getAttribute("name")%></a>
  <a href="Home.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Logout</a>
</nav>