<%@page import="com.ofd.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Admin Login</title>
<link rel="icon" href="img/mini_logo.png" type="image/png">

<link rel="stylesheet" href="css/bootstrap1.min.css" />

<link rel="stylesheet" href="vendors/themefy_icon/themify-icons.css" />
<link rel="stylesheet" href="vendors/font_awesome/css/all.min.css" />


<link rel="stylesheet" href="vendors/scroll/scrollable.css" />

<link rel="stylesheet" href="css/metisMenu.css">

<link rel="stylesheet" href="css/style1.css" />
<link rel="stylesheet" href="css/colors/default.css" id="colorSkinCSS">
</head>
<body class="crm_body_bg">

	<%
	try {
		String isLogin = (String) session.getAttribute("isLogin");
		if (isLogin == null) {

			String uNam = request.getParameter("txtUserName");
			String pass = request.getParameter("txtPass");

			System.out.println("Params: " + uNam);

			if (!uNam.equals(null) && !pass.equals(null)) {

		int i = LoginDao.SystemLogin(uNam, pass);

		if (i > 0) {
			session.setAttribute("isLogin", "true");
			response.sendRedirect("Dashboard.jsp");
		} else
			out.println("Wrong Username and Password");
		}
			
		} else {
			response.sendRedirect("Dashboard.jsp");
		}
	} catch (Exception ex) {
	}
	%>


	<section class="main_content dashboard_part large_header_bg"
		style="padding-left: 0px !important">

		<div class="main_content_iner ">
			<div class="container-fluid p-0">

				<div class="col-lg-12">
					<div class="white_box mb_30">
						<div class="row justify-content-center">
							<div class="col-lg-4">

								<div class="modal-content cs_modal">
									<div class="modal-header justify-content-center theme_bg_1">
										<h5 class="modal-title text_white">Log in</h5>
									</div>
									<div class="modal-body">
										<form action="index.jsp" method="post">
											<div class="">
												<input type="text" class="form-control"
													placeholder="Enter your User Name" name="txtUserName">
											</div>
											<div class="">
												<input type="password" class="form-control"
													placeholder="Password" name="txtPass">
											</div>
											<button type="Submit" class="btn_1 full_width text-center">Login</button>
											<!-- <p>
												Need an account? <a data-bs-toggle="modal"
													data-bs-target="#sing_up" data-bs-dismiss="modal" href="#">
													Sign Up</a>
											</p>
											<div class="text-center">
												<a href="#" data-bs-toggle="modal"
													data-bs-target="#forgot_password" data-bs-dismiss="modal"
													class="pass_forget_btn">Forget Password?</a>
											</div> -->
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer_part">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="footer_iner text-center">
							<p>
								2023 © Online Food Delivery - Designed by <a href="#"> <i
									class="ti-heart"></i>
								</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<script src="js/jquery1-3.4.1.min.js"></script>

	<script src="js/popper1.min.js"></script>

	<script src="js/bootstrap1.min.js"></script>

	<script src="js/metisMenu.js"></script>

	<script src="vendors/scroll/perfect-scrollbar.min.js"></script>
	<script src="vendors/scroll/scrollable-custom.js"></script>

	<script src="js/custom.js"></script>
</body>
</html>