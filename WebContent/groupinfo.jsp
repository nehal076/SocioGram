
<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>SocioGram | Group Details</title>
<style type="text/css">

.eventimg {
	max-width: 100%;
	height: auto;
}
</style>

<style>
	div.gallery {
		margin: 5px;
		border: 1px solid #ccc;
		float: left;
		width: 180px;
	}
	
	div.gallery:hover {
		border: 1px solid #777;
	}
	
	div.gallery img {
		width: 100%;
		height: auto;
	}
	
	div.desc {
		padding: 15px;
		text-align: center;
	}
</style>
</head>
<jsp:include page="sidenavbar.jsp"></jsp:include>
<body>

	<%
		DatabaseConnection db = new DatabaseConnection();
		Connection con = db.setConnection();

		HttpSession ssn = request.getSession(false);
		String userid = (String) ssn.getAttribute("userid");

		String groupid = request.getParameter("groupid");
	%>
	<div class="main-content">
		<jsp:include page="newheader.jsp"></jsp:include>

		<!-- Header -->
		<div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center"
			style="min-height: 250px; background-image: url(images/groupcover.jpg); background-size: cover; background-position: center top;">
			<!-- Mask -->
			<span class="mask bg-gradient-default opacity-8"></span>
			
		</div>
		<!-- Page content -->

		<div class="container-fluid mt--7">
			<div class="row justify-content-center">
				<div class="col-xl-12 mb-5 mb-xl-0">
					<div class="card bg-secondary shadow">
						<div class="card-header bg-white">
							<div class="row align-items-center">
								<div class="col">
									<%
										try {
											PreparedStatement ps = con.prepareStatement("select * from sociogram.groups where groupid=?");
											ps.setInt(1, Integer.parseInt(groupid));
											ResultSet res = ps.executeQuery();
											while (res.next()) {
												Blob blob = res.getBlob("groupphoto");
									%>
									<h3 class="mb-0"><%=res.getString("groupname")%></h3>
								</div>
								<%
								  PreparedStatement psjoin = con.prepareStatement("select * from usergroups where userid=? and groupid=?");
								  psjoin.setString(1, userid);
								  psjoin.setString(2,groupid);
								  ResultSet rsjoin = psjoin.executeQuery();
								  if(rsjoin.next())
								  {
								
								%>
								
								<div class="col">
								<a href="GroupActivity?groupid=<%=res.getString("groupid")%>">
								<button class="btn btn-icon btn-3 bg-gray float-right" id="submit1">
									<span class="btn-inner--icon text-white"><i
										class="ni ni-fat-add"></i></span> <span
										class="btn-inner--text text-white">Member</span>

								</button>
								</a>
								</div>
								
								
								
								<%}else{ %>
								<div class="col">
								<a href="GroupActivity?groupid=<%=res.getString("groupid")%>">
								<button class="btn btn-icon btn-3 bg-green float-right" id="submit1">
									<span class="btn-inner--icon text-white"><i
										class="ni ni-fat-add"></i></span> <span
										class="btn-inner--text text-white">Join Us</span>

								</button>
								</a>
								</div>
								<%} %>
								
							</div>
						</div>
						<div class="card-body">
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<div class="eventimg">
												<img src="data:image/gif;base64,<%=db.blobProcess(blob)%>" class="eventimg" />
											</div>
										</div>
									</div>
								</div>
							</div>

							<font face="lucida console" size=4><%=res.getString("groupname")%></font><br>

							<%
								PreparedStatement psi = con.prepareStatement("select interests from interests where intid=?");
										psi.setInt(1, Integer.parseInt(res.getString("intid")));
										ResultSet rsi = psi.executeQuery();
										rsi.next();
							%>
							<font face="lucida console" size=2><%=rsi.getString("interests")%></font><br>
							<font face="lucida console" size=3> <%=res.getString("location")%></font><br>

							<%
								PreparedStatement psc = con.prepareStatement("select fname from userinfo where userid=?");
										psc.setInt(1, Integer.parseInt(res.getString("creatorid")));
										ResultSet rsc = psc.executeQuery();
										rsc.next();
							%>
							<font face="arial" size=3> Organised by : <%=rsc.getString("fname")%></font><br>

							<%
								}
							%>

						
								
								
					<div class="row">
				        <div class="col-xl-8">
				          <!-- Members list group card -->
				          <div class="card">
				            <!-- Card header -->
				            <div class="card-header">
				              <!-- Title -->
				              <h5 class="h3 mb-0">Events Organized</h5>
				            </div>
				            <!-- Card body -->
				            <div class="card-body">
				              <!-- List group -->
							<%
								PreparedStatement pse = con.prepareStatement("select * from events where groupid=?");
									pse.setInt(1, Integer.parseInt(groupid));
									ResultSet rse = pse.executeQuery();
									while (rse.next()) {

										Blob blob = rse.getBlob("eventphoto");
							%>
							<div class="gallery">
								<a href="eventinfo.jsp?eventid=<%=rse.getString("eventid")%>">
									<img src="data:image/gif;base64,<%=db.blobProcess(blob)%>"
									height="278" width="238" /> 
									
								</a>
								<div class="desc"><%=rse.getString("eventname")%></div>
							</div> 
							<%
								}
							%>
							
						</div>
					</div>
				</div>
			

						
		
        <div class="col-xl-4" style="clear:both;">
          <!-- Members list group card -->
          <div class="card">
            <!-- Card header -->
            <div class="card-header">
              <!-- Title -->
              <h5 class="h3 mb-0">Group members</h5>
            </div>
            <!-- Card body -->
            <div class="card-body">
              <!-- List group -->
							<%
								PreparedStatement psm = con.prepareStatement("select distinct(userid) from usergroups where groupid=?");
									psm.setInt(1, Integer.parseInt(groupid));
									ResultSet rsm = psm.executeQuery();

									while (rsm.next()) {
										PreparedStatement psu = con.prepareStatement("select * from userinfo where userid=?");
										psu.setInt(1, Integer.parseInt(rsm.getString("userid")));
										ResultSet rsu = psu.executeQuery();
										while (rsu.next()) {
											Blob blob = rsu.getBlob("profilepic");
							%>
							
							
							
							

              <ul class="list-group list-group-flush list my--3">
                <li class="list-group-item px-0">
                  <div class="row align-items-center">
                    <div class="col-auto">
                      <!-- Avatar -->
                      <a href="userprofile.jsp?userid=<%=rsm.getString("userid")%>" class="avatar rounded-circle">
                        <img alt="user" src="data:image/gif;base64,<%=db.blobProcess(blob)%>">
                      </a>
                    </div>
                    <div class="col ml--2">
                      <h4 class="mb-0">
                        <a href="userprofile.jsp?userid=<%=rsm.getString("userid")%>"><%=rsu.getString("fname")%></a>
                      </h4>
                      <span class="text-danger"><i class="ni ni-chat-round"></i></span>
                      <small>Offline</small>
                    </div>
                    <div class="col-auto">
                      <button type="button" class="btn btn-sm btn-primary">Add</button>
                    </div>
                  </div>
                </li>              
              </ul>
            
							<%
								}
									}
								} catch (SQLException e) {
									System.out.println("sql alert[groupinfo] - " + e.getMessage() + "\n");
								}
							%>
							
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