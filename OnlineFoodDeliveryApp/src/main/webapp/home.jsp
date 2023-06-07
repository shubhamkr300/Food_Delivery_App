<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% /*String uid = request.getParameter("uid"); fetched from login page 

  String uname = request.getParameter("uNam");
  System.out.println(uname); */
  try{
	  Integer sessionData =  (Integer)session.getAttribute("Sno");
	  if(sessionData == null){
		  response.sendRedirect("login.jsp");
	  }
	  String action = request.getParameter("action");
	  if(action != null)
	  {
		  if(action.equals("logout")){
			  session.setAttribute("Sno",null);
			  response.sendRedirect("index.jsp");
		  }
	  }
  }catch(Exception e){
	  
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Best Online Food Delivery Service</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="component/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap"
	rel="stylesheet">
</head>
<body>
	<header>
		<nav id="navbar">
			<div id="logo">
				<img src="component/img/logo1.jpg" alt="MyOnlineMeal.com">
			</div>

			<ul>
				<li class="item"><a href="home.jsp">Home</a></li>
				<li class="item"><a href="#">Services</a></li>
				<li class="item"><a href="#">About us</a></li>
				<li class="item"><a href="#">Contact us</a></li>			
				<li class="item"><a href="login.jsp">Login</a></li>
				<li class="item"><a href="#">Admin Login</a></li>
				<li class="item"><a href="home.jsp?action=logout">Log Out </a>
				<li class="item"><a href="cart.jsp">Cart</a></li>
			</ul>
		</nav>
	</header>
	<section id="food_table">
		<table id="tab">
			<tr>
				<td><a href="food_details.jsp?id=1"><img
						src="component/img/food/img1.jpg"></a></td>
				<td><a href="food_details.jsp?id=2"><img
						src="component/img/food/img2.jpg"></a></td>
				<td><a href="food_details.jsp?id=3"><img
						src="component/img/food/img3.jpg"></a></td>
			</tr>
			<tr>
				<td><a href="food_details.jsp?id=4"><img
						src="component/img/food/img4.jpg"></a></td>
				<td><a href="food_details.jsp?id=5"><img
						src="component/img/food/img5.jpg"></a></td>
				<td><a href="food_details.jsp?id=6"><img
						src="component/img/food/img6.jpg"></a></td>
			</tr>
			<tr>
				<td><a href="food_details.jsp?id=7"><img
						src="component/img/food/img7.jpg"></a></td>
				<td><a href="food_details.jsp?id=8"><img
						src="component/img/food/img8.jpg"></a></td>
				<td><a href="food_details.jsp?id=9"><img
						src="component/img/food/img9.jpg"></a></td>
			</tr>
		</table>
	</section>
	<!--Custom js-->
	<script src="js/script.js"></script>
</body>
</html>
