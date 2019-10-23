<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>

<html>
<title>update</title>
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

<!-- Sidebar on small screens when clicking the menu icon -->

<%
       String id=request.getParameter("email"); 
%>

<!-----------------------------------vendor profile------------------------------------------->

<%
    //if(request.getParameter("user_details")!= null){
      
if(request.getParameter("vendoredit")!=null){
    try{
           Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("select * from  vendor_detail where e_mail='"+id+"'");
        ResultSet rs=ps.executeQuery();
            
if(rs.next()){
     
 %>
<form  action="vendor_profile.jsp?email=<%=rs.getString("e_mail")%>" method="post" >

<table border="5" id="customers" bordercolor="#272785" method="post"align="center" width="41%" bgcolor="#FBFBFB" >

<caption><strong><h2>Update</strong></h2></caption>

<tr>

<th>Enter your name</th>

<td><center><input type="text" name="name" id="name" maxlength="20" value="<%=rs.getString("name") %>"  placeholder="   Enter your name" required/></td>
</center>
</tr>


<tr>

<th>Enter your mobile</th>

<td><center><input  type="text" pattern="[0-9]{8-10}" value ="<%=rs.getString("phone") %>" name="mobile" titel="Enter proper mobile no" placeholder="Enter your Mobile no." required/></td>
</center>
</tr>

<tr>

<th>Enter your address</th>

<td><center><input type="text" value="<%=rs.getString("address")%>" name="address"></textarea></td>
</center>
</tr>
<tr>

<th>Select your City</th>

<td><center>

<select name="city" value="<%=rs.getString("city")%>"    required>

<option value=""  disabled="disabled">Select your City</option>
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

<th>Select your DOB</th>

<td><center><input type="date" value="<%=rs.getString("dob") %>" name="dob"  required/></td>
</center>
</tr>
<tr>

<td colspan="2" align="center"><input type="submit" name="save" value="Save"/>

<input type="reset" value="Reset Data"/>

</td>

</tr>

<%
}
         
 }
            catch(Exception ex){
           out.print(ex);
    
}

%>

</table>
</form>
<%}
%>








<%
    if(request.getParameter("save")!=null){
      
    try{
       String name=request.getParameter("name");
        String selectedcity=request.getParameter("city");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String dob=request.getParameter("dob");
               
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("update vendor_detail set name = '"+name+"' ,phone='"+mobile+"',address='"+address+"',dob='"+dob+"',city='"+selectedcity+"' where e_mail = '"+id+"' ");
        int i=ps.executeUpdate();
             if(i>0){
            out.print("<script>alert'('Data has been updated successfully');</script>");
            
            }
              
        }catch(Exception ex){
          
            out.print("<script>alert('"+ex+"');</script>");
        }
  
        finally{
            if(session.getAttribute("admin")!=null){
            response.sendRedirect("output.jsp?vendor_detail");
        } if(session.getAttribute("vendor")!=null){
            response.sendRedirect("myprofile.jsp");
        
        }
    
    }
    }
  
%>


