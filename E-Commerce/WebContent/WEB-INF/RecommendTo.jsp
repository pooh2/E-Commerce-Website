<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <h1>Recommend <%=session.getAttribute("pname") %> To </h1>
 
 
<div class="search">

<br><br><br><br>
<p>Category</p>

<form name="frm" method="post">
<input type="text" name="srch" placeholder="name.." >
<input type="submit" class="button button2" onclick="return check(this.form)" value="send"/> 
</form>

</div>


<% 

try
{
	String str1=session.getAttribute("pname").toString();
	String str2=request.getParameter("srch").toString();
	
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce", "root", "1234");

String query="INSERT INTO user_activity(user_name,recommended) VALUES (?,?)";

PreparedStatement st=con.prepareStatement(query);

st.setString(1,str2);
st.setString(2,str1);


int row=st.executeUpdate();
st.clearParameters(); 
if(row>0)
{ 
	 response.sendRedirect("SearchProduct.jsp");
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