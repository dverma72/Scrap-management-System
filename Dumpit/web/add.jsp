<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<title>Add</title>
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
<!--Registration-->

<br><br><br><br>
<!---------------------------------Add Vendor----------------->

<% if(request.getParameter("addvendor")!=null)
{ %>
<form action="add.jsp"  method="post"  >

<table border="5" bordercolor="#272785" align="center" width="41%" bgcolor="#FBFBFB" >

<caption><strong><h2>Add Vendor</strong></h2></caption>

<tr>

<th>Enter your name</th>

<td><center><input type="text" name="name" id="name" maxlength="10" title="enter vendor's first name" placeholder="   Enter your name" required/></td>
</center>
</tr>

<tr>

<th>Enter your password</th>

<td><center><input type="password" placeholder="   Enter password" name="pass" required/></td>
</center>
</tr>

<tr>

<th>ReEnter your password</th>

<td><center><input type="password" placeholder="   Plz Re-enter your password" required/></td>
</center>
</tr>

<tr>

<th>Enter your email</th>

<td><center><input type="email" placeholder="   Enter vendor's email" name="email_id" required/></td>
</center>
</tr>

<tr>

<th>Enter your mobile</th>

<td><center><input type="text" pattern="[0-9]{8-10}" title="Enter proper mobile no." placeholder="  Enter vendor's Mobile no." name="mobile" required/></td>
</center>
</tr>

<tr>

<th>Enter your address</th>

<td><center><textarea rows="4" cols="20" name="address"></textarea></td>
</center>
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
<option value="2">mankhurd</option>
<option value="2">chembur</option>
<option value="2">kurla</option>
<option value="2">sanpada</option>
<option value="2">nerul</option>
<option value="2">panvel</option>

</select>
</center>
</td>

</tr>
<tr>

<th>Select your gender</th>

<td><center>

Male<input type="radio" name="gender" value="Male"/>
Female<input type="radio" name="gender" value="Female"/>
</center>
</td>

</tr>


<tr>

<th>Select your DOB</th>

<td><center><input type="date" placeholder="MM/DD/YYYY" name="dob" required/></td>
</center>
</tr>
<tr>

<td colspan="2" align="center"><input type="submit" name="add" value="Add"/>

<input type="reset" value="Reset Data"/>

</td>

</tr>

</table>

</form>

<br><br>
<%}%>

<!--------------------------------------------Add Payment----------------------------------------->

<% if(request.getParameter("payment")!=null)
{ %>

<br><br>
<form  action="add.jsp" method="post" >

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

<th>Enter Scrap Weight </th>

<td><center>

<input type="text" name="weight" placeholder="Enter Weight in KG" />
</td>
</center>


</tr>
<tr>

<th>Enter Amount</th>

<td><center><input  type="number"  name="amount" titel="Enter proper Amount" placeholder="Enter Amount." required/></td>
</center>
</tr>

<tr>
<th>Select user Email Id</th>
<td><center>

<select name="user_email"  required>
    
<option value=""  >Select User Email Id</option>
<%  
    try{
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
    PreparedStatement ps=con.prepareStatement("select distinct email from request");
        ResultSet rs=ps.executeQuery();
            
while(rs.next()){


 %>   
<option value="<%=rs.getString("email") %>"><%=rs.getString("email") %></option>

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
<br><br><br><br><br><br><br><br><br><br><br><br>
<%}%>
<!--------------------------------------------Add Scarp-------------------------------------------------------->

<% if(request.getParameter("addscarp")!=null)
{ %>
<br><br>
<form  action="add.jsp" method="post" >

<table border="5" id="customers" bordercolor="#272785" method="post"align="center" width="41%" bgcolor="#FBFBFB" >

<caption><strong><h2>Add Scrap</strong></h2></caption>

<tr>

<th>Enter Scrap Type</th>

<td><center><input type="text" name="name" placeholder=" Enter Scrap name" required/></td>
</center>
</tr>

<tr>

<tr>

<th>Enter Amount</th>

<td><center><input  type="text" pattern="[0-9]{0-5}" name="amount" titel="Enter proper Amount" placeholder="Enter Amount." required/></td>
</center>
</tr>


<tr>

<th>Select Image</th>
<td><center><input type="file" name="image" accept="image/*"  </center></td>
</tr>
<tr>

<td colspan="2" align="center"><input type="submit" name="add_scarp" value="Add Scarp"/>

<input type="reset" value="Reset Data"/>

</td>

</tr>

</table>

</form>
<br><br><br><br><br><br><br><br><br><br><br><br>
<%
    
  }
%>

<!-------------------------------------              ------------------------------------------->
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
<!-------------Add scarp code-------------------------------->

<%
    if(request.getParameter("add_scarp")!=null){
        try{
        String name=request.getParameter("name");
	int amount=Integer.parseInt(request.getParameter("amount"));
        String image=request.getParameter("image");
                
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("insert into rate values(?,?,?)");
        ps.setString(1, name);
        ps.setInt(2, amount);       
        ps.setString(3,image);
                int i=ps.executeUpdate();
                if(i>0){
                    out.println("<script>alert('New Scarp Saved Successfully');window.location.assign('admin_home.jsp');</script>");
                    
                }
                else{
                
                    out.println("<script>alert('Some Thing went wrong try again'); window.location.assign('admin_home.jsp?add_scarp');</script>");
                  
                }
           
          
        }catch(Exception ex){
            out.print(ex);
            out.println("<script>alert('"+ex+"')</script>");
        }
       
    }
    %>
    
    <!-----------------------------------------Add Payment code--------->
    <%
    if(request.getParameter("pay")!=null){
       try{
       String scrap_type=request.getParameter("scrap_type");
	String email=request.getParameter("user_email");
        String amount=request.getParameter("amount");
	String city=request.getParameter("city");
                String weight=request.getParameter("weight");
                
		String vendor_email = session.getAttribute("vendor").toString();
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("insert into payment values(?,?,?,?,?,?,?)");
        ps.setString(1, vendor_email);
        ps.setString(2, scrap_type);       
        ps.setString(3,weight);      
        ps.setString(4,amount);
        ps.setString(5, email);
        ps.setString(6, city);
        ps.setString(7, ""+new java.util.Date()+"");
                int i=ps.executeUpdate();
                if(i>0)
                {
                  
                    out.println("<script>alert('Payment done successfully');window.location.assign('add.jsp?payment');</script>");
                    
                }
                else
                {
                      out.println("<script>alert('Some Thing went wrong try again');window.location.assign('add.jsp?payment');</script>");
                   
                }
		
           
          
        }catch(Exception ex){
            out.println("<script>alert('"+ex+"');</script>");
        }
        finally{
           // 
        }
    }
  
%>
<!--------------------------------------Add vendor Code--------------------------------------------->

<%
    if(request.getParameter("add")!=null){
        try{
       String name=request.getParameter("name");
	   String pass=request.getParameter("pass");
        String selectedcity=request.getParameter("city");
		String email=request.getParameter("email_id");
		String mobile=request.getParameter("mobile");
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");
		
                //----------MD5 Implementation--------------------------------------------------------	
        MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
mdAlgorithm.update(pass.getBytes());

byte[] digest = mdAlgorithm.digest();
StringBuffer hexString = new StringBuffer();

for (int i = 0; i < digest.length; i++) {
    pass = Integer.toHexString(0xFF & digest[i]);

    if (pass.length() < 2) {
        pass = "0" + pass;
    }

    hexString.append(pass);
}
String password =hexString.toString();
                
        out.println("ere");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("insert into vendor_detail values(?,?,?,?,?,?,?)");
        ps.setString(1,name);
        ps.setString(2, email);       
        ps.setString(3, mobile);
        ps.setString(4, address);
        ps.setString(5, gender);
        ps.setString(6,dob);
        ps.setString(7, selectedcity);
                int i=ps.executeUpdate();
                if(i>0)
                {
                    PreparedStatement login=con.prepareStatement("insert into vendor_login values(?,?)");

                    login.setString(1, email);
                    login.setString(2,password);
                    login.executeUpdate();
                    out.println("<script>alert('Vendor Added succesfully');window.location.assign('admin_home.jsp');</script>");
                    
                    
                }
                else
                {
                      out.print("<script>alert('Some Thing wnt wrong try again');window.location.assign('admin_home.jsp?add');</script>");
                      
                   
                }
	
          //  response.sendRedirect("admin_home.jsp");
        }catch(Exception ex){
          
            out.print("<script>alert('"+ex+"');</script>");
        }
//        finally{
//            response.sendRedirect("admin_home.jsp");
//        }
    }
    
%>
