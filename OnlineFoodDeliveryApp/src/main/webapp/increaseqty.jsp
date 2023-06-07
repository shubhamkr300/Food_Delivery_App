<%@page import="com.ofd.dao.QuantityDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
   String cid = request.getParameter("id");
   String qt = request.getParameter("qt");
   String am = request.getParameter("am");
   
   int i = QuantityDao.IncreaseQuantity(Integer.parseInt(cid),Integer.parseInt(qt),Integer.parseInt(am));
   if(i>0){
	   response.sendRedirect("cart.jsp");
   }else{
	   System.out.println("Error");
   }
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%



%>


</body>
</html>