<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>SocioGram</title>

<script>
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	      $('#FileUpload1').attr('src', e.target.result);
	    }
	    
	    reader.readAsDataURL(input.files[0]);
	  }
	}

	$("#profilephoto").change(function() {
	  readURL(this);
	});

</script>
</head>
<jsp:include page="sidenavbar.jsp"></jsp:include>
<body>

	<%
		DatabaseConnection db = new DatabaseConnection();
		Connection con = db.setConnection();

		HttpSession ssn = request.getSession(false);
		String userid = (String) ssn.getAttribute("userid");

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

		<!-- Header -->
		<div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center"
			style="min-height: 600px; background-image: url(images/profilecover.jpg); background-size: cover; background-position: center top;">
			<!-- Mask -->
			<span class="mask bg-gradient-default opacity-8"></span>
			<!-- Header container -->
			<div class="container-fluid d-flex align-items-center">
				<div class="row">
					<div class="col-lg-7 col-md-10">
						<h1 class="display-2 text-white">Hello <%=res.getString("fname")%></h1>
						<p class="text-white mt-0 mb-5">This is your profile page. You can update your personal information here.</p>
						<a href="userprofile.jsp?userid=<%=userid%>" class="btn btn-info">View profile card</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Page content -->
		<div class="container-fluid mt--7">
		<form action="EditProfile" method="post">
		
		
			<div class="row justify-content-center">			
				<div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">			
					<div class="card card-profile shadow">
						<div class="row justify-content-center">
							<div class="col-lg-3 order-lg-2">
								<div class="card-profile-image">
									<a href="#"> <img
										src="data:image/gif;base64,<%=db.blobProcess(blob)%>" name="FileUpload1" id="FileUpload1"
										class="rounded-circle" />

									</a>
								</div>
							</div>
						</div>
						<div
							class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
							<div class="d-flex justify-content-between">
								<a href="#" class="btn btn-sm btn-info mr-4">Connect</a> <a
									href="#" class="btn btn-sm btn-default float-right">Message</a>
							</div>
						</div>
						<div class="card-body pt-0 pt-md-4">
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
											<span class="heading"><%= rst.getString(1)%></span> <span class="description">Groups</span>
									    <%}%>
										</div>
										
										<div>
										
										<%
										pst = con.prepareStatement("select count(*) from userevents where userid=?");
										pst.setString(1, userid);
										rst = pst.executeQuery();
										if(rst.next())
										{%>
											<span class="heading"><%= rst.getString(1)%>
											</span> 
											<span class="description">Events</span>
										<%}%>
										</div>
										<div>
											<span class="heading"><%=res.getString("rewards")%></span> <span class="description">SocioCoins</span>
										</div>
									</div>
								</div>
							</div>
							<div class="text-center">
								<h3>
									<%=res.getString("fname")%> <%=res.getString("lname")%><span class="font-weight-light">, 22</span>
								</h3>
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
				</div>
				
				
				<div class="col-xl-8 order-xl-1">
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
							
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">

												<label class="form-control-label" for="profilephoto">Change
													Photo</label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-circle-08"></i></span>
													</div>
													<input type="file" id="profilephoto" name="profilephoto"
														class="form-control form-control-alternative"
														onchange="readURL(this);">
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4" />
								
								<h6 class="heading-small text-muted mb-4">User information</h6>
				                <div class="pl-lg-4">
				                  <div class="row">
				                    <div class="col-lg-6">
				                      <div class="form-group">
				                        <label class="form-control-label" for="input-username">Username</label>
				                        <input type="text" id="input-username" class="form-control form-control-alternative" placeholder="Username" value=<%=res.getString("username")==null ? "" : res.getString("username")  %> >
				                      </div>
				                    </div>
				                    <div class="col-lg-6">
				                      <div class="form-group">
				                        <label class="form-control-label" for="input-email">Email address</label>
				                        <input type="email" id="input-email" class="form-control form-control-alternative" placeholder="Email" value="<%=res.getString("email")==null ? "" : res.getString("email") %>" readonly>
				                      </div>
				                    </div>
				                  </div>
				                  <div class="row">
				                    <div class="col-lg-6">
				                      <div class="form-group">
				                        <label class="form-control-label" for="input-first-name">First name</label>
				                        <input type="text" id="input-first-name" class="form-control form-control-alternative" placeholder="First name" value="<%=res.getString("fname")%>">
				                      </div>
				                    </div>
				                    <div class="col-lg-6">
				                      <div class="form-group">
				                        <label class="form-control-label" for="input-last-name">Last name</label>
				                        <input type="text" id="input-last-name" class="form-control form-control-alternative" placeholder="Last name" value="<%=res.getString("lname")%>">
				                      </div>
				                    </div>
				                  </div>
				                </div>
				                <hr class="my-4" />
								
								
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
								<!-- Education -->
								<h6 class="heading-small text-muted mb-4">Education</h6>
								<div class="pl-lg-4">
									<div class="row">
										<!-- Event State -->
										<div class="col-md-9">
											<div class="form-group">
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-hat-3"></i></span>
													</div>
													<label class="form-control-label" for="input-username"></label>
													<input name="education" type="text" id="education"
														class="form-control form-control-alternative" placeholder="Enter your university.."
														value="<%=res.getString("education")==null ? "" : res.getString("education") %>" >
												</div>
											</div>
										</div>
									</div>
								</div>
								
								
								<hr class="my-4" />
								<!-- Business -->
								<h6 class="heading-small text-muted mb-4">Business</h6>
								<div class="pl-lg-4">
									<div class="row">
										<!-- Event State -->
										<div class="col-md-9">
											<div class="form-group">
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-hat-3"></i></span>
													</div>
													<label class="form-control-label" for="input-username"></label>
													<input name="business" type="text" id="business"
														class="form-control form-control-alternative" placeholder="Workplace"
														value="<%=res.getString("business")==null ? "" : res.getString("business") %>" >
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<hr class="my-4" />
								<!-- Business -->
								<h6 class="heading-small text-muted mb-4">Bio</h6>
								<div class="pl-lg-4">
									<div class="row">
										<!-- Event State -->
										<div class="col-md-9">
											<div class="form-group">
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-circle-08"></i></span>
													</div>
													<label class="form-control-label" for="input-username"></label>
													<textarea id="about" name="about" class="form-control"
												rows="4" placeholder="Write a few lines about yourself.."><%=res.getString("about")==null ? "" : res.getString("about") %></textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								
								<hr class="my-4" />

								<%
									PreparedStatement psg = con.prepareStatement(
													"select * from sociogram.groups where groupid in(select groupid from usergroups where userid=?)");
											psg.setInt(1, Integer.parseInt(userid));
											ResultSet rsg = psg.executeQuery();
								%>


								<!-- Member of Groups-->
								<h6 class="heading-small text-muted mb-4">Member of
									following groups</h6>
								<div class="pl-lg-4">
									<div class="row">
										<%
											while (rsg.next()) {
														Blob blobg = rsg.getBlob("groupphoto");
										%>
										<div class="col-md-6">
											<div class="form-group">
												<div class="avatar avatar-lg rounded-circle">
													<img src="data:image/gif;base64,<%=db.blobProcess(blobg)%>"  />
												</div>

												<a
													href="groupinfo.jsp?groupid=<%=rsg.getString("groupid")%>">

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
								
								<!-- Submit Button -->
								<div class="pl-lg-4">
									<div class="row justify-content-center">
										<div class="col-md-6">
											<div class="form-group">
												<button class="btn btn-icon btn-3 bg-green" type="submit"
													id="submit1">
													<span class="btn-inner--icon text-white"><i
														class="ni ni-cloud-upload-96"></i></span> <span
														class="btn-inner--text text-white">Save Changes</span>

												</button>
											</div>
										</div>
									</div>
								</div>


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
			</form>
		</div>
	</div>
</body>


</html>