
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>create account</title>

<style type="text/css">

.vertical-menu {
    width: 15%; /* Set a width if you like */
    margin: 20px;
    padding: 20px;
    float: left;
    
}

.vertical-menu a {
    background-color: #eee; /* Grey background color */
    color: black; /* Black text color */
    display: block; /* Make the links appear below each other */
    padding: 12px; /* Add some padding */
    text-decoration: none; /* Remove underline from links */
    border-radius: 4px;
    
}

.vertical-menu a:hover {
    background-color: #ccc; /* Dark grey background on mouse-over */
}

.vertical-menu a.active {
    background-color: #4CAF50; /* Add a green color to the "active/current" link */
    color: white;
    font-size: 20px;
}

.login {
  width: 65%;
  text-align:center;
  float: left;
  margin: 10px;
  padding: 4px;
}

td{
  font-size:23px;
}

table {
    border-radius:8px;
    -moz-border-radius:10px;
    border:2px solid black;
}

input
{
   -moz-border-radius: 10px;
    border-radius: 8px;
    padding:2px;
    margin:3px;
}

select, option {
    width: 250px;
    border-radius: 8px;
    padding:3px;
    margin:3px;
}

</style>

</head>

<body>

<img src="images/im2.jpg" style="width:100%;height:300px">

<div class="main">

<div class="vertical-menu">
  <a href="#" class="active">User Menu</a>
  <a href="index.jsp">Home</a>
  <a href="ManageBankAccount.jsp">Manage Bank Accounts</a>
  <a href="search.jsp">Search Products</a>
  <a href="ViewRecomended.jsp">View Recommended Product</a>
  <a href="ViewCartProduct.jsp">Purchase Cart Products</a>
  <a href="ViewPurchasedProduct.jsp">View Purchased Products</a>
  <a href="userlogin.jsp">Logout</a>
</div>

<div class="login">
<h2>Add Amount for Shopping</h2>
<br><br><br><br>

<form method="post">

<table id="table" width="50%" height="130px" align="center">
<tr></tr>
<tr>
<td></td>
<td>User Name:</td>
<td><input type="text" size=22 name="uname"  style="font-size:14pt;"></td>
</tr>

<tr>
<td></td>
<td>Bank Name:</td>
<td><input type="text" size=22 name="bname"  style="font-size:14pt;"></td>
</tr>

<tr>
<td></td>
<td>Password:</td>
<td><input type="password" size=22 name="pass"  style="font-size:14pt;"></td>
</tr>

<tr>
<td></td>

<td>Amount:</td>
<td><input type="text" size=22 name="amount"  style="font-size:14pt;"></td>
</tr>

<tr></tr><tr></tr><tr></tr>

<tr>
<td></td>
<td ><input type="Reset"></td>
<td><input type="submit" onclick="return check(this.form)" value="Add"></td>
</tr>


</table>
</form>
</div>

</div>


  
  
 
 
  
  
  <% 
  try
  {
   
	  String uname;
	  String pass;
	  String bname;
	  String amount;
	
	  uname=request.getParameter("uname").toString().toLowerCase();
	  pass=request.getParameter("pass").toString().toLowerCase();
	  bname=request.getParameter("bname").toString().toLowerCase();
	  amount=request.getParameter("amount").toString().toLowerCase();
	  int money=Integer.parseInt(amount);
	    
	  
    //response.sendRedirect("index.jsp");
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
	Statement st = con.createStatement();
	String query2="select * from userbank";
	ResultSet rs = st.executeQuery(query2);
	int m=0;
	int row=0;
	while(rs.next())
	{
		String username=rs.getString("user_name");
		String password=rs.getString("password");
		String bankname=rs.getString("bank_name");
		if(username.equals(uname) && password.equals(pass) && bankname.equals(bname))
		{   
		
			m=rs.getInt("amount");
			m=m+money;
			//response.sendRedirect("index.jsp");
		}
		
	
	}
    
	
	String sql2="UPDATE userbank SET amount=? WHERE user_name=? AND bank_name=?";
	
	PreparedStatement st3=con.prepareStatement(sql2);
    st3.setInt(1, m);
    st3.setString(2, uname);
    //st3.setString(3, pass);
    st3.setString(3, bname);
	row=st3.executeUpdate();
    
	

	
	if(row>0)
	{
		 response.sendRedirect("ManageBankAccount.jsp");
	}
	else
	{
		response.sendRedirect("index.jsp");
	}
	
	con.close();
	
  }

catch (Exception e) 

{
	e.getStackTrace();
}

%>
</body>
</html>