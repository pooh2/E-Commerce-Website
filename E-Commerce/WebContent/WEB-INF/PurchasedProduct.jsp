<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Amount In Wallet</h1>

 
<div class="search">

<br><br><br><br>
<p>Category</p>

<form name="frm" method="post">
<input type="text" name="srch" placeholder="Enter Bank Name" >
<input type="submit" class="button button2" onclick="return check(this.form)" value="send"/> 
</form>

</div>

<% session.setAttribute("bn", request.getParameter("srch")); %>
<% 
   try {	
	
	String scl=session.getAttribute("uname").toString();
	String bn=request.getParameter("srch").toString();
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
	
	Statement st=con.createStatement();
	
    String query="select * from userbank where user_name='"+scl+"' and bank_name='"+bn+"'";
	
	ResultSet rs = st.executeQuery(query);
	
	int amount=0;
	
	while(rs.next())
	{
		
		amount=rs.getInt("amount");
	}
	
	%>
	
	
	
	<tr>
	<td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">Total : <%=amount %></font> <br /></td>
	</tr>
    <form name="frm" method="post">
    <input type="text" name="srch" placeholder="Enter Bank Name" >
    <input type="submit" class="button button2" onclick="return check(this.form)" value="send"/> 
    </form>
	<%
	response.sendRedirect("AddToPurchasedList.jsp");
 }
 catch(Exception e)
 {
  e.printStackTrace();
 }

%>

</body>
</html>