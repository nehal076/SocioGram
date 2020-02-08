<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>SocioGram</title>

</head>
<jsp:include page="sidenavbar.jsp"></jsp:include>
<body>
	<div class="main-content">
		<jsp:include page="newheader.jsp"></jsp:include>

		<!-- Header -->
		<div class="header pb-8 pt-5 pt-md-8"
			style="background-color: #22a6b3">
			<div class="container-fluid">
				<div class="header-body"></div>
			</div>
		</div>
		<!-- Page content -->

		<div class="container-fluid mt--7">
			<div class="row justify-content-center">
				<div class="col-xl-12 mb-5 mb-xl-0">
					<div class="card bg-secondary shadow">
						<div class="card-header bg-white">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">Organizer Events</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
										
										
										<div class="table-responsive">
	<div>
		<table class="table align-items-center">


			<thead class="thead-light">
				<tr>
					<th scope="col">Event Title</th>
					<th scope="col">Venue</th>
					<th scope="col">Website</th>
					<th scope="col">Contact Name</th>
					<th scope="col">Contact Number</th>
					<th scope="col">Contact Email</th>
					<th scope="col">Start Date</th>
					<th scope="col">End Date</th>
					
					
				</tr>
			</thead>
			<%
				try {
					HttpSession ssn = request.getSession(false);
					String userid = (String) ssn.getAttribute("userid");
					System.out.println("userid @ home : " + userid);

					DatabaseConnection db = new DatabaseConnection();
					Connection cn = db.setConnection();

					PreparedStatement ps = cn.prepareStatement(
							"select * from createevent where eventstatus='Activate';");
					
					ResultSet res = ps.executeQuery();

					while (res.next()) {
			%>

			<tbody>
				<tr>
					


					<td><a
						href="">
							<label class="form-control-label" for="EventVenue">
								<%=res.getString("eventtitle")%>
						</label>
					</a></td>
					<td><a
						href="">
							<label class="form-control-label" for="EventDate">
								<%=res.getString("eventvenue")%>
						</label>
					</a></td>
					
					<td><a
						href="">
							<label class="form-control-label" for="EventDate">
								<%=res.getString("eventwebsite")%>
						</label>
					</a></td>

					<td><a
						href="">
							<label class="form-control-label" for="EventDate">
								<%=res.getString("contactname")%>
						</label>
					</a></td>
					
								<td><a
						href="">
							<label class="form-control-label" for="EventDate">
								<%=res.getString("contactnum1")%>
						</label>
					</a></td>
					<td><a
						href="">
							<label class="form-control-label" for="EventDate">
								<%=res.getString("contactemail")%>
						</label>
					</a></td>
					
					<td><a
						href="">
							<label class="form-control-label" for="EventDate">
								<%=res.getString("eventstartdate")%>
						</label>
					</a></td>
					<td><a
						href="">
							<label class="form-control-label" for="EventDate">
								<%=res.getString("eventenddate")%>
						</label>
					</a></td>
		
	

					



					<td class="text-right">
						<div class="dropdown">
							<a class="btn btn-sm btn-icon-only text-light" href="#"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="fas fa-ellipsis-v"></i>
							</a>
							<div
								class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
								<a class="dropdown-item" href="EventActivity">Join</a> <a
									class="dropdown-item" href="EventActivity">Interested</a>
								<a class="dropdown-item" href="#">Not Interested</a>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
			<%
				}
			%>
		</table>
	</div>


</div>
										
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<%
		} catch (SQLException e) {
			System.out.println("sql alert[organizerEvent] - " + e.getMessage() + "\n");
		}
	%>
	
</body>
</html>