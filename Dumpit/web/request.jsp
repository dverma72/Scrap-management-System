<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<title>Pick Up Request</title>
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
	<%}else{response.sendRedirect("login.jsp");}%>
<%
	if(session.getAttribute("admin")!=null)
	{flag=true;
%>
<jsp:include page="admin_header.jsp"/>
	<%}%>
        <% if(flag==false)
        {%>
<jsp:include page="home_header.jsp"/>
<%}%><!--Registration-->
<br><br><br><br>
<form action="request.jsp" method="post" >

<table border="5" bordercolor="#272785" id="customers"  align="center" width="41%" bgcolor="#FBFBFB" >

<caption><strong><h2>Request for Pickup now</strong></h2></caption>

<tr>

<th>Enter Scarp Type</th>

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

<th>Alternate Mobile No</th>

<td><center><input type="text" pattern="[0-9]{8-10}" maxlength="10" name="altmobile" placeholder="Enter your alt mobile no" required/>
</td></center>
</tr>



<tr>

<th>Enter Scrap Weight </th>

<td><center>

<input type="text" name="weight" placeholder="Enter Weight in KG" />
</td>
</center>


</tr>

<tr>

<th>Pick up Date and date</th>

<td><center><input type="date" name="date" min="<%=(new java.util.Date()).toString()%>" placeholder=" Select your date of birth" required/>  &nbsp;
</td>
</center>
</tr>



<tr>
<td  colspan="2" align="center">
    <input class="w3-red" type="reset" value="Reset Data"/> 
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

<input class="w3-red" type="submit" name="send" value="Send Request"/>

</td>
</tr>

</table>

</form>

<br><br>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
 
  <p>Powered by Deepak verma</p>
</footer>
 

</body>
</html>

<%
    if(request.getParameter("send")!=null){
        try{
       String name,city,mobile,address;
       String altmobile =request.getParameter("altmobile");
        int scarp_weigth =Integer.parseInt(request.getParameter("weight"));
        String scarp_name =request.getParameter("item");
         
        String pickup_date =request.getParameter("date");
          String  email = session.getAttribute("user").toString();
	    
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("select * from user_detail where e_mail like '"+email+"'");
       
            ResultSet rs=ps.executeQuery();
                if(rs.next())
            {
                    name =rs.getString("name");
                    mobile =rs.getString("phone");
                    address =rs.getString("address");
                    city =rs.getString("city");
                    
                    PreparedStatement p=con.prepareStatement("insert into request(name,mobile,alternate_moblie,email,address,city,scarp_name,scarp_weight,request_date,pickup_date) values(?,?,?,?,?,?,?,?,?,?)");
		
                    p.setString(1, name);
                    p.setString(2, mobile);
                    p.setString(3, altmobile);
                    p.setString(4, email);
                    p.setString(5, address);
                    p.setString(6, city );
                    p.setString(7, scarp_name);
                    p.setInt(8, scarp_weigth);
                    p.setString(9, ""+new java.util.Date()+"");
                    
                    p.setString(10, pickup_date);
                    p.executeUpdate();
                    out.print("<script>alert('Request Send Successfully');</script>");
                    
                }
                else
                {
                      out.print("<script>alert('Some Thing wnt wrong try again');</script>");
                   
                }
		
           
          
        }catch(Exception ex){
          
        
            out.print(ex);
            out.print("<script>alert('"+ex+"');</script>");
        }
    }
    
  
%>