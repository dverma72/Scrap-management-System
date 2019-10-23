<%-- 
    Document   : payment.jsp
    Created on : Aug 30, 2019, 7:39:43 PM
    Author     : Deepak
--%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>

<html>
<title>Payment</title>
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
<!-- Navbar (sit on top) -->



<!--Payment-->
<br><br><br><br>
<form  action="payment.jsp" method="post" onsubmit="checkPassword()">

<table border="5" id="customers" bordercolor="#272785" method="post"align="center" width="41%" bgcolor="#FBFBFB" >

<caption><strong><h2>Enter Payment Details</strong></h2></caption>

<tr>

<th>Enter Scrap Type</th>

<td><center>

<select name="scrap_type"  required>
    
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

<tr>

<th>Enter Weight</th>

<td><center><input  type="text" pattern="[0-9]{0-5}" name="amount" titel="Enter proper Amount" placeholder="Enter Amount." required/></td>
</center>
</tr>

<tr>
<th>Enter user Email Id</th>
<td><center>

<select name="user_email"  required>
    
<option value=""  >Select scarp type</option>
<%  
    try{
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
    PreparedStatement ps=con.prepareStatement("select * from user_detail");
        ResultSet rs=ps.executeQuery();
            
while(rs.next()){


 %>   
<option value="<%=rs.getString("e_mail") %>"><%=rs.getString("e_mail") %></option>

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

<td colspan="2" align="center"><input type="submit" name="pay" value="Make Payment"/>

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
    Author     : Sandip
--%>

<%
    if(request.getParameter("pay")!=null){
        try{
       String scrap_type=request.getParameter("scrap_type");
	   String email=request.getParameter("user_email");
        String amount=request.getParameter("amount");
		String city=request.getParameter("city");
                //String date=request.getParameter("date");
                
		String vendor_email = session.getAttribute("vendor").toString();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("insert into payment values(?,?,?,?,?,?)");
        ps.setString(1, vendor_email);
        ps.setString(2, scrap_type);       
        ps.setString(3,amount);
        ps.setString(4, email);
        ps.setString(5, city);
        ps.setString(6, ""+new java.util.Date()+"");
                int i=ps.executeUpdate();
                if(i>0)
                {
                  
                    out.println("<script>alert(Payment done successfully');</script>");
                    
                }
                else
                {
                      out.println("<script>alert('Some Thing went wrong try again');</script>");
                   
                }
		
           
          
        }catch(Exception ex){
            out.println("<script>alert('"+ex+"');</script>");
        }
    }
    
  
%>