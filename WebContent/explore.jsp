<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>


<%
	HttpSession ssn = request.getSession(false);
	String userid = (String) ssn.getAttribute("userid");

	DatabaseConnection db = new DatabaseConnection();
	Connection cn = db.setConnection();
%>
<!DOCTYPE html>
<html>
<head>
<title>SocioGram</title>
<style>
div.gallery {
	margin: 5px;
	border: 1px solid #ccc;
	float: left;
	width: 180px;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: auto;
}

div.desc {
	padding: 15px;
	text-align: center;
}
</style>

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
									<h3 class="mb-0">Explore</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
						<h6 class="heading-small text-muted mb-4">Explore Groups</h6>
							<div class="pl-lg-4">
								<div class="row">
									<%
										try {
											PreparedStatement ps = cn.prepareStatement("select * from groups");

											ResultSet res = ps.executeQuery();
											while (res.next()) {
												Blob blob = res.getBlob("groupphoto");
									%>

									<div class="col">
										<div class="form-group">

											<div class="gallery">
												<a href="groupinfo.jsp?groupid=<%=res.getString(1)%>"> <img
													src="data:image/gif;base64,<%=db.blobProcess(blob)%>"
													width="600" height="400">
												</a>
												<div class="desc"><%=res.getString("groupname")%></div>
											</div>





										</div>
									</div>

									<%
										}

										} catch (SQLException e) {
											System.out.println("sql alert[explore] - " + e.getMessage() + "\n");
										}
									%>
								</div>
							</div>
							
							
							<h6 class="heading-small text-muted mb-4">Explore Events</h6>
							<div class="pl-lg-4">
								<div class="row">
									<%
										try {
											PreparedStatement ps = cn.prepareStatement("select * from events");

											ResultSet res = ps.executeQuery();
											while (res.next()) {
												Blob blob = res.getBlob("eventphoto");
												if(res.getBlob("eventphoto")!=null){
									%>

									<div class="col">
										<div class="form-group">

											<div class="gallery">
												<a href="eventinfo.jsp?eventid=<%=res.getString(1)%>"> <img
													src="data:image/gif;base64,<%=db.blobProcess(blob)%>"
													width="600" height="400">
												</a>
												<div class="desc"><%=res.getString("eventname")%></div>
											</div>





										</div>
									</div>

									<%
										}}

										} catch (SQLException e) {
											System.out.println("sql alert[explore] - " + e.getMessage() + "\n");
										}
									%>
								</div>
							</div>
						</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>