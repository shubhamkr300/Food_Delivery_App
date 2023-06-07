<%@page import="com.ofd.dao.ProductDao"%>
<%@page import="com.ofd.dao.CartDao"%>
<%@page import="com.ofd.model.Product"%>
<%@page import="com.ofd.model.User"%>
<%@page import="com.ofd.model.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Product prod = new Product();
int id = 0;
try {
	int Sno = (Integer) session.getAttribute("Sno");
	id = Integer.parseInt(request.getParameter("id"));
	prod = ProductDao.getProductbyId(id);

	int Quan = 1;
	String bot = request.getParameter("bot");
	if (bot != null) {
		if (bot.equals("add")) {
	Cart c = new Cart();
	c.setUserId(Sno);
	c.setProductid(id);
	c.setQuantity(Quan);

	int i = CartDao.AddToCart(c);
	if (i > 0) {
		response.sendRedirect("home.jsp");
	} else {
		System.out.println("Not Added");
	}
		}
	}
} catch (Exception e) {
	System.out.println("Not " + e.getLocalizedMessage());
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

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
				<li class="item"><a href="signup.jsp">Signup</a></li>
				<li class="item"><a href="login.jsp">Login</a></li>
				<li class="item"><a href="#">Admin Login</a></li>
			</ul>
		</nav>
	</header>

	<section id="details">
		<div class="container">
			<div class="row" id="1">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body" id="tab">
							<h3>Food Details</h3>
							<table>
								<thead>
								</thead>
								<tbody>
									<tr>
										<td>Category : <%=prod.getCategory()%></td>
									</tr>
									<tr>
										<td>Description : <%=prod.getDescription()%></td>
									</tr>
									<tr>
										<td>Product name : <%=prod.getProductname()%></td>
									</tr>
									<tr>
										<td>Size : <%=prod.getSize()%></td>
									</tr>
									<tr>
										<td>Price : <%=prod.getSP()%></td>
									</tr>
								</tbody>
							</table>
							<form action="food_details.jsp?id=<%=id %>" method="post">
								<button type="Submit" class="btn btn-success" name="bot"
									value="add">Add to Cart</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>




	<!--Custom js-->
	<script src="js/script.js"></script>
</body>
</html>
