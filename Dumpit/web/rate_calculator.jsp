<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<title>Rate Calculator</title>
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
<br><br><br><br><center><h2><b> Scrap Rate Calculator</b></h2></font></center>

<form action="rate_calculator.jsp" method="post" >
<table width="400 %"   align="center">
<tr>
<td><b>Please choose an item:</b></td>


<td><center>

<select name="item"  required>
    
<option value=""  >Select scarp type</option>
<%  
    try{
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
    PreparedStatement ps=con.prepareStatement("select * from rate");
        ResultSet rs=ps.executeQuery();
            
while(rs.next()){


 %>   
<option value="<%=rs.getString("name") %>"><%=rs.getString("name") %></option>

<%}
    }catch(Exception ex){          
    out.print("<script>alert('"+ex+"')</script>");
    }
%>
</select>
</center>
</td>
</tr>

<tr>
</tr>
<tr>
<td><b>Enter Quantity:</b></td>
<td><input type="number"  name="quantity">&nbsp;&nbsp;&nbsp;</td>
</tr>
<tr>
</tr>
<tr>
<td ><input type="Reset"></td>
<center><td><input type="submit" name="calculator" value="Calculate"></td></center>
</tr>

</table>
</form>

<br><br>
<center><h1><strong>Rate Card</strong></h1></center>
<div class="w3-container">
<table width="100%"  bgcolor="white"  border="3"  align="center">
<%  
    try{
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
    PreparedStatement ps=con.prepareStatement("select * from rate");
        ResultSet rs=ps.executeQuery();
          int i=0;  
while(rs.next()){
    if(i%4==0){%>
<tr><td ><center><img src="<%=rs.getString("image")%>" >
   <div class="media-body">
          <h4><%=rs.getString("name") %></h4>
			<strong><span class="text-success">Rs</span> <%=rs.getString("amount") %>.00 <small>per Kg</small></strong>
   </div></center>
  </td>
  <%}
else{
%>
<td ><center><img src="<%=rs.getString("image")%>" >
   <div class="media-body">
          <h4><%=rs.getString("name") %></h4>
			<strong><span class="text-success">Rs</span> <%=rs.getString("amount") %>.00 <small>per Kg</small></strong>
   </div></center>
  </td>

<%}
i=i+1;
}
    }catch(Exception ex){          
    out.print("<script>alert('"+ex+"')</script>");
    }
%>
</tr>
</table>
</div>
<br>

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


</html>
<%
    if(request.getParameter("calculator")!=null){
        try{
       
    Class.forName("com.mysql.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        String selecteditem=request.getParameter("item");     
        int q=Integer.parseInt(request.getParameter("quantity"));
       PreparedStatement ps=con.prepareStatement("select amount from rate where name=?");
        ps.setString(1,selecteditem);
       
 
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
       int  amount = rs.getInt(1);
    
         int  result =q*amount;
                out.print("<script>alert('Estimate cost is "+result+" Rs')</script>");
            }
           
          
        }catch(Exception ex){
            out.print(ex);
        }
    }
    
  
%>