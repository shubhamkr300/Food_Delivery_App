<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
      <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Best Online Food Delivery Service</title>
   
    <link rel="stylesheet" href="component/style.css"> 
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
</head>
<body>
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
            <li class="item"><a href="admin/index.jsp">Admin Login</a></li>
        </ul>
    </nav>

    <section id="home">
        <h1 class="h-primary">Welocome to My Online Meal</h1>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa provident repudiandae, adipisci quos eaque libero quae ab quas perferendis id volupta</p>
        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.</p>
        <a href="login.jsp" class="btn" >Order Now</a>
    </section>
    <section class="services-container">
        <h1 class="h-primary center">Our Services</h1>
        <div id="services">
            <div class="box">
                <img src="component/img/pic1.jpg" alt="">
                <h2 class="h-secondary center">Food Catering</h2>
                <p class="center">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Beatae, ad fugiat dolores aspernatur delectus molestiae minima possimus natus nam a ullam corporis, maiores temporibus excepturi quibusdam repudiandae ipsam consequatur minus dolorem culpa eaque voluptates.</p>
            </div>
            <div class="box">
                <img src="component/img/pic2.jpg" alt="">
                <h2 class="h-secondary center">Bulk Ordering</h2>
                <p class="center">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Beatae, ad fugiat dolores aspernatur delectus molestiae minima possimus natus nam a ullam corporis, maiores temporibus excepturi quibusdam repudiandae ipsam consequatur minus dolorem culpa eaque voluptates.</p>
            </div>
            <div class="box">
                <img src="component/img/pic4.jpg" alt="">
                <h2 class="h-secondary center">Food Ordering</h2>
                <p class="center">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Beatae, ad fugiat dolores aspernatur delectus molestiae minima possimus natus nam a ullam corporis, maiores temporibus excepturi quibusdam repudiandae ipsam consequatur minus dolorem culpa eaque voluptates.</p>
            </div>
        </div>
    </section>
    <section id="client-section">
        <h1 class="h-primary center">Our Clients</h1>
        <div id="clients">
            <div class="client-item">
                <img src="component/img/logo2.jfif" >   
            </div>
            <div class="client-item">
                <img src="component/img/logo3.png" >   
            </div>
            <div class="client-item">
                <img src="component/img/logo3.webp" >   
            </div>
        </div>
    </section>
</body>
</html>