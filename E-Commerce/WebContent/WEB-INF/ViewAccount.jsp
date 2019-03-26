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
      
        <td style="padding:5px; font-size:30px;" align="center"  colspan="4"><font face = "Comic sans MS">Following is Your details</font></td>
     
      </tr>
  
       <% 

   try {	
	
	String scl=session.getAttribute("uname").toString();
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
	
	Statement st=con.createStatement();
	
	String query="select * from userbank where user_name='"+scl+"'";
	
	ResultSet rs = st.executeQuery(query);
	String name="";
	String sclid="";
	String lname="";
	String email="";
	String age="";
	String bio="";
	String branch="";
	int interest=0;
	
	while(rs.next())
	{
		name=rs.getString("user_name");
	    sclid=rs.getString("bank_name");
		lname=rs.getString("password");
		email=rs.getString("e_mail");
		age=rs.getString("address");
	    bio=rs.getString("mobile_no");
		branch=rs.getString("branch");
		interest=rs.getInt("amount");
	
	
	%>
	<tr>
	<td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">BANK NAME : <%=sclid %></font> <br /></td>
	</tr>
	<tr>
	<td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">
	USER_NAME : <%=name %></font><br />
	</td></tr>
	
	<td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">
	EMAIL : <%=email %></font><br /></td>
	</tr>
    <tr>
	<td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">
	ADDRESS: <%=age %></font><br />
	</td></tr>
	
	<tr>
	<td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">CONTACT NO : <%=bio %></font> <br /></td></tr>
	<tr>
	<td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">
	Branch : <%=branch %></font><br /></td>
	</tr>
	<tr>
	<td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">MONEY IN WALLET : <%=interest %></font> <br /></td>
	</tr>
	<%
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
	