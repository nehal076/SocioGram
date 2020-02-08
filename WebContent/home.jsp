<%@ page import="java.sql.*, sociogram.DatabaseConnection, java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<title>SocioGram</title>
</head>
<body>
<%
		TimeZone.setDefault(TimeZone.getTimeZone("IST"));
		String searchDate1 =  new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String searchDate2 = searchDate1;
		String searchTime1 = "06:00";
		String searchTime2 = "20:00";


%>

	<jsp:include page="sidenavbar.jsp"></jsp:include>
	<div class="main-content">
		<jsp:include page="newheader.jsp"></jsp:include>
		<div class="header pb-8 pt-5 pt-md-8"
			style="background-color: #4FD1EA">
			<div class="container-fluid">
				<div class="header-body"></div>
			</div>
		</div>
		<!-- Page content -->

		<div class="container-fluid mt--7">
			<div class="row justify-content-center">
				<div class="col-xl-12 mb-5 mb-xl-0">
					<%
						String Message = request.getParameter("Message");
						if (Message != null) {
							if (Message.equals("fail")) {
					%>
					<div class="alert alert-danger alert-dismissible fade show mb-5"
						role="alert">
						<span class="alert-inner--icon"><i
							class="fa fa-thumbs-down"></i></span> <span class="alert-inner--text"><strong>Oops!</strong>
							Error on submit</span>
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<%
						} else if (Message.equals("UnAuthorized")) {
					%>
					<div class="alert alert-warning alert-dismissible fade show mb-5"
						role="alert">
						<span class="alert-inner--icon"><i class="fa fa-bolt"></i></span>
						<span class="alert-inner--text"><strong>Warning!</strong>
							Login first!</span>
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<%
						} else if (Message.equals("done")) {
							%>
							<div class="alert alert-success alert-dismissible fade show mb-5"
								role="alert">
								<span class="alert-inner--icon"><i class="ni ni-like-2"></i></span>
								<span class="alert-inner--text"><strong>Success!</strong>
									Action(s) successful</span>
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<%
								} else if (Message.equals("groupreq")) {
									%>
									<div class="alert alert-success alert-dismissible fade show mb-5"
										role="alert">
										<span class="alert-inner--icon"><i class="ni ni-like-2"></i></span>
										<span class="alert-inner--text"><strong>Success!</strong>
											We have received your request to create a group.  </span>
										<button type="button" class="close" data-dismiss="alert"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<%
										}
						}
					%>
					<div class="card bg-secondary shadow">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">Search</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
							<!-- forms -- >
							<form action="EventActivity"> -->
							   <div class="input-daterange row align-items-center">
                                    <div class="col">
                                        <div class="form-group">
                                            <div class="input-group input-group-alternative">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                                                </div>
                                                <input class="form-control" placeholder="Start date" type="date" name="searchDate1" required value=<%=searchDate1%>>
                                        	</div>
                                    	</div>
                                	</div>
                                	<div class="col">
                                    	<div class="form-group">
                                        	<div class="input-group input-group-alternative">
                                            	<div class="input-group-prepend">
                                                	<span class="input-group-text"><i class="ni ni-calendar-grid-58"></i></span>
                                            	</div>
                                            	<input class="form-control" placeholder="End date" type="date" name="searchDate2" required value=<%=searchDate2%>>
                                        	</div>
                                    	</div>
                                	</div>
                            	</div>
	                            <div class="input-daterange row align-items-center">
	                                <div class="col">
	                                    <div class="form-group">
	                                        <div class="input-group input-group-alternative">
	                                            <div class="input-group-prepend">
	                                                <span class="input-group-text"><i class="ni ni-watch-time"></i></span>
	                                            </div>
	                                            <input class="form-control" placeholder="Start Time" type="time" name="searchTime1" required value=<%= searchTime1%>>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="col">
	                                    <div class="form-group">
	                                        <div class="input-group input-group-alternative">
	                                            <div class="input-group-prepend">
	                                                <span class="input-group-text"><i class="ni ni-watch-time"></i></span>
	                                            </div>
	                                            <input class="form-control" placeholder="End Time" type="time" name="searchTime2"  required  value=<%= searchTime2%>>
	                                            
	                                        </div>
	                                    </div>
	                                </div>
                            	</div>
	
		               			<div class="row">
		                     	<div class="col">
		                         	<button class="btn btn-icon btn-3 btn-primary align-items-center" type="submit" id="search1">
			                             <span class="btn-inner--icon"><i class="fa fa-search"></i></span>
			                             <span class="btn-inner--text">Search</span>
			                         </button>
		                     	</div>
	                		</div>
	              
                        </div>
                     </div>
                   
              
                    

<div class="row mt-5">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0">Upcoming Events Tailored For You</h3>
            </div>

<div class="table-responsive">
	<div>
		<table class="table align-items-center">


			<thead class="thead-light">
				<tr>
					<th scope="col">Event Name</th>
					<th scope="col">Venue</th>
					<th scope="col">Date</th>
					<th scope="col">Attendees</th>
					<th scope="col">Status</th>

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
							"select * from events where groupid in (select groupid from usergroups where userid=?) and activitystatus=1;");
					ps.setInt(1, Integer.parseInt(userid));
					ResultSet res = ps.executeQuery();

					while (res.next()) {
			%>

			<tbody>
				<tr>
					<td>

						<div class="media align-items-center">
							<a
								href="eventinfo.jsp?eventid=<%=res.getString("eventid")%>"
								class="avatar rounded-circle mr-3"> <%
								 	if (res.getBlob("eventphoto") != null) {
								 				Blob blob = res.getBlob("eventphoto");
								 %> 
								 <img alt="Image placeholder"
								src="data:image/gif;base64,<%=db.blobProcess(blob)%>">
								<%
									} else {
								%> <img alt="Image placeholder" src="images/usericon.png">
								<%
									}
								%>
							</a>
							<div class="media-body">
								<span class="mb-0 text-sm"> <a
									href="eventinfo.jsp?eventid=<%=res.getString("eventid")%>">
										<%=res.getString("eventname")%></a></span>
							</div>

						</div>
					</td>



					<td><a
						href="eventinfo.jsp?eventid=<%=res.getString("eventid")%>">
							<label class="form-control-label" for="EventVenue">
								<%=res.getString("eventvenue")%>
						</label>
					</a></td>
					<td><a
						href="eventinfo.jsp?eventid=<%=res.getString("eventid")%>">
							<label class="form-control-label" for="EventDate">
								<%=res.getString("eventdate")%>
						</label>
					</a></td>

					<td>
						<div class="avatar-group">
							<%
								PreparedStatement psuser = cn.prepareStatement(
												"select distinct(userid) from userevents where eventid=? and userstatus='Going' limit 4;");
										psuser.setString(1, res.getString("eventid"));
										ResultSet resuser = psuser.executeQuery();

										while (resuser.next()) {
											PreparedStatement psuser1 = cn.prepareStatement("select profilepic from userinfo where userid=?");
											psuser1.setString(1, resuser.getString(1));
											ResultSet resuser1 = psuser1.executeQuery();

											while (resuser1.next()) {
												if (resuser1.getBlob("profilepic") != null) {
													Blob blob = resuser1.getBlob("profilepic");
							%>

							<a href="#" class="avatar avatar-sm" data-toggle="tooltip"
								data-original-title="Ryan Tompson"> <img
								alt="Image placeholder"
								src="data:image/gif;base64,<%=db.blobProcess(blob)%>"
								class="rounded-circle">
							</a>
							<%
								} else {
							%>
							<a href="#" class="avatar avatar-sm" data-toggle="tooltip"
								data-original-title="Ryan Tompson"> <img
								alt="Image placeholder" src="images/usericon.png"
								class="rounded-circle">
							</a>


							<%
								}}}
							%>

						</div>
					</td>

					<td class="status">
						<div class="media align-items-center">
							<%
								PreparedStatement psStatus = cn
												.prepareStatement("select userstatus from userevents where eventid=? and userid=?");
										psStatus.setString(1, res.getString("eventid"));
										psStatus.setInt(2, Integer.parseInt(userid));
										ResultSet resStatus = psStatus.executeQuery();

										if (resStatus.next()) {
											if (resStatus.getString("userstatus").equals("Going")) {
							%>
							<a
								href="eventinfo.jsp?eventid=<%=res.getString("eventid")%>">
								<button class="btn btn-icon btn-3 bg-gray" type="submit"
									id="submit1">
									<span class="btn-inner--icon text-white"><i
										class="ni ni-check-bold"></i></span> <span
										class="btn-inner--text text-white">Going</span>

								</button>
							</a>

							<%
								} else if (resStatus.getString("userstatus").equals("Interested")) {
							%>

							<a
								href="eventinfo.jsp?eventid=<%=res.getString("eventid")%>">
								<button class="btn btn-icon btn-3 bg-yellow"
									type="submit" id="submit1">
									<span class="btn-inner--icon text-white"><i
										class="fa fa-star"></i></span> <span
										class="btn-inner--text text-white">Interested</span>

								</button>
							</a>
							<%
								resStatus.close();
											}
										} else {
							%>

							<a
								href="eventinfo.jsp?eventid=<%=res.getString("eventid")%>">
								<button class="btn btn-icon btn-3 bg-green" id="submit1">
									<span class="btn-inner--icon text-white"><i
										class="ni ni-fat-add"></i></span> <span
										class="btn-inner--text text-white">Join</span>

								</button>
							</a>

							<%
								}
							%>

						</div>
					</td>

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


							<div class="card-footer py-4">
								<nav aria-label="...">
									<ul class="pagination justify-content-end mb-0">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1"> <i class="fas fa-angle-left"></i>
												<span class="sr-only">Previous</span>
										</a></li>
										<li class="page-item active"><a class="page-link"
											href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2<span
												class="sr-only">(current)</span></a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">
												<i class="fas fa-angle-right"></i> <span class="sr-only">Next</span>
										</a></li>
									</ul>
								</nav>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
		<jsp:include page="newfooter.jsp"></jsp:include>
	</div>
</div>
		<!-- </form> -->


			




	<%
		} catch (SQLException e) {
			System.out.println("sql alert[home] - " + e.getMessage() + "\n");
		}
	%>


</body>
</html>