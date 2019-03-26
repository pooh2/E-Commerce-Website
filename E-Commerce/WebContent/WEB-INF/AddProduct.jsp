<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Student</title>
<link rel="stylesheet" href="addproduct.css" type="text/css">
</head>
<body style="background-image:url(compass.jpg)">
     
   
         <h3><font size="12px" face="verdana" >SignUp</font></h3>
     
      
     
          
         
          <form method="POST">
           
          <fieldset>
          <legend><span class="number">1</span>Your basic info</legend>
          <label for="category">Category :</label>
          <input type="text" id="name" name="category">
          
          <label for="pname">Product Name:</label>
          <input type="text" id="name" name="pname">
          
          <label for="discreption">Discreption :</label>
          <input type="text" id="name" name="discreption">
          
          <label for="price">Price :</label>
          <input type="text" id="mail" name="price">
         
          <label for="brand">Brand :</label>
          <input type="text" id="mail" name="brand">
        
          </fieldset>
       
       <button type="submit">Sign Up</button>
          
           
            <%  
    
		try {
			   String category;
			   String pname;
			   String discreption;
			   String price;
			   String brand;
			   
			
			   
			   category=request.getParameter("category").toString().toLowerCase();
			   pname=request.getParameter("pname").toString().toLowerCase();
			   discreption=request.getParameter("discreption").toString().toLowerCase();
			   price=request.getParameter("price").toString().toLowerCase();
			   brand=request.getParameter("brand").toString().toLowerCase();
			   
			  // interest=request.getParameter("interest").toString().toLowerCase();
			  			   

				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/e_commerce","root","1234");
				
				
				String sql="INSERT INTO product(category,product_name,discreption,price,brand) VALUES (?,?,?,?,?)";
				
				PreparedStatement st=con.prepareStatement(sql);
				
			st.setString(1,category);
			st.setString(2,pname);
			st.setString(3,discreption);
			st.setString(4,price);
			st.setString(5,brand);
			
		
			
			int row=st.executeUpdate();
			 st.clearParameters(); 
			if(row>0)
			{
				 response.sendRedirect("WelcomeAdmin.jsp");
			}
			
			con.close();
			
		  }
		
		catch (Exception e) 
		
		{
			e.getStackTrace();
		}
  
 %>
          
           
      </form>        
            <p>
             <a href="WelcomeAdmin.jsp">back to list</a>
            </p>
   
   

      
</body>
</html>