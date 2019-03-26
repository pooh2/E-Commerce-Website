<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Student</title>
<style>

 <%@ include file="addproduct.css"%>

</style>
</head>
<body style="background-image:url(compass.jpg)">
     
    
         <h3><font size="12px" face="verdana" >SignUp</font></h3>
   
      
    
                 
             <form method="link" align="middle" action="index.jsp">
                 <input type="submit" value="Home"/>
            </form>
   
         
           <form method="POST">
           
            <fieldset>
          <legend><span class="number">1</span>Your basic info</legend>
          <label for="username">User Name:</label>
          <input type="text" id="name" name="username">
          
          <label for="password">Password:</label>
          <input type="text" id="name" name="password">
          
          <label for="dob">Date_Of_Birth :</label>
          <input type="text" id="name" name="dob">
          
          <label for="email">Email:</label>
          <input type="text" id="mail" name="email">
         
          <label for="gender">Gender :</label>
          <input type="text" id="mail" name="gender">
        
          <label for="add">Address :</label>
          <input type="text" id="mail" name="add">
         
          <label for="mob">Mobile no:</label>
          <input type="text" id="mail" name="mob">
        
          </fieldset>
       
       <button type="submit">Sign Up</button>
          
           
            <%  
    
		try {
			   String username;
			   String password;
			   String dob;
			   String email;
			   String gender;
			   String add;
			   String mob;
			
			   
			   username=request.getParameter("username").toString().toLowerCase();
			   password=request.getParameter("password").toString().toLowerCase();
			   dob=request.getParameter("dob").toString().toLowerCase();
			   email=request.getParameter("email").toString().toLowerCase();
			   gender=request.getParameter("gender").toString().toLowerCase();
			   add=request.getParameter("add").toString().toLowerCase();
			   mob=request.getParameter("mob").toString().toLowerCase();
			  // interest=request.getParameter("interest").toString().toLowerCase();
			  			   

				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
				
				
				String sql="INSERT INTO temp_table(username,password,e_mail,date_of_birth,gender,address,mobile_no) VALUES(?,?,?,?,?,?,?)";
				
				PreparedStatement st=con.prepareStatement(sql);
				
			st.setString(1,username);
			st.setString(2,password);
			st.setString(3,email);
			st.setString(4,dob);
			st.setString(5,gender);
			st.setString(6,add);
			st.setString(7,mob);
		
			
			int row=st.executeUpdate();
			 st.clearParameters(); 
			if(row>0)
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
          
           
      </form>

      
</body>
</html>