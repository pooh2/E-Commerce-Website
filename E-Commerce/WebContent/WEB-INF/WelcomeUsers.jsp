<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=70%, initial-scale=1">
<link rel="stylesheet" href="WelcomeAdmin.css" type="text/css">

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
  <a href="ManageBankAccount.jsp">Manage Bank Account</a>
  <a href="SearchProduct.jsp">Search Product</a>
  <a href="ViewCartProduct.jsp">View Cart Product</a>
  <a href="ViewRecomended.jsp">View Recommended Product</a>
  <a href="ViewPurchasedProduct.jsp">View Purchased Product</a>
  <form method="link" align="middle" action="LogOut.jsp">
    <input type="submit" value="Logout"/>
</form>
</div>

<div class="login">

<h1>WELCOME 
<%  String h=session.getAttribute("uname").toString().toUpperCase();
    out.println(h);
    
    %></h1>

<img src="carear2.jpg" style="width:70%;height:200px; " align="middle">



</div>

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
