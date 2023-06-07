<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<!-- Mirrored from demo.dashboardpack.com/cryptocurrency-html/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Feb 2023 06:03:46 GMT -->
<head>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Admin Panel</title>
<link rel="icon" href="" type="">

<link rel="stylesheet" href="css/bootstrap1.min.css" />

<link rel="stylesheet" href="vendors/themefy_icon/themify-icons.css" /> 

<link rel="stylesheet" href="vendors/niceselect/css/nice-select.css" />

<link rel="stylesheet" href="vendors/owl_carousel/css/owl.carousel.css" />

<link rel="stylesheet" href="vendors/gijgo/gijgo.min.css" />

<link rel="stylesheet" href="vendors/font_awesome/css/all.min.css" />
<link rel="stylesheet" href="vendors/tagsinput/tagsinput.css" />

<link rel="stylesheet" href="vendors/datepicker/date-picker.css" />
<link rel="stylesheet" href="vendors/vectormap-home/vectormap-2.0.2.css" />

<link rel="stylesheet" href="vendors/scroll/scrollable.css" />

<link rel="stylesheet"
	href="vendors/datatable/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="vendors/datatable/css/responsive.dataTables.min.css" />
<link rel="stylesheet"
	href="vendors/datatable/css/buttons.dataTables.min.css" />

<link rel="stylesheet" href="vendors/text_editor/summernote-bs4.css" />

<link rel="stylesheet" href="vendors/morris/morris.css">

<link rel="stylesheet" href="vendors/material_icon/material-icons.css" />

<link rel="stylesheet" href="css/metisMenu.css">

<link rel="stylesheet" href="css/style1.css" />
<link rel="stylesheet" href="css/colors/default.css" id="colorSkinCSS">
</head>
<body class="crm_body_bg">

<%

try{
 
	String isLogin = (String) session.getAttribute("isLogin");
	if (isLogin == null) {
		response.sendRedirect("index.jsp");
	}
	
	String action = request.getParameter("action");
	if(action != null)
	{
		if(action.equals("logout"))
		{
			session.setAttribute("isLogin",null);
			response.sendRedirect("index.jsp");
		}
		
	}
	
	
}catch(Exception ex)
{
	
}

%>


	<nav class="sidebar dark_sidebar">
		<div class="logo d-flex justify-content-between">
			<a class="large_logo" href="index-2.html"><img
				src="img/logo_white.png" alt=""></a> <a class="small_logo"
				href="index-2.html"><img src="img/mini_logo.png" alt=""></a>
			<div class="sidebar_close_icon d-lg-none">
				<i class="ti-close"></i>
			</div>
		</div>
		<ul id="sidebar_menu">
			<li class=""><a class="has-arrow" href="Dashboard.jsp" aria-expanded="false">
					<div class="nav_icon_small">
						<img src="img/menu-icon/1.svg" alt="">
					</div>
					<div class="nav_title">
						<span>Dashboard </span>
					</div>
			</a>
				<!-- <ul>
					<li><a href="index_2.html">Default</a></li>
					<li><a href="index_3.html">Light Sidebar</a></li>
					<li><a href="index-2.html">Dark Sidebar</a></li>
				</ul> --></li>
				
			<li class=""><a class="has-arrow" href="District.jsp" aria-expanded="false">
					<div class="nav_icon_small">
						<img src="img/menu-icon/1.svg" alt="">
					</div>
					<div class="nav_title">
						<span>District </span>
					</div>
			</a></li>
			<li class=""><a class="has-arrow" href="City.jsp" aria-expanded="false">
					<div class="nav_icon_small">
						<img src="img/menu-icon/1.svg" alt="">
					</div>
					<div class="nav_title">
						<span>City </span>
					</div>
			</a></li>
			<li class=""><a class="has-arrow" href="Product.jsp" aria-expanded="false">
					<div class="nav_icon_small">
						<img src="img/menu-icon/1.svg" alt="">
					</div>
					<div class="nav_title">
						<span>Product</span>
					</div>
			</a></li>		
	</nav>

	<section class="main_content dashboard_part large_header_bg">

		<div class="container-fluid g-0">
			<div class="row">
				<div class="col-lg-12 p-0 ">
					<div
						class="header_iner d-flex justify-content-between align-items-center">
						<div class="sidebar_icon d-lg-none">
							<i class="ti-menu"></i>
						</div>
						<div class="line_icon open_miniSide d-none d-lg-block">
							<img src="img/line_img.png" alt="">
						</div>
						<div
							class="header_right d-flex justify-content-between align-items-center">
							<div class="header_notification_warp d-flex align-items-center">

							</div>
							<div class="profile_info d-flex align-items-center">
								<div class="profile_thumb mr_20">
									<img src="" alt="#">
								</div>
								<div class="author_name">
									<h4 class="f_s_15 f_w_500 mb-0">Shubham Kumar</h4>
									<p class="f_s_12 f_w_400">Admin</p>
								</div>
								<div class="profile_info_iner">
									<div class="profile_author_name">
										<p>Admin</p>
									</div>
									<div class="profile_info_details">
										<a href="#">My Profile </a> <a href="#">Settings</a> <a
											href="Dashboard.jsp?action=logout">Log Out </a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
