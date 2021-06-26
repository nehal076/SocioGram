<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="./assets/img/brand/favicon.ico" rel="icon" type="image/png">
<title> SocioGram | Inbox </title>
</head>
<body>

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
						<h3 class="mb-0">Inbox</h3>
					</div>
				</div>
			</div>
			<div class="card-body">
			<div class="pl-lg-4">
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
					<div class="input-group input-group-alternative">

						<div class="table-responsive">
						<div>
						<table class="table align-items-center">
	
	
							<thead class="thead-light">
								<tr>
									<th scope="col">From</th>
									
									<th scope="col">Title</th>
									<th scope="col">Message</th>
									<th scope="col">Date</th>
									<th scope="col">Reply</th>
									<th scope="col">Delete</th>
	
								</tr>
							</thead>
							<%
								try {
									HttpSession ssn = request.getSession(false);
									String userid = (String) ssn.getAttribute("userid");
									System.out.println("userid @ home : " + userid);
	
									DatabaseConnection db = new DatabaseConnection();
									Connection cn = db.setConnection();
	
									PreparedStatement ps = cn.prepareStatement("select * from messaging where receiver=? ORDER BY dateTime DESC");
									ps.setInt(1, Integer.parseInt(userid));
									ResultSet res = ps.executeQuery();
	
									while (res.next()) {
							%>
	
							<tbody>
								<tr>
									
									<td><a
										href="userprofile.jsp?userid=<%=res.getString("sender")%>">
											<label class="form-control-label" for="MsgFrom">
											
											<%PreparedStatement psname = cn.prepareStatement("select * from user where userid=?"); 
											  psname.setString(1, res.getString("sender") );
											  ResultSet rsname = psname.executeQuery();
											  rsname.next();
											%>
												<%=rsname.getString("fname")%>
										</label>
									</a>
									</td>
									<td>
									<a href="userprofile.jsp?userid=<%=res.getString("sender")%>">
											<label class="form-control-label" for="MsgTitle">
												<%=res.getString("title")%>
										</label>
									</a>
									</td>
									<td><a
										href="userprofile.jsp?userid=<%=res.getString("sender")%>">
											<label class="form-control-label" for="MsgBody">
												<%=res.getString("body")%>
										</label>
									</a>
									</td>
									<td><a
										href="userprofile.jsp?userid=<%=res.getString("sender")%>">
											<label class="form-control-label" for="MsgDate">
												<%=res.getString("dateTime")%>
										</label>
									</a>
									</td>
									<td><a href="userprofile.jsp?userid=<%=res.getString("sender")%>">
											<label class="form-control-label" for="MsgReply">
												<button class="btn btn-icon btn-3 bg-green"
												type="submit" id="submit1">
												<span class="btn-inner--icon text-white"><i
													class="fas fa-paper-plane"></i></span>

											</button>
			
										</label>
									</a>
									</td>
									<td><a
										href="userprofile.jsp?userid=<%=res.getString("sender")%>">
										<label class="form-control-label" for="MsgDelete">
											<a href="inbox.jsp?Message=delete">
												<img src="./assets/img/icons/common/delete_site.jpg">			
											</a>
										</label>
									</a>
									</td>
								</tr>
							</tbody>
							<%}
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
<jsp:include page="newfooter.jsp"></jsp:include>
</div>

</div>
	
		<%
		} catch (SQLException e) {
			System.out.println("sql alert[home] - " + e.getMessage() + "\n");
		}
	%>
		
</body>

</html>