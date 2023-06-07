<%@page import="com.ofd.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ofd.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 
     String name = request.getParameter("txtname");
     String gen = request.getParameter("txtgen");
     String userid = request.getParameter("txtuser");
     String email = request.getParameter("txtemail");
     String phone = request.getParameter("txtphone");
     String password = request.getParameter("txtpassword");
     
     User u = new User();
     u.setName(name);
     u.setGender(gen);
     u.setUserid(userid);
     u.setEmail(email);
     u.setPhone(phone);
     u.setPassword(password);
     
     int status = UserDao.SaveUser(u);
     if(status>0){
    	 System.out.println("Save success");
    	 response.sendRedirect("signup.jsp");
     }else{
    	 System.out.println("Save success");
     }
 %>   
<!DOCTYPE html>
<html lang="en">
<head>
      <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Best Online Food Delivery Service</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="component/style.css"> 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&family=Nunito&family=Unbounded&display=swap" rel="stylesheet">
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

     <section id="signup">
      <div class="container">
         <div class="row" id="register">
            <div class="col-md-4 offset-md-4" >
                 <h1>USER REGISTRATION</h1>
               <form action="signup.jsp" method="post" >
                  <label>Name:</label>
                  <input type="text" name="txtname" class="form-control"><br>
                  <label>Gender:</label>
                  <label>Male</label>
                  <input type="radio" name="txtgen" value="Male">
                  <label>Female</label>
                  <input type="radio" name="txtgen" value="Female"><br>
                  <br>
                  <label>User Id:</label>
                  <input type="text" name="txtuser" class="form-control"><br>
                  <label>Email id:</label>
                  <input type="email" name="txtemail" class="form-control"><br>
                  <label>Phone no:</label>
                  <input type="text" name="txtphone" class="form-control"><br>
                  <label>Password</label>
                  <input type="password" name="txtpassword" class="form-control"><br>

                  <button type="submit" class="btn btn-success" >REGISTER</button>
               </form>
            </div>
         </div>
      </div>
     </section>

    <body>
       
  <!--Custom js-->
  <script src="js/script.js"></script>
</body>
</html> 