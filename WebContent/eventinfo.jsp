<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>SocioGram | Event Details</title>
<style type="text/css">
.eventimg {
	max-width: 100%;
	height: auto;
}
</style>
</head>
<body>
<jsp:include page="sidenavbar.jsp"></jsp:include>

<%
	DatabaseConnection db = new DatabaseConnection();
	Connection con = db.setConnection();

	HttpSession ssn = request.getSession(false);
	String userid = (String) ssn.getAttribute("userid");

	String eventid = request.getParameter("eventid");
%>
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
			<div class="card-header bg-white border-0">
				<div class="row align-items-center">
					<div class="col-8">

						<%
							try {
								PreparedStatement ps = con.prepareStatement("select * from sociogram.events where eventid=?");
								ps.setInt(1, Integer.parseInt(eventid));
								ResultSet res = ps.executeQuery();
								if (res.next()) {
									
						%>

						<h3 class="mb-0"><%=res.getString("eventname")%></h3>
					</div>
				</div>
			</div>

			<%
				try {
					
				if (request.getParameter("Message").equalsIgnoreCase("fail")
									&& request.getParameter("Message") != null) {
			%>
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				<span class="alert-inner--icon"><i class="fa fa-times"></i></span>
				<span class="alert-inner--text"><strong>Oops!</strong>
					Something went wrong! </span>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				} else if (request.getParameter("Message").equalsIgnoreCase("done")
									&& request.getParameter("Message") != null) {
			%>
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<span class="alert-inner--icon"><i class="fa fa-check"></i></span>
				<span class="alert-inner--text"><strong>Success!</strong>
					Event Activity Updated!</span>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				}
				} catch (Exception ex) {
				}
			%>

			<div class="card-body">

				<form action="EventActivity">
					<input type="hidden" name="eventid" value="<%=eventid%>">
					<%if(res.getBlob("eventphoto")!=null){
						Blob blob=res.getBlob("eventphoto");%>
					
					<div class="pl-lg-4">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<div class="eventimg">
										<img src="data:image/gif;base64,<%=db.blobProcess(blob)%>" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<%}else{%>
					<div class="pl-lg-4">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<div class="eventimg">
										<img src="images/defaultevent.jpg" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<%} %>
					<hr class="my-4" />
					<h6 class="heading-small text-muted mb-4">Event Venue</h6>
					<div class="pl-lg-4">
						<div class="row">
							<div class="col-md-9">
								<label class="form-control-label" for="eventVenue">
									Venue Details</label>
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="ni ni-pin-3"></i></span>
									</div>
									<input name="eventVenue" type="text" id="eventVenue"
										class="form-control"
										placeholder=" <%=res.getString("eventvenue")%>, <%=res.getString("eventcity")%>, <%=res.getString("eventstate")%> "
										readonly>
								</div>
							</div>
						</div>
					</div>
					<hr class="my-4" />
					<%
						}
					%>

					<div class="pl-lg-4">
						<div class="row">

							<%
								ps = con.prepareStatement("select * from userevents where userid=? and eventid=?");
									ps.setInt(1, Integer.parseInt(userid));
									ps.setInt(2, Integer.parseInt(eventid));
									res = ps.executeQuery();
									if (res.next()) {
										if (res.getString("userstatus").equals("Going")) {
							%>


							<div class="col">
								<button class="btn btn-icon btn-3 bg-gray" type="submit"
									id="submit1">
									<span class="btn-inner--icon text-white"><i
										class="ni ni-check-bold"></i></span> <span
										class="btn-inner--text text-white">Going</span>

								</button>
							</div>
							<%
								}else if (res.getString("userstatus").equals("Interested")) {
							%>
							<div class="col">
								<button class="btn btn-icon btn-3 bg-yellow" type="submit"
									id="submit1">
									<span class="btn-inner--icon text-white"><i
										class="fa fa-star"></i></span> <span
										class="btn-inner--text text-white">Interested</span>

								</button>
							</div>


							<%
								}} else {
							%>
							<div class="col">
								<button class="btn btn-icon btn-3 bg-green" id="submit1">
									<span class="btn-inner--icon text-white"><i
										class="ni ni-fat-add"></i></span> <span
										class="btn-inner--text text-white">Join</span>
								</button>
							</div>
							<%
								}
							%>

						</div>
					</div>
				</form>
			</div>
				</div>
			</div>
		</div>
			<%
				} catch (SQLException e) {
					System.out.println("sql alert[eventinfo] - " + e.getMessage() + "\n");
				}
			%>
		</div>
	</div>
</body>
</html>