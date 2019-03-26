<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ece-Sec-B</title>
 <style>
     <%@ include file="studentprofile.css"%>
  </style>
</head>
<body>

  
      <table style=" color:white; background-color:#FF335F;  border-radius:20px;"  align="center" border="0px">
      <tr>
      
        <td style="padding:20px; font-size:50px; color:white" align="center"  colspan="4"><font face = "Comic sans MS">HEY! <%=session.getAttribute("uname").toString()%> </font></td>
     
      </tr>
      <tr>
      
        <td style="padding:5px; font-size:30px;" align="center"  colspan="4"><font face = "Comic sans MS">Following is Your Recommended Product</font></td>
     
      </tr>
  
       <% 

   try {	
	
	String scl=session.getAttribute("uname").toString();
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
	
	Statement st=con.createStatement();
	
	String query="select * from user_activity where user_name='"+scl+"'";
	
	ResultSet rs = st.executeQuery(query);
	String name="";

	
	   Statement st2=con.createStatement();
	while(rs.next())
	{
		name=rs.getString("recommended");
	
		if(name!=null)
		{	
			 String query2="select * from product where PRODUCT_NAME='"+name+"'";
	    %>
	
	   <tr>
	   <td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">
	   PRODUCT NAME : <%=name %></font><br />
	   </td></tr>
	
	
	  <%
	

		
	   ResultSet rs2 = st2.executeQuery(query2);
      
	   while(rs2.next())
	   {
		   %>
	    <tr>
	      <td><a href="ViewDetails.jsp?id=<%=rs2.getString("product_id") %>"><button align="center" type="button">View Details</button></a></td>
        </tr>
	    <% 
	   }
	 
	
	
    }
	
	
   }
	
	
    
 }
 catch(Exception e)
 {
  e.printStackTrace();
 }

%>
    </table>
  
<a href="ManageBankAccount.jsp">Go Back</a>
</body>
</html>
	