<%-- 
    Document   : delete
    Created on : Sep 2, 2019, 11:39:41 PM
    Author     : Deeepak
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
        <!-------------------------------delete----------------              -->
     <% 
        if(request.getParameter("remove")!=null){
        String id=request.getParameter("d");
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("delete from user_detail where e_mail = '"+id+"' ");
       int i=ps.executeUpdate();
       if(i>0){
          PreparedStatement ps1=con.prepareStatement("delete from user_login where user_id = '"+id+"' ");
         int j=ps1.executeUpdate();
         out.print("<script>alert('User has remove from record');window.location.assign('output.jsp?user_details');</script>");
       } 
       
        }    catch(Exception ex){
                     out.print(ex);
           
        }
     
}  
%>
<!-----------------------------------------delete vendor------------------------------->
        
        <% 
        if(request.getParameter("vendorremove")!=null){
        String id=request.getParameter("d");
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("delete from vendor_detail where e_mail = '"+id+"' ");
       int i=ps.executeUpdate();
       if(i>0){
          PreparedStatement ps1=con.prepareStatement("delete from vendor_login where user_id = '"+id+"' ");
         int j=ps1.executeUpdate();
         out.print("<script>alert('User has remove from record');window.location.assign('output.jsp?vendor_details');</script>");
       } 
       
        }    catch(Exception ex){
                     out.print(ex);
           
        }
             
}  
%>   
<!------------------------------------------Remove Request----------------------------------->
        <% String name=session.getAttribute("name").toString();
    if(request.getParameter("done")!=null){
       int id=Integer.parseInt(request.getParameter("d"));
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("update request set status = ?  where id = '"+id+"' ");
        ps.setString(1,"Completed on "+new java.util.Date()+ " by " +name);
       int i=ps.executeUpdate();
     if(i>0){
         
          out.print("<script>alert('Request has completed successfully');window.location.assign('output.jsp?pickup_request');</script>");
     }
    
        }    catch(Exception ex){
                     
           out.print(ex);
     }
            
    }     
 
%><!------------------------------------------Change status of Request----------------------------------->
        <% 
    if(request.getParameter("accept")!=null){
       int id=Integer.parseInt(request.getParameter("d"));
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dumpit","root","");
        PreparedStatement ps=con.prepareStatement("update request set status = ?  where id = '"+id+"' ");
       ps.setString(1,"Accepted by "+name);
        int i=ps.executeUpdate();
       if(i>0){
          
          out.print("<script>alert('Accepted by '"+name+"');window.location.assign('output.jsp?pickup_request');</script>");
              
           
       }
       
        }    catch(Exception ex){
                     out.print(ex);
       
        }  
    }     
 
%>
    </body>
</html>
