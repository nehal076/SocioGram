<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<%!ResultSet rsint = null;%>
<%@ page session="false"%>

<html>
<head>
<title>SocioGram</title>


</head>


<%
	try 
	{
		HttpSession ssn = request.getSession(false);
		String userid = (String) ssn.getAttribute("userid");
		System.out.println("userid @ interests : " + userid);

		DatabaseConnection db = new DatabaseConnection();
		Connection cn = db.setConnection();
		
		PreparedStatement pst  = cn.prepareStatement("select * from interests");
		rsint = pst.executeQuery();
	
		
%>
<body>

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
											<form action=topics.jsp>
		<center>
			<br><br>
				<font face=arial size=5>Get started by picking a few interests</font><br>
			<br>
		</center>
		<div class="container">

			<%
				while (rsint.next()) 
				{
					Blob blob = rsint.getBlob("interestpic");
			%>
			
			<div class="col-lg-4 col-md-4 text-center" style="float: left">
				<div class="choice" data-toggle="wizard-checkbox">
					<img src="data:image/gif;base64,<%=db.blobProcess(blob)%>" class="avatar rounded-circle">
					<h5 class="blog-title card-title mb-2">
						<input type="checkbox" id="interests" name="interests" value=<%=rsint.getString(1)%>><%=rsint.getString(2)%></input>
					</h5>
				</div>
			</div>
			<%
				}
			%>

		</div>

		<input type=submit value="Next">
		<%

		} 
		catch (SQLException e) 
		{
			System.out.println("sql alert[interests] - " + e.getMessage() + "\n");
		}
		%>
	</div>
</form>
										
										
										
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





	
<footer class="py-5">
<%@ include file="newfooter.jsp"%>
</body>
</html>