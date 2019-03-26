<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login User</title>
<style>

 <%@ include file="LoginUsers.css"%>

</style>

</head>
<body>




<div class="main">

<div class="slideshow-container">

<div class="mySlides fade">
  <img src="book1.jpg" style="width:100%;height:300px; ">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <img src="book2.jpg" style="width:100%;height:300px; ">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <img src="career5.jpg" style="width:100%;height:300px; " align="middle">
  <div class="text">Caption Two</div>
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

<div class="vertical-menu">
  <a href="#" class="active">Sidebar Menu</a>
  <a href="index.jsp">Home</a>
  <a href="LoginAdmin.jsp">Admin</a>
  <a href="LoginAnalyst.jsp">Analyst</a>
  <a href="registeration.jsp">Register</a>
</div>

<div class="login">
<h2>User Login</h2>

<form name="alogin" method="post">


<table id="table" width="35%" height="130px" bgcolor="9999FF" align="center">
<tr></tr>
<tr>
<td></td>
<td>Username:</td>
<td><input type="text" size=18 name="uname" style="font-size:14pt;"></td>
</tr>

<tr>
<td></td>
<td>Password:</td>
<td><input type="Password" size=18 name="pass"  style="font-size:14pt;"></td>
</tr>

<tr>
<td></td>
<td ><input type="Reset" value="Reset"></td>
<td><input type="submit" onclick="return check(this.form)" value="Login"></td>
</tr>

</table>

</form>


</div>

<%

String uname=request.getParameter("uname");
String pass=request.getParameter("pass");

try {	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
	
	Statement st=con.createStatement();
	
	String query="select * from temp_table";
	
	ResultSet rs = st.executeQuery(query);
	
	while(rs.next())
	{
		String username=rs.getString("username");
		String password=rs.getString("password");
		
		if(username.equals(uname) && password.equals(pass))
		{   
		
		    session.setAttribute("uname", rs.getString("username"));
		    session.setAttribute("pass", rs.getString("password"));
			response.sendRedirect("WelcomeUsers.jsp");
			
		}
	}
	
	
	
}
catch(Exception e)
{
	e.printStackTrace();
}



%>


</div>

<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>




</body>
</html>