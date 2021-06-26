<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>SocioGram</title>
<link href="./assets/img/brand/favicon.ico" rel="icon" type="image/png">
</head>
<body id="page-top">

	<!-- <%
		//String receiver = request.getParameter("sendto");
	%>
	<input type=hidden name="receiver" value="<% //=receiver%>" />-->
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
					<div class="card bg-secondary shadow">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">Message</h3>
								</div>
							</div>
						</div>
					
					<div class="card-body">
					<%
							try {
										if (request.getParameter("sent").equalsIgnoreCase("no")
												&& request.getParameter("sent") != null) {
						%>
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							<span class="alert-inner--icon"><i class="fa fa-times"></i></span>
							<span class="alert-inner--text"><strong>Fail!</strong>
								Failed to send message! </span>
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
							}
									} catch (Exception ex) {
									}
						%>

					
						<form action="SendMsg" method="post">
							
							<div class="form-group">
								<div class="row">
									<div class="col-md-8">

										<label class="form-control-label" for="">To</label>
										<div class="input-group input-group-alternative">
											<div class="input-group input-group-alternative">
												<div class="input-group-prepend">
													<span class="input-group-text"><i
														class="ni ni-circle-08"></i></span>
												</div>
												<select class="form-control form-control-alternative"
														id="receiver" name="receiver">
													<%
													DatabaseConnection db = new DatabaseConnection();
													Connection con = db.setConnection();
											
													HttpSession ssn = request.getSession(false);
													String userid = (String) ssn.getAttribute("userid");
											
													try {
														PreparedStatement ps = con.prepareStatement("select * from user");
														
														ResultSet res = ps.executeQuery();
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
							<%
								} catch (SQLException e) {
									System.out.println("sql alert[messaging] - " + e.getMessage() + "\n");
								}
							%>

							<div class="form-group">
								<div class="row">
									<div class="col-md-8">
										<div class="form-label-group">
											<input type="text" id="title" name="txttitle"
												class="form-control" placeholder="Title" required="required"
												autofocus="autofocus">

										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-8">
										<div class="form-label-group">
											<textarea id="body" name="areabody" class="form-control"
												placeholder="Message" rows="7" required="required"></textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col-md-8">
										<div class="form-label-group">
											<button type="reset" id="btnreset" class="btn btn-primary">
												<i class="fas fa-backspace" style="margin-right: 10px;"></i>Reset
											</button>
											<button type="submit" id="btnsubmit"
												class="btn btn-primary float-right">
												<i class="fas fa-paper-plane" style="margin-right: 10px;"></i>Send
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
