<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>

<html>
<head>
<title>SocioGram | Host Event</title>
<link href="./assets/img/brand/favicon.ico" rel="icon" type="image/png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script type="text/javascript">
	$("#eventphoto").change(function() {
		readURL(this);
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	var i = 0;
	var request;
	function sendInfo() {
		var v = document.getElementById("state").value;

		var url = "./FetchData?state=" + v;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}

	function getInfo() {
		if (request.readyState == 4) {
			var val = request.responseText;
			var val1 = [];
			var st = "", b;
			var c = 0;
			for (b = 0; b < val.length; b++) {
				if (val.charAt(b) != "+") {
					st += val.charAt(b);
				} else {
					val1[c] = st;
					st = ""
					c = c + 1;
				}
			}
			var cl = document.getElementById("city");
			for (i; i >= 0; i--) {
				cl.options.remove(i);
			}
			var opt = document.createElement("option");
			opt.text = "select city..";
			cl.options.add(opt, i);
			i++;
			var opt = document.createElement("option");
			for (c = 0; c < val1.length; c++) {
				opt = document.createElement("option");
				opt.text = val1[c];
				cl.options.add(opt, i);
				i++;
			}
		}
	}
	
	
	
	function sendEventInfo() {
		var v = document.getElementById("eventGroup").value;
		
		var url = "./FetchData?groupid=" + v;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		try {
			request.onreadystatechange = getEventInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
	
	function getEventInfo() {
		if (request.readyState == 4) {
			var val = request.responseText;
			var val1 = [];
			var st = "", b;
			var c = 0;
			for (b = 0; b < val.length; b++) {
				if (val.charAt(b) != "+") 
				{
					st += val.charAt(b);
				} 
				else 
				{
					val1[c] = st;
					st = ""
					c = c + 1;
				}
			}
			var cl = document.getElementById("eventType");
			for (i; i >= 0; i--) {
				cl.options.remove(i);
			}
			var opt = document.createElement("option");
			opt.text = "Select Type.."
			cl.options.add(opt, i);
			i++;
			var opt = document.createElement("option");
			for (c = 0; c < val1.length; c++) {
				opt = document.createElement("option");
				opt.text = val1[c];
				cl.options.add(opt, i);
				i++;
			}
		}
	}


</script>


</head>
<body>
<jsp:include page="sidenavbar.jsp"></jsp:include>
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
									<h3 class="mb-0">Host an Event</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
							<form name="createEvent" id="createEvent" action="CreateEvent"
								method="post" enctype="multipart/form-data">
								<!-- Event Name -->
								<h6 class="heading-small text-muted mb-4">Event Name</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="form-control-label" for="eventName">Event
													Name</label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-badge"></i></span>
													</div>
													<input name="eventName" type="text" id="eventName"
														class="form-control form-control-alternative"
														placeholder="Event Name">
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4" />
								<!-- Event Venue -->
								<h6 class="heading-small text-muted mb-4">Event Venue</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="form-control-label" for="eventVenue">Event
													Venue</label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-pin-3"></i></span>
													</div>
													<input name="eventVenue" type="text" id="eventVenue"
														class="form-control form-control-alternative"
														placeholder="Event Venue">
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<label class="form-control-label" for="eventVenue">Event Map</label>
											<div style="height:278;width:538">
												<jsp:include page="maps.jsp"></jsp:include>
											</div>
											
										</div>
										<!-- Event State -->
										<div class="col-md-12">
											<div class="form-group">
												<label class="form-control-label" for="">State</label>
												<div class="input-group input-group-alternative">
													<div class="input-group input-group-alternative">
														<div class="input-group-prepend">
															<span class="input-group-text"><i
																class="ni ni-bullet-list-67"></i></span>
														</div>
														<%
															try {
																DatabaseConnection db = new DatabaseConnection();
																Connection cn = db.setConnection();
																Statement stmt = cn.createStatement();

																ResultSet rs = stmt.executeQuery("select distinct(city_state) from location order by city_state");
														%>
														<select class="form-control form-control-alternative" id="state" name="state" onchange="sendInfo()">
															<option>Select State...</option>
															<%
																while (rs.next()) {
															%>
															<option  value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
															<%
																}
															%>
														</select>
													</div>
												</div>
											</div>
										</div>
										<!-- Event City -->
										<div class="col-md-12">
											<div class="form-group">
												<label class="form-control-label" for="">City</label>
												<div class="input-group input-group-alternative">
													<div class="input-group input-group-alternative">
														<div class="input-group-prepend">
															<span class="input-group-text"><i
																class="ni ni-bullet-list-67"></i></span>
														</div>
														<select id="city" name="city" class="form-control form-control-alternative">
															<option>select city..</option>
														</select>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<hr class="my-4" />
								<!-- Event Date -->
								<h6 class="heading-small text-muted mb-4">Date Details</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="form-control-label" for="eventDate">Select
													Event Date</label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-calendar-grid-58"></i></span>
													</div>
													<input class="form-control" placeholder="End date"
														type="date" name="eventDate" required value="">
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4" />
								<!-- Event Group -->
								<h6 class="heading-small text-muted mb-4">Event Group</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="form-control-label" for="eventGroup">
													Select Group </label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-bullet-list-67"></i></span>
													</div>
													<select class="form-control form-control-alternative"
														id="eventGroup" name="eventGroup" onchange="sendEventInfo()">
														<%
															
															PreparedStatement pst = cn.prepareStatement("select * from sociogram.groups");
															ResultSet res = pst.executeQuery();
															String groupint="";
															while (res.next()) {
																out.print("<option value=" + res.getString(1) + ">" + res.getString(2) + "</option>");
																groupint=res.getString("intid");
															}
														%>
													</select>
												</div>
											</div>

										</div>
									</div>
								</div>
								
							   <hr class="my-4" />
								<!-- Event Type -->
								<h6 class="heading-small text-muted mb-4">Event Type</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="form-control-label" for="eventType">
													Select Event Type </label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-bullet-list-67"></i></span>
													</div>
													<select class="form-control form-control-alternative"
														id="eventType" name="eventType">
														
															<option>Select Type...</option>
															
													</select>
												</div>
											</div>

										</div>
									</div>
								</div>
								
								
								<hr class="my-4" />
								<h6 class="heading-small text-muted mb-4">Timing Details</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="form-control-label" for="startTime">Start
													Time</label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-watch-time"></i></span>
													</div>
													<input class="form-control" placeholder="Start Time"
														type="time" name="startTime" required="yes">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="form-control-label" for="endTime">End
													Time</label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-watch-time"></i></span>
													</div>
													<input class="form-control" placeholder="End Time"
														type="time" name="endTime" required>
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4" />
								<h6 class="heading-small text-muted mb-4">Select an event
									picture</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="form-control-label" for="eventphoto">Event
													Photo</label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-circle-08"></i></span>
													</div>
													<input type="file" id="eventphoto" name="eventphoto"
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
													<img class="navbar-brand-img" src="#" alt="Event Photo"
														id="blah" height="200">
												</div>
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4" />
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="form-control-label" for="eventDesc">Event
													Description</label>
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-align-left-2"></i></span>
													</div>
													<textarea name="eventDesc" id="eventDesc"
														class="form-control form-control-alternative" rows="4" cols="50" wrap="soft" placeholder="Write your event and contact details here..."></textarea>
												</div>
											</div>
										</div>
									</div>
								</div>
								

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
		
		<%
		} catch (SQLException e) {
			System.out.println("sql alert[createevent] - " + e.getMessage() + "\n");
		}
%>
		<!-- Footer -->
     
	</div>
</body>
</html>