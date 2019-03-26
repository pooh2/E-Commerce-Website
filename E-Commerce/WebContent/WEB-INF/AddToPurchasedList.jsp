<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
try

{   
	
	String scl=session.getAttribute("uname").toString();
	String bnk=session.getAttribute("bn").toString();
	String money=session.getAttribute("price").toString();
	String pn=session.getAttribute("pname").toString();
	int n=Integer.parseInt(money);
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
		//String password=rs.getString("password");
		String bankname=rs.getString("bank_name");
		if(username.equals(scl) && bankname.equals(bnk))
		{   
		
			m=rs.getInt("amount");
			m=m-n;
			//response.sendRedirect("index.jsp");
		}
		
	
	}
    
	
	String sql2="UPDATE userbank SET amount=? WHERE user_name=? AND bank_name=?";
	
	PreparedStatement st3=con.prepareStatement(sql2);
    st3.setInt(1, m);
    st3.setString(2, scl);
    //st3.setString(3, pass);
    st3.setString(3, bnk);
	row=st3.executeUpdate();

	
	String sql3="UPDATE user_activity SET purchased=? WHERE user_name=?";
	PreparedStatement st4=con.prepareStatement(sql3);
	st4.setString(1, pn);
	st4.setString(2, scl);
	
	int row2=st4.executeUpdate();
	if(row>0 && row2>0)
	{
		 response.sendRedirect("SearchProduct.jsp");
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