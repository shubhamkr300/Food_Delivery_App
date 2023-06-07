<%@page import="java.util.*"%>
<%@page import="com.ofd.model.*"%>
<%@page import="com.ofd.dao.DistrictDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String btnName = "Save";
List<District> dl = DistrictDao.getDistrictList();
District dist = new District();
try {
	String btn = request.getParameter("btn");

	System.out.println(btn);
	if (btn != null) {
		if (btn.equals("Save")) {

				String District = request.getParameter("txtDistrict");
			
				System.out.println("District name" + District);
			
				District d = new District();
				d.setDistrict(District);
			
				int i = DistrictDao.SaveDistrict(d);
				if (i > 0) {
					out.println("Submit Success");
					response.sendRedirect("District.jsp");
				} else {
					out.println("Submit failed");
				}
	
		} else if (btn.equals("delete")) {
				System.out.println("Delete Called");
			
				String id = request.getParameter("id");
				System.out.println("Delete Called id is: " + id);
				int respo = DistrictDao.DeleteDistrict(Integer.parseInt(id));
				response.sendRedirect("District.jsp");

		} else if (btn.equals("edit")) {

					String id = request.getParameter("id");
					dist = DistrictDao.getDistrictbyId(Integer.parseInt(id));
				
					btnName = "Update";
					//response.sendRedirect("District.jsp");
		}else if(btn.equals("Update"))
		{
			System.out.println("Update Called");
			
			String District = request.getParameter("txtDistrict");
			String id = request.getParameter("id");
		
			District d = new District();
			d.setDistrict(District);
			d.setSno(Integer.parseInt(id));
		
			int i = DistrictDao.UpdateDistrict(d);
			if (i > 0) {
				out.println("Submit Success");
				response.sendRedirect("District.jsp");
			} else {
				out.println("Submit failed");
			}
			
			
		}
	}

	/* Read District list */
	 

} catch (Exception e) {

}
%>

<jsp:include page="header.jsp"></jsp:include>


<div class="main_content_iner overly_inner ">
	<div class="container-fluid p-0 ">

		<div class="row">
			<div class="col-12">
				<div
					class="page_title_box d-flex flex-wrap align-items-center justify-content-between">
					<div class="page_title_left">
						<h3 class="mb-0">District</h3>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="card">
					<div class="card-body">
						<h3>Add District</h3>
						<br>
						<form action="District.jsp" method="post">
						
						<input type="hidden" name="id" value="<%=dist.getSno() == 0 ? '0' : dist.getSno()%>">
						
							<label>District Name</label> <input type="text"
								name="txtDistrict" class="form-control"
								value="<%=dist.getDistrict() == null ? ' ' : dist.getDistrict()%>">

							<button type="Submit" class="btn_1 full_width text-center"
								name="btn" value="<%=btnName%>"><%=btnName%></button>


						</form>
					</div>

				</div>

			</div>
			<div class="col-md-7">
				<div class="card">
					<div class="card-body">
						<h3>District List</h3>
						<table class="table">
							<thead>
								<tr>
									<th>S.no</th>
									<th>Name</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (District dis : dl) {
								%>
								<tr>
									<td><%=dis.getSno()%></td>
									<td><%=dis.getDistrict()%></td>
									<td><a href="District.jsp?btn=edit&id=<%=dis.getSno()%>"
										class="btn btn-success">Edit</a> <a
										href="District.jsp?btn=delete&id=<%=dis.getSno()%>"
										class="btn btn-danger">Delete</a></td>
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
			<%-- 
			<%
			try {
				/*Delete District */
				int n = Integer.parseInt(request.getParameter("id"));

				int status = DistrictDao.DeleteDistrict(n);
				if (status > 0) {
					response.sendRedirect("District.jsp");
				} else {
					response.sendRedirect("District.jsp");
				}
				/* Update District */
				int num = Integer.parseInt(request.getParameter("sid"));
				String dist = request.getParameter("txtDist");

				System.out.println("Sno" + num);
				System.out.println("District" + dist);

				District dt = new District();
				dt.setSno(num);
				dt.setDistrict(dist);

				int st = DistrictDao.UpdateDistrict(dt);
				if (st > 0)
					System.out.println("Update successful");
				else
					System.out.println("Update successful");
			} catch (Exception ewx) {

			}
			%> --%>