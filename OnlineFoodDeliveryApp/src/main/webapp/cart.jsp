<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.ofd.dao.CartDao"%>
<%@page import="com.ofd.model.Cartpage"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  int userid = (Integer) session.getAttribute("Sno"); 
  List<Cartpage> clist = CartDao.getCartList(userid);
  
  int total = 0;
  for(Cartpage c : clist){
	total +=  c.getAmount();
	  
  }
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
							<h3>Cart</h3>
						<table class="table">
							<thead>
								<tr>
									<th>Cart Id</th>
									<th>Name</th>
									<th>Price</th>
									<th>Quantity</th> 
									<th>Amount</th>
								</tr>
							</thead>
							<tbody>
                                 <%
                                    for (Cartpage c : clist){
                                 %>
                                 <tr>
                                 <td><%=c.getCartId() %></td>
                                 <td><%=c.getName() %></td>
                                 <td><%=c.getPrice() %></td>
                                 <td>
                                 	<a href="increaseqty.jsp?id=<%=c.getCartId() %>&qt=<%=c.getQuantity()%>&am=<%=c.getPrice() %>" class="btn btn-success btn-sm">+</a>
                                 	<button class="btn btn-info btn-sm"><%=c.getQuantity()%></button>
                                 	<a href="decreaseqty.jsp?id=<%=c.getCartId() %>&qt=<%=c.getQuantity()%>&am=<%=c.getPrice() %>" class="btn btn-success btn-sm">-</a>
                                 </td>
                                 <td><%=c.getAmount() %></td> 
                                 </tr>
                                 <%
                                    }
                                 %>
                                 <tr><td align="">
                                     Total Amount =<%=total %>
                                 </td></tr>
                                 <tr><td align="">
                                 <a href="home.jsp" class="btn" name="btn" value="">Order Now</a>
                                 </td></tr>
							</tbody>
						</table>
						</div>
						</div>
					</div>
				</div>
			</div>
       </section>
</body>
</html>