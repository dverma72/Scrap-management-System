<div class="w3-top">
  <div class="w3-bar w3-blue w3-card"  id="myNavbar">
    <a href="admin_home.jsp" ><img src=".\images\logo.png" height="70" width="150" > </a>
    <!-- Right-sided navbar links -->
	
	<div class="w3-right w3-hide-small">
	 <a href="myprofile.jsp" class=" w3-arial" style="text-decoration:none" >
             <strong><b><h4>Welcome &nbsp;<%=session.getAttribute("admin")%></h4></b></strong></a>
	<div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button" title="Notifications">Add<i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="add.jsp?addscarp" class="w3-bar-item w3-button">Add Scarp</a>
      <a href="add.jsp?addvendor" class="w3-bar-item w3-button">Add Vendor</a>
   </div>
</div>
      <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button" title="Notifications">Show<i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="output.jsp?user_details" class="w3-bar-item w3-button">Cutomer Details</a>
      <a href="output.jsp?vendor_detail" class="w3-bar-item w3-button">Vendor Details</a>
      <a href="output.jsp?payment" class="w3-bar-item w3-button">Payment Details</a>
   </div>
</div>   <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button" title="Notifications">scrap<i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="output.jsp?payment" class="w3-bar-item w3-button">Payment Details</a>
      <a href="output.jsp?totalpayment" class="w3-bar-item w3-button">Stock</a>
      <a href="rate.jsp" class="w3-bar-item w3-button">Rate Card</a>
   </div>
</div>
   <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button" title="Notifications">Request<i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="output.jsp?pickup_request" class="w3-bar-item w3-button">Pickup reqeust's</a>
      <a href="output.jsp?message" class="w3-bar-item w3-button">Message's</a>
   </div>
</div>
<div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button" title="Notifications">My Account <i class="fa fa-caret-down"></i></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block">
      <a href="myprofile.jsp" class="w3-bar-item w3-button">My profile</a>
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

  <a href="addvendor.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Add Vendor</a>
  
  <a href="myprofile.jsp" onclick="w3_close()" class="w3-bar-item w3-button">My Profile</a>
  <a href="Home.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Logout</a>
</nav>