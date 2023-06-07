<%@page import="com.ofd.dao.*"%>
<%@page import="java.util.List"%>
<%@page import="com.ofd.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"></jsp:include>

<%
List<District> dList = DistrictDao.getDistrictList(); 

String btnName = "Save";
List<City> clist = CityDao.getCityList();
City cy = new City();
try{
	 String btn = request.getParameter("btn");
	 System.out.println(btn);
	 if(btn != null){
		 if(btn.equals("Save")){
			/* String district = request.getParameter("txtDist"); */
		     String city = request.getParameter("txtCity");
		     int did = Integer.parseInt(request.getParameter("did"));
		     
		     System.out.println("City name" + city);
		     
		     City ct = new City();
		     ct.setSno(did);
		     ct.setCity(city);
		     
		     int i = CityDao.SaveCity(ct);
		     if (i > 0) {
					out.println("Submit Success");
					response.sendRedirect("City.jsp");
				} else {
					out.println("Submit failed");
				}
		 } else if(btn.equals("delete")){
			 System.out.println("Delete Called");
			 int no = Integer.parseInt(request.getParameter("id"));
			 System.out.println("Delete Called id is: " + no);
			 int res = CityDao.DeleteCity(no);
			 response.sendRedirect("City.jsp");
		 }else if(btn.equals("edit")){
			 int n = Integer.parseInt(request.getParameter("id"));
			 cy = CityDao.getCityById(n);
			 btnName = "Update";
		 }else if(btn.equals("Update")){
			 System.out.println("Update Called");
			/* String district = request.getParameter("txtDist"); */
		     String city = request.getParameter("txtCity");
		     int no = Integer.parseInt(request.getParameter("id"));
		     
		     City c = new City();
		     c.setCity(city);
		     c.setSno(no);
		     
		     int i = CityDao.UpdateCity(c);
		     if (i > 0) {
					out.println("Update Success");
					response.sendRedirect("City.jsp");
				} else {
					out.println("Update failed");
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
						<h3 class="mb-0">City</h3>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="card">
					<div class="card-body">
						<h3>Add City</h3>
						<br>
						<form action="City.jsp" method="post">
							<label>District</label> 
							
							<select name="did" class="form-control"
							       value="<%=cy.getSno() == 0 ? '0': cy.getSno() %>">
								<option value="0">Select District</option>
								
								<%
								for (District dis : dList) {
								%>
								<option  value="<%=dis.getSno() %>"> <%=dis.getDistrict() %> </option>
								<%
								}
								%>
							</select>
							
							 <label>City Name</label> <input type="text" name="txtCity" class="form-control"
								 value="<%=cy.getCity() == null ? ' ': cy.getCity() %>">
                              /* Get city by id */
                            <input type="hidden" name="id" value="<%=cy.getSno() == 0 ? '0' : cy.getSno() %>">

							<button type="Submit" class="btn_1 full_width text-center"
								name="btn" value="<%=btnName%>"><%=btnName%></button>


						</form>
					</div>

				</div>

			</div>
			<div class="col-md-7">
				<div class="card">
					<div class="card-body">
						<h3>City List</h3>
						<table class="table">
							<thead>
								<tr>
									<th>S.no</th>
									<th>District</th>
									<th>City</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
                                 <%
                                    for (City c : clist){
                                 %>
                                 <tr>
                                 <td><%=c.getSno() %></td>
                                 <td><%=c.getDistrict() %></td>
                                 <td><%=c.getCity() %></td>
                                 <td>
                                 <a href="City.jsp?btn=edit&id=<%=c.getSno() %>"
                                        class="btn btn-success">Edit</a>
                                 <a href="City.jsp?btn=delete&id=<%=c.getSno() %>"
                                        class="btn btn-danger">Delete</a>
                                 </td>
                                 </tr>
                                 <%
                                    }
                                 %>
							</tbody>
						</table>
					</div>
				</div>
			</div>



			<jsp:include page="footer.jsp"></jsp:include>