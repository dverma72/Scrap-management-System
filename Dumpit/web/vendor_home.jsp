<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<!DOCTYPE html>
<html>
<title>Vendor Home</title>
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
  background-color: #4CAF50;
  color: white;
}

</style>
<body >
<% if(session.getAttribute("user")==null && session.getAttribute("vendor")==null && session.getAttribute("admin")==null){
    response.sendRedirect("login.jsp");
} %>
<!-- Navbar (sit on top) -->

<jsp:include page="vendor_header.jsp"/>

<!-- servives --><br><br><header class="w3-container" style="padding-top:22px">
    <h1><b><i class="fa fa-dashboard"></i> My Dashboard</b></h1>
  </header>

<form action="add.jsp" method="post">
    
   <div class="w3-row-padding w3-margin-bottom">
  <div class="w3-quarter ">
     <div class="w3-clear w3-center w3-padding-16">
            <button class="w3-red w3-text-white" name="payment" > <h4>Make Payment</h4>
      </div>
    </div>
       </form>
<form action="output.jsp" method="post">
       <div class="w3-quarter ">
     <div class="w3-clear w3-center w3-padding-16">
            <button class="w3-red w3-text-white" name="pickup_request" > <h4>Pickup Request's</h4>
      </div>
    </div>
</form>
    <form action="output.jsp" method="post">
       <div class="w3-quarter ">
     <div class="w3-clear w3-center w3-padding-16">
            <button class="w3-red w3-text-white" name="total_scarp" > <h4>Show Total Scarp Available</h4>
      </div>
    </div>
    </form


</div>
<br><br><br><br>
  <% 
   try{
 %>
 <strong><center><h2>Pickup Request's</h2></center></strong>
<table  border="5" id="customers" bordercolor="#272785" align="center"  bgcolor="#FBFBFB" >
<tr>
    <th>Id</th>
<th>Name</th>
<th>Mobile no</th>
<th>Alternate Mobile no</th>
<th>Email_id</th>
<th>address</th>
<th>city</th>
<th>Scarp name</th>
<th>Scarp weight</th>
<th>Requested Date</th>
<th>Pick up Date</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
         Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("select * from  request");
        
       
            ResultSet rs=ps.executeQuery();
            
while(rs.next()){

%><tr>
<td><%=rs.getString("id") %></td>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("mobile") %></td>
<td><%=rs.getString("alternate_moblie")%></td>
<td><%=rs.getString("email") %></td>
<td><%=rs.getString("address") %></td>
<td><%=rs.getString("city") %></td>
<td><%=rs.getString("scarp_name") %></td>
<td><%=rs.getString("scarp_weight") %></td>
<td><%=rs.getString("request_date") %></td>
<td><%=rs.getString("pickup_date") %></td>
<td><%=rs.getString("status") %></td>
<td class="w3-text-center">
    <a href="delete.jsp?accept&d=<%=rs.getString("id")%>"><i class="w3-button w3-yellow">Accepted</i></a>
    <br><br>
    <a href="delete.jsp?done&d=<%=rs.getString("id")%>" ><i class="w3-button w3-green">Done</i></a>
    
</td>
</tr>
<%
}
         
 }
            catch(Exception ex){
           out.print(ex);
    }
 %>
 </center></table><br><br><br>
<strong><center><h2>Total Scarp Available</h2></center></strong>
<table  border="5" id="customers" bordercolor="#272785" align="center"  bgcolor="#FBFBFB" >
<tr>
  <th>Scarp Name</th>
     <th>Total_Weight</th>
</tr>
<%
          try{  Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        
    PreparedStatement ps=con.prepareStatement("SELECT scarp_name, sum(scarp_weight) from request group by scarp_name;");
          ResultSet rs=ps.executeQuery();
            
while(rs.next()){
       
%><tr>
<td><%=rs.getString("scarp_name") %></td>
<td><%=rs.getString("sum(scarp_weight)") %></td>

</tr>
<%

}    
 }
            catch(Exception ex){
           out.print(ex);
    }
 %>

 </table>
 
   
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
