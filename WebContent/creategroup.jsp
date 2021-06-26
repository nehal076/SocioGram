<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SocioGram | Create Group</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#groupphoto").change(function() 
	{
		readURL(this);
	}
	
	);
	

</script>
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
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">Create a Group</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
							<form name="creategroup" id="creategroup" action="CreateGroup" method="post" enctype="multipart/form-data">
								
								<!-- Group Name -->
								<h6 class="heading-small text-muted mb-4">Group Name</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="form-control-label" for="groupName">Group
													Name</label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-badge"></i></span>
													</div>
													<input name="groupName" type="text" id="groupName"
														class="form-control form-control-alternative"
														placeholder="Group Name">
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4" />
								
								<!-- Group Type -->
								<h6 class="heading-small text-muted mb-4">Group Type</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="form-control-label" for="groupType">
													Interest </label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-bullet-list-67"></i></span>
													</div>
													<select class="form-control form-control-alternative"
														id="groupInterest" name="groupInterest">
														<%
															DatabaseConnection db = new DatabaseConnection();
															Connection cn = db.setConnection();
															PreparedStatement pst = cn.prepareStatement("select * from interests");
															ResultSet res = pst.executeQuery();

															while (res.next()) {
																out.print("<option value=" + res.getString(1) + ">" + res.getString(2) + "</option>");
															}
														%>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4" />
								
								<!-- Group Photo -->
								<h6 class="heading-small text-muted mb-4">Select a group
									picture</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="form-control-label" for="groupphoto">Group
													Photo</label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-circle-08"></i></span>
													</div>
													<input type="file" id="groupphoto" name="groupphoto"
														class="form-control form-control-alternative"
														onchange="readURL(this);">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group" style="width: 150px;">
												<label class="form-control-label" for="">Preview</label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend"></div>
													<img class="navbar-brand-img" src="#" alt="group Photo"
														id="blah" height="200">
												</div>
											</div>
										</div>
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
														class="btn-inner--text text-white">Submit</span>
												</button>
											</div>
										</div>
									</div>
								</div>							
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>