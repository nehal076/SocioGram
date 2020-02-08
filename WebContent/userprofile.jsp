<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>SocioGram</title>

<style type="text/css">
.eventimg {
	display: block;
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	height: auto;
}
</style>

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

	<%
		DatabaseConnection db = new DatabaseConnection();
		Connection con = db.setConnection();

		HttpSession ssn = request.getSession(false);
		String userid = request.getParameter("userid");
		System.out.println("userid @ userprofile : " + userid);

		try {
			PreparedStatement ps = con.prepareStatement("select * from userinfo where userid=?");
			ps.setInt(1, Integer.parseInt(userid));
			ResultSet res = ps.executeQuery();
			while (res.next()) {
	%>


	<%
		Blob blob = res.getBlob("profilepic");
	%>

	<div class="main-content">

		<jsp:include page="newheader.jsp"></jsp:include>


		<div class="card card-profile">
			<img src="./assets/img/theme/img-1-1000x600.jpg"
				alt="Image placeholder" class="card-img-top" style="height:300px">
			<div class="row justify-content-center">
				<div class="col-lg-3 order-lg-2">
					<div class="card-profile-image">
						<a href="#"> <img
							src="data:image/gif;base64,<%=db.blobProcess(blob)%>"
							class="rounded-circle">
						</a>
					</div>
				</div>
			</div>
			<div
				class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
				<div class="d-flex justify-content-between">
					<a href="#" class="btn btn-sm btn-info mr-4">Connect</a> <a
						href="messaging.jsp?sendto=<%=userid%>"
						class="btn btn-sm btn-default float-right">Message</a>
				</div>
			</div>



			<div class="card-body pt-0" style="background: white">
				<div class="row">
					<div class="col">
						<div
							class="card-profile-stats d-flex justify-content-center mt-md-5">
							<div>

								<%
					PreparedStatement pst = con.prepareStatement("select count(*) from usergroups where userid=?");
					pst.setString(1, userid);
					ResultSet rst = pst.executeQuery();
					if(rst.next())
					{%>
								<span class="heading"><%= rst.getString(1)%></span> <span
									class="description">Groups</span>
								<%}%>
							</div>

							<div>

								<%
					pst = con.prepareStatement("select count(*) from userevents where userid=?");
					pst.setString(1, userid);
					rst = pst.executeQuery();
					if(rst.next())
					{%>
								<span class="heading"><%= rst.getString(1)%> </span> <span
									class="description">Events</span>
								<%}%>
							</div>
							<div>
								<span class="heading"><%=res.getString("rewards")%></span> <span class="description">SocioCoins</span>
							</div>
						</div>
					</div>
				</div>
				<div class="text-center">
					<h5 class="h3">
						<%=res.getString("fname")%>
						<%=res.getString("lname")%><span class="font-weight-light">,
							22</span>
					</h5>
					
					<div class="h5 font-weight-300">
					<i class="ni ni-pin-3 mr-2"></i>
					<%=res.getString("city")==null ? "" : 
						res.getString("city")%>, 
					<%=res.getString("state")==null ? "" : 
						res.getString("state") %>
					</div>
					<div class="h5 mt-4">
						<i class="ni ni-briefcase-24 mr-2"></i>
						<%=res.getString("business")==null ? "" : res.getString("business") %>
					</div>
					<div>
						<i class="ni ni-hat-3 mr-2"></i>
						<%=res.getString("education")==null ? "" : res.getString("education") %>
					</div>
					<hr class="my-4" />
					<p><%=res.getString("about")==null ? "" : res.getString("about") %></p>
					<hr class="my-4" />
					<a href="#">Show more</a>
					</div>
			</div>
		</div>
		
<%
	try {
				if (request.getParameter("sent").equalsIgnoreCase("no")
						&& request.getParameter("sent") != null) {
%>
<div class="alert alert-danger alert-dismissible fade show"
	role="alert">
	<span class="alert-inner--icon"><i class="fa fa-times"></i></span>
	<span class="alert-inner--text"><strong>Fail!</strong>
		Message Send to Fail </span>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<%
	} else if (request.getParameter("sent").equalsIgnoreCase("yes")
						&& request.getParameter("sent") != null) {
%>
<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	<span class="alert-inner--icon"><i class="fa fa-check"></i></span>
	<span class="alert-inner--text"><strong>Success!</strong>
		Message Sent successfully</span>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<%
}} catch (Exception ex) {}
%>
		

       <br><br><br><br><br>
		<!-- Page content -->
		<div class="container-fluid mt--7">
			<div class="row justify-content-center">
				<div class="col-xl-12 mb-5 mb-xl-0">


					 <div class="card bg-secondary shadow">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0"><%=res.getString("fname")%>
										<%=res.getString("lname")%></h3>
								</div>
							</div>
						</div>

						


						<div class="card-body">
							
					<h6 class="heading-small text-muted mb-4">Location</h6>

					<div class="pl-lg-4">
						<div class="row">
							<!-- Event State -->
							<div class="col-md-6">
								<div class="form-group">
									<label class="form-control-label" for="">State</label>
									<div class="input-group input-group-alternative">
										<div class="input-group input-group-alternative">
											<div class="input-group-prepend">
												<span class="input-group-text"><i
													class="ni ni-bullet-list-67"></i></span>
											</div>

											<select class="form-control form-control-alternative"
												id="state" name="state" onchange="sendInfo()">

												<option><%=res.getString("state")%></option>

											</select>
										</div>
									</div>
								</div>
							</div>
							<!-- Event City -->
							<div class="col-md-6">
								<div class="form-group">
									<label class="form-control-label" for="">City</label>
									<div class="input-group input-group-alternative">
										<div class="input-group input-group-alternative">
											<div class="input-group-prepend">
												<span class="input-group-text"><i
													class="ni ni-bullet-list-67"></i></span>
											</div>
											<select id="city" name="city"
												class="form-control form-control-alternative">
												<option><%=res.getString("city")%></option>
											</select>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr class="my-4" />
					<!-- Member Since -->
					<h6 class="heading-small text-muted mb-4">SocioGram Member
						Since</h6>
					<div class="pl-lg-4">
						<div class="row">
							<!-- Event State -->
							<div class="col-md-6">
								<div class="form-group">
									<div class="input-group input-group-alternative">
										<div class="input-group-prepend">
											<span class="input-group-text"><i
												class="fa fa-calendar"></i></span>
										</div>
										<input name="eventName" type="text" id="eventName"
											class="form-control form-control-alternative"
											value="August 21, 2019" readonly>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr class="my-4" />

					<%
						PreparedStatement psg = con.prepareStatement(
										"select * from groups where groupid in(select groupid from usergroups where userid=?)");
								psg.setInt(1, Integer.parseInt(userid));
								ResultSet rsg = psg.executeQuery();
					%>


					<!-- Member of Groups-->
					<h6 class="heading-small text-muted mb-4">Member of following
						groups</h6>
					<div class="pl-lg-4">
						<div class="row">
							<%
								while (rsg.next()) {
											Blob blobg = rsg.getBlob("groupphoto");
							%>
							<div class="col-md-6">
								<div class="form-group">
									<div class="avatar avatar-lg rounded-circle">
										<img src="data:image/gif;base64,<%=db.blobProcess(blobg)%>" />
									</div>

									<a href="groupinfo.jsp?groupid=<%=rsg.getString("groupid")%>">

										<%=rsg.getString("groupname")%>
									</a>
								</div>
							</div>




							<%
								}
							%>
						</div>
					</div>
					<hr class="my-4" />


					<%
						}

						} catch (SQLException e) {
							System.out.println("sql alert[profile] - " + e.getMessage() + "\n");
						}
					%>

				</div>
			</div>
		</div>
	</div>
</div>
</div>

</body>


</html>