<%@page import="com.ofd.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.ofd.model.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>

<%
    try{
    	
    /*	MultipartRequest multi = new MultipartRequest(request,"");  */
    	 String btn = request.getParameter("btn");
    	if(btn!=null){
    		if(btn.equals("Add")){
    			
    			
    			
    	         String Cat = request.getParameter("txtCat");
    	         String Pname = request.getParameter("txtPname");
    	         String Des = request.getParameter("txtDes");
    	         String Size = request.getParameter("txtSize");
    	         String CP = request.getParameter("txtCP");
    	         String mrp = request.getParameter("txtmrp");
    	         String SP = request.getParameter("txtSP");
    	         
    	         Product p = new Product();
    	         p.setCategory(Cat);
    	         p.setProductname(Pname);
    	         p.setDescription(Des);
    	         p.setSize(Size);
    	         p.setCP(CP);
    	         p.setMRP(mrp);
    	         p.setSP(SP);
    	         
    	         int i = ProductDao.SaveProduct(p);
    	         if (i > 0) {
 					  out.println("Submit Success");
 					  response.sendRedirect("Product.jsp");
 				  } else {
 					  out.println("Submit failed");
 				  }
    	        
    		} 
    	}
    }catch(Exception e){
    	
    }

%>
<div class="main_content_iner overly_inner ">
	<div class="container-fluid p-0 ">

		<div class="row">
			<div class="col-12">
				<div
					class="page_title_box d-flex flex-wrap align-items-center justify-content-between">
					<div class="page_title_left">
						<h3 class="mb-0">Product</h3>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card">
					<div class="card-body">
						<h3>Add Product</h3>
						<br>
						<form action="Product.jsp" method="post" enctype="multipart/form-data">
							<label>Select Category</label> 
							
							<select name="txtCat" class="form-control"
							       value="">
							   <option value="0">Select Category </option>
							   <option value="veg">Veg</option>
							   <option value="nonveg">Non-veg</option>
							
							</select>
							 
							 <label>Product name</label> <input type="text" name="txtPname" class="form-control"
								 value="">
						     <label>Description</label> <input type="text" name="txtDes" class="form-control"
								 value="">
							 <label>Size</label> 			
							 <select name="txtSize" class="form-control"
							       value="">
							   <option value="0">Select Category </option>
							   <option value="veg">Half</option>
							   <option value="nonveg">Full</option>
							 </select>
						<!-- <label>Image</label> <input type="image" src="" alt="Submit" 
							               style="float:right" width="48" height="48">-->
							 <label>Cost Price</label> <input type="number" name="txtCP" class="form-control"
								 value="">
							 <label>MRP</label> <input type="number" name="txtmrp" class="form-control"
								 value="">
							 <label>Selling Price</label> <input type="number" name="txtSP" class="form-control"
								 value="">
                       
                            <input type="hidden" name="id" value="">

							<button type="Submit" class="btn_1 full_width text-center"
								name="btn" value="Add">Add</button>
							<button type="Reset" class="btn_1 full_width text-center"
								name="btn" value="">Reset</button>


						</form>
					</div>

				</div>

			</div>



			<jsp:include page="footer.jsp"></jsp:include>