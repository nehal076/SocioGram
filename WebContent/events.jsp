<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>


<%!ResultSet rsg = null, rse = null, rsl = null;
	PreparedStatement psg = null, pse = null, psl = null;%>

<%@ page session="false"%>

<%
HttpSession ssn = request.getSession(false);
String userid=(String)ssn.getAttribute("userid");

DatabaseConnection db=new DatabaseConnection();
Connection cn = db.setConnection();



%>

<html>
<head>
<title>SocioGram</title>
</head>

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
						
						<div class="card-body">
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
										
										<center>
				<h1>Find an event to join</h1>
			

			<%

				System.out.println("userid @ events : " + userid);
				String group[] = request.getParameterValues("groups");

				try {

					psg = cn.prepareStatement("insert into usergroups (userid,groupid) values(?,?)");

					for (String s : group) {
						psg.setInt(1, Integer.parseInt(userid));
						psg.setInt(2, Integer.parseInt(s));
						psg.executeUpdate();
					}

					psl = cn.prepareStatement("select state from userinfo where userid=?");

					psl.setInt(1, Integer.parseInt(userid));
					rsl = psl.executeQuery();
					/*rsl.next();
					String location=rsl.getString(1);*/

					pse = cn.prepareStatement(
							"select * from sociogram.events where groupid in (select groupid from usergroups where userid=?);");
					pse.setInt(1, Integer.parseInt(userid));

					rse = pse.executeQuery();
			%>

			<div class="container">

				<%
					while (rse.next()) {
						
						Blob blob = rse.getBlob("eventphoto");
				%>

				<div class="col-lg-4 col-md-4 text-center" style="float: left">
					<img src="data:image/gif;base64,<%=db.blobProcess(blob)%>" class="img-Thumbnail">
					<h5 class="blog-title card-title mb-2">
						<input type=checkbox id="events" name=events
							value=<%=rse.getString(1)%>>
						<%=rse.getString(2)%>
						</input>
					</h5>
				</div>
				<%
					}
				%>
				<a href="home.jsp">
					<div class="row">
						<div class="col">
							<button class="btn btn-icon btn-3 btn-primary align-items-center"
								type="submit" id="search1"
								style='background-color: #9b59b0; color: #fafafa'>
								<span class="btn-inner--icon"><i class="fa fa-search"></i></span>
								<span class="btn-inner--text">Next</span>
							</button>
						</div>
					</div>
				</a>
			</div>

			<%  } 
				catch (SQLException e) 
				{
					System.out.println("sql alert[events] - " + e.getMessage() + "\n");
				}
			%>
				
		</div>
	</div>
	</center>
										
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
</body>
</html>


