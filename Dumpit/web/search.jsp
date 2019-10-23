<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Search</title>
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

<!-- servives --><br><br><br><br>
      <h1><b><i class="fa fa-dashboard"></i> My Dashboard</b></h1>
<!--------------------------------------User Details---------------------------------------------------------->
<% String search = request.getParameter("search");%>
<%
    String name =request.getParameter("Email_id");
    
    if(session.getAttribute("admin")!=null || session.getAttribute("vendor")!=null){
       try{
 %>
 <strong><center><h2>User Details</h2></center></strong>
<table  border="5" id="customers" bordercolor="#272785" align="center"  bgcolor="#FBFBFB" >
<tr>
<th>Name</th>
<th>Email_id</th>
<th>Phone no</th>
<th>address</th>
<th>Gender</th>
<th>Date of birth</th>
<th>City</th>
<th>Action</th>
</tr>

<%
 
         Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("select * from  user_detail where e_mail like '"+search+"%'");
        ResultSet rs=ps.executeQuery();
            
while(rs.next()){

%>
<tr>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("e_mail") %></td>
<td><%=rs.getString("phone") %></td>
<td><%=rs.getString("address") %></td>
<td><%=rs.getString("gender") %></td>
<td><%=rs.getString("dob") %></td>
<td><%=rs.getString("city") %></td>
<td>    
    <a href="update.jsp?edit&email=<%=rs.getString("e_mail")%>"><i class="w3-button w3-yellow">Edit</i></a>
    <br>
    <a href="delete.jsp?remove&d=<%=rs.getString("e_mail")%>" ><i class="w3-button w3-red">Remove</i></a>
    <br>
</td>
</tr>

<%
}
         
 }
            catch(Exception ex){
           out.print(ex);
    }
%>
</center></table> 
<%}
%>

<!-------------------------------------Messages--------------------------------->

 <%
    if(session.getAttribute("admin")!=null|| session.getAttribute("vendor")!=null){
       try{
 %>
 <strong><center><h2>Messages</h2></center></strong>
<table  border="5" id="customers" bordercolor="#272785" align="center"  bgcolor="#FBFBFB" >
<tr>
<th>Name</th>
<th>Email_id</th>
<th>address</th>
<th>Subject</th>
<th>Message</th>
</tr>

<%
         Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("select * from  contact where  e_mail like '"+search+"%'");
        
       
            ResultSet rs=ps.executeQuery();
            
while(rs.next()){

%><tr>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("e_mail") %></td>
<td><%=rs.getString("address") %></td>
<td><%=rs.getString("subject") %></td>
<td><%=rs.getString("message") %></td>
</tr>
<%
}  
 }
            catch(Exception ex){
           out.print(ex);
    }
    
}
%>
<!-----------------------------------payment----------------------------------------------->
<%
    if(session.getAttribute("vendor")!=null||session.getAttribute("admin")!=null){
       try{
 %>
 <strong><center><h2>Payment Details</h2></center></strong>
<table  border="5" id="customers" bordercolor="#272785" align="center"  bgcolor="#FBFBFB" >
<tr>
<th>vendor Email Id</th>
<th>Scrap Type</th>
<th>Amount</th>
<th>User Email Id</th>
<th>City</th>
<th>Date</th>
</tr>

<%
         Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("select * from  payment where user_mail like '"+search+"%'");
        
       
            ResultSet rs=ps.executeQuery();
            
while(rs.next()){

%><tr>
<td><%=rs.getString("vendor_email") %></td>
<td><%=rs.getString("scrap_types") %></td>
<td><%=rs.getString("amount") %></td>
<td><%=rs.getString("user_mail") %></td>
<td><%=rs.getString("city") %></td>
<td><%=rs.getString("date") %></td>
</tr>
<%
}
         
 }
            catch(Exception ex){
           out.print(ex);
    }
    
}
%>
</table>

<!-----------------------------------vendor payment----------------------------------------------->
<%
    if(session.getAttribute("admin")!=null|| session.getAttribute("vendor")!=null){
       try{
 %>
 <strong><center><h2>Payment Details</h2></center></strong>
<table  border="5" id="customers" bordercolor="#272785" align="center"  bgcolor="#FBFBFB" >
<tr>
<th>vendor Email Id</th>
<th>Scrap Type</th>
<th>Amount</th>
<th>User Email Id</th>
<th>City</th>
<th>Date</th>
</tr>

<% String vendor_email=session.getAttribute("vendor").toString();
         Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("select * from  payment where vendor_email= '"+search+"%' ");
        
       
            ResultSet rs=ps.executeQuery();
            
while(rs.next()){

%><tr>
<td><%=rs.getString("vendor_email") %></td>
<td><%=rs.getString("scrap_types") %></td>
<td><%=rs.getString("amount") %></td>
<td><%=rs.getString("user_mail") %></td>
<td><%=rs.getString("city") %></td>
<td><%=rs.getString("date") %></td>
</tr>
<%
}
         
 }
            catch(Exception ex){
           out.print(ex);
    }
    
}
%>
</table>
<!--------------------------------Scarp Request------------------------------------------------------------------------>

<% 
    if(session.getAttribute("admin")!=null|| session.getAttribute("vendor")!=null){
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
<th>Pick up Date</th>
<th>Status</th>
<th>Action</th>
</tr>

<%
         Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("select * from  request where email like '"+search+"%'");
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
</center></table>
<% }%>
<!----------------------------------------------------vendor Details------------------------------------>
<%
    if(session.getAttribute("admin")!=null|| session.getAttribute("vendor")!=null){
       
 %>
 <strong><center><h2>Vendor Details</h2></center></strong>
<table  border="5" width="70%" id="customers" bordercolor="#272785" align="center"  bgcolor="#FBFBFB" >
<tr>
<th>Name</th>
<th>Email_id</th>
<th>Phone no</th>
<th>address</th>
<th>Gender</th>
<th>Date of birth</th>
<th>City</th>
<th>Action</th>
</tr>

<%
   // if(request.getParameter("getdetail")!= null){
       try{
            //String login_type= request.getParameter("type");
 
         Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("select * from  vendor_detail where e_mail like '%"+search+"%'");
        
       
            ResultSet rs=ps.executeQuery();
            
while(rs.next()){

//response.sendRedirect("user_home.jsp");
%><tr>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("e_mail") %></td>
<td><%=rs.getString("phone") %></td>
<td><%=rs.getString("address") %></td>
<td><%=rs.getString("gender") %></td>
<td><%=rs.getString("dob") %></td>
<td><%=rs.getString("city") %></td>
<td >
<center> <a href="delete.jsp?vendorremove&d=<%=rs.getString("e_mail")%>" ><i class="w3-button w3-red">Remove</i></a>
    <br><br>  <a href="vendor_profile.jsp?vendoredit&email=<%=rs.getString("e_mail")%>"><i class="w3-button w3-green">&nbsp;&nbsp;Edit&nbsp;&nbsp;</i></a>
    </td></center>
</tr>
<%
}
      
 }
            catch(Exception ex){
           out.print(ex);
    }
 
%>


</center></table>
<%}%>






<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
<!-- Footer -->
<jsp:include page="footer.jsp" />
 

</body>
</html>
