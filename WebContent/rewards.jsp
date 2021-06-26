<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>SocioGram</title>

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
									<h3 class="mb-0">My Rewards</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
										SocioCoins
											<img src="images/sociocoin.png" style="height:30px;width:30px">
											<%=res.getString("rewards")%>
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
<%
	}

	} catch (SQLException e) {
		System.out.println("sql alert[rewards.jsp] - " + e.getMessage() + "\n");
	}
%>
</body>
</html>