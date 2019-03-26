<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
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
      
        <td style="padding:20px; font-size:50px; color:white" align="center"  colspan="4"><font face = "Comic sans MS">HEY! Admin </font></td>
     
      </tr>
      <tr>
      
        <td style="padding:5px; font-size:30px;" align="center"  colspan="4"><font face = "Comic sans MS">Following Products are in your Cart</font></td>
     
      </tr>
  
       <% 

   try {	
	
	//String scl=session.getAttribute("uname").toString();
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
	
	Statement st=con.createStatement();
	
	String query="select * from user_activity";
	
	ResultSet rs = st.executeQuery(query);
	//String name="";

	
	HashMap<String, Integer> hsk=new HashMap<>();
	
	   //Statement st2=con.createStatement();
	while(rs.next())
	{
		String name=rs.getString("cart");
		
	     if(hsk.containsKey(name))
		  {
	    	 hsk.put(name,hsk.get(name)+1);
		  }
	     else
	    	 hsk.put(name,1);
	
   }
	String vv="";
	int kk=0;
	for(String x:hsk.keySet())
	{
		vv=x;
		kk=hsk.get(x);
		%><tr>
		   <td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">
		   PRODUCT NAME : <%=vv %></font><br />
		   </td>
		  </tr>
		  <tr>
		   <td style="padding:10px; font-size:20px;" align="center"  colspan="4"><font face = "Comic sans MS">
		  No. Of Times Recommended : <%=kk %></font><br />
		   </td>
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
	