<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<%!ResultSet rs = null, rc = null;
	PreparedStatement pc = null;%>

<html>
<head>
<title>SocioGram</title>
</head>
<body>
<jsp:include page="sidenavbar.jsp"></jsp:include>
	<div class="main-content">
		<!-- Top navigation bar -->
		<%@ include file="newheader.jsp"%>
		<!-- Header -->
		<div class="header bg-purple pb-8 pt-5 pt-md-8">
			<div class="container-fluid">
				<div class="header-body"></div>
			</div>
		</div>
		<!-- Page content -->
		<div class="container-fluid mt--8">
		<%
				try 
				{
					DatabaseConnection db=new DatabaseConnection();
				    Connection cn=db.setConnection();
					Statement stmt = cn.createStatement();

					rs = stmt.executeQuery("select distinct(city_state) from location order by city_state");
			%>
			<div class="row justify-content-center">
				<div class="col-lg-7 col-md-9">
					<div class="card bg-secondary shadow border-0">
						<div class="card-header bg-transparent">
							<div class="text-muted">
								<h3>Choose your location</h3>
							</div>
						</div>
						<div class="card-body px-lg-5 py-lg-5">
							<form action="" method="post">
								<div class="form-group mb-3">
									<h3>Select State</h3>
									<div class="input-group input-group-alternative">
										<div class="input-group-prepend">
											<span class="input-group-text"><i
												class="ni ni-bullet-list-67"></i></span>
										</div>
										<select class="form-control form-control-alternative"
											id="state" name="state" onchange="sendInfo()">
											<option>select...</option>
											<%
												while (rs.next()) {
											%>
											<option  value="<%=rs.getString(1)%>">
												<%=rs.getString(1)%>
											</option>
											<%
												}
											%>
										</select>
									</div>
								</div>

								<div class="form-group">
									<h3>Select City</h3>
									<div class="input-group input-group-alternative">
										<div class="input-group-prepend">
											<span class="input-group-text"><i
												class="ni ni-bullet-list-67"></i></span>
										</div>
										<select id="city" name="city" class="form-control form-control-alternative">
												<option>select..</option>
										</select>
									</div>
								</div>
								<div class="text-center">
									<button class="btn btn-icon btn-3 bg-purple" type="button"
										data-target="#exampleModal">
										<span class="btn-inner--icon text-white"><i
											class="ni ni-cloud-upload-96"></i></span> <span
											class="btn-inner--text text-white">Next</span>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>



			<%
				}
				catch (SQLException e) {
					System.out.println("sql alert[location] - " + e.getMessage() + "\n");
				}
			%>
		</div>
	</div>
</body>
</html>



<script>
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
			var cl = document.getElementById("city");
			for (i; i >= 0; i--) {
				cl.options.remove(i);
			}
			var opt = document.createElement("option");
			opt.text = "select city.."
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