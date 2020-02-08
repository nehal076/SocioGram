<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>

<%! ResultSet rshead = null;%>
<%
	HttpSession ssnhead = request.getSession(false);
	String useridhead = (String) ssnhead.getAttribute("userid");
	if (useridhead != null) {

		DatabaseConnection dbhead = new DatabaseConnection();
		Connection con = dbhead.setConnection();
		PreparedStatement pshead;
%>


<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SocioGram</title>
<!-- Favicon -->
<link href="./assets/img/brand/favicon.ico" rel="icon" type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link href="./assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
<link
	href="./assets/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<!-- Argon CSS -->
<link type="text/css" href="./assets/css/argon.css?v=1.0.0"
	rel="stylesheet">
<!--Material+Icons -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<!-- icon-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style type="text/css">
.notification {

    position: absolute;
    top : 3px;
    margin-top: -3px;
    border: 1px solid #FFF;
    right: 10px;
    font-size: 9px;
    background: #f44336;
    color: #FFFFFF;
    min-width: 20px;
    padding: 0px 5px;
    height: 20px;
    border-radius: 10px;
    text-align: center;
    line-height: 19px;
    vertical-align: middle;
    display: block;
}

.notification1
{
  position: absolute;
  top: -10px;
  right: -10px;
  padding: 5px 10px;
  border-radius: 50%;
  background: red;
  color: white;
}

.material-icons {
    margin-top: -3px;
    top: 0px;
    position: relative;
    margin-right: 3px;
}
</style>

<nav class="navbar navbar-top navbar-expand-md navbar-dark"
	id="navbar-main">
	<div class="container-fluid">
		<!-- Form -->
		<div
			class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
			<div class="form-group mb-0">
				<div class="input-group input-group-alternative">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-search"></i></span>
					</div>
					<input class="form-control" id="searchUsers" name="searchUsers" placeholder="Search" type="text" onkeyup="searchUsers()">
				
				</div>
			</div>
		</div>

		<!-- User -->
		<ul class="navbar-nav align-items-center d-none d-md-flex ml-auto ml-md-0">
		
		
		
        
        
        <%
		pshead = con.prepareStatement("select count(*) from messaging where receiver=?");
		pshead.setInt(1, Integer.parseInt(useridhead));
		rshead = pshead.executeQuery();
		if(rshead.next())
		{
		%>
        
        <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-envelope"></i>
                <span class="notification"><%=rshead.getString(1)%></span>
              </a>
              <div class="dropdown-menu dropdown-menu-xl dropdown-menu-right py-0 overflow-hidden">
                <!-- Dropdown header -->
                <div class="px-3 py-3">
                  <h6 class="text-sm text-muted m-0">You have <strong class="text-primary"><%=rshead.getString(1)%></strong> notifications.</h6>
                </div>
                <%pshead = con.prepareStatement("select * from messaging where receiver=? limit 5");
					pshead.setInt(1, Integer.parseInt(useridhead));
					rshead = pshead.executeQuery();
					while(rshead.next())
					{
						pshead = con.prepareStatement("select * from userinfo where userid=?");
    					pshead.setInt(1, Integer.parseInt(rshead.getString("sender")));
    					ResultSet rsheadsender = pshead.executeQuery(); 
    					if(rsheadsender.next())
    					{
    					%>
                <!-- List group -->
                <div class="list-group list-group-flush">
                  <a href="messaging.jsp" class="list-group-item list-group-item-action">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <!-- Avatar -->
                        <% if(rsheadsender.getBlob("profilepic")!=null)
    					   {
    							Blob blob = rsheadsender.getBlob("profilepic");
    					%>
                           <img alt="Image placeholder" src="data:image/gif;base64,<%=dbhead.blobProcess(blob)%>" class="avatar rounded-circle">
                       <%}
                         else
                       {%>
                           
                           <img alt="Image placeholder" src="images/usericon.png" class="avatar rounded-circle">
                      <%} %>
                      </div>
                      <div class="col ml--2">
                        <div class="d-flex justify-content-between align-items-center">
                          <div>
                            <h4 class="mb-0 text-sm"><%=rsheadsender.getString("fname") %></h4>
                          </div>
                          <div class="text-right text-muted">
                            <small><%=rshead.getString("dateTime") %></small>
                          </div>
                        </div>
                        <p class="text-sm mb-0"><%= rshead.getString("body")%></p>
                      </div>
                    </div>
                  </a>
                  
                </div>
                
                <%}} %>
                <!-- View all -->
                <a href="inbox.jsp" class="dropdown-item text-center text-primary font-weight-bold py-3">View all</a>
              </div>
            </li>
            
            <%} %>
		
		
        
 
 			<% 
			  pshead = con.prepareStatement("select * from userinfo where userid=?");
				pshead.setInt(1, Integer.parseInt(useridhead));
				rshead = pshead.executeQuery();

				if (rshead.next()) 
				{
					if(rshead.getBlob("profilepic")!=null)
					{
						Blob blob = rshead.getBlob("profilepic");
				
			%>
			<li class="nav-item dropdown">
			<a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<div class="media align-items-center">
						<span class="avatar avatar-sm rounded-circle"> <img
							src="data:image/gif;base64,<%=dbhead.blobProcess(blob)%>" />

						</span>
						<div class="media-body ml-2 d-none d-lg-block">
							<span class="mb-0 text-sm font-weight-bold"></span>
						</div>
					</div>
			</a>
			<%}
			else{%>
				<li class="nav-item dropdown">
				<a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="media align-items-center">
							<span class="avatar avatar-sm rounded-circle"> <img
								src="images/usericon.png" />

							</span>
							<div class="media-body ml-2 d-none d-lg-block">
								<span class="mb-0 text-sm font-weight-bold"></span>
							</div>
						</div>
				</a>
			<%}}%> 
				<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
					<div class=" dropdown-header noti-title">
						<h6 class="text-overflow m-0">Welcome, <%=rshead.getString("fname")%>!</h6>
					</div>
					<a href="profile.jsp" class="dropdown-item"> <i class="ni ni-single-02"></i>
						<span>My profile</span>
					</a> <a href="#" class="dropdown-item"> <i
						class="ni ni-settings-gear-65"></i> <span>Settings</span>
					</a> <a href="#" class="dropdown-item"> <i
						class="ni ni-calendar-grid-58"></i> <span>Activity</span>
					</a> <a href="#" class="dropdown-item"> <i class="ni ni-support-16"></i>
						<span>Support</span>
					</a>
					<div class="dropdown-divider"></div>
					<a href="Logout" class="dropdown-item"> <i class="ni ni-user-run"></i>
						<span>Logout</span>
					</a>
				</div></li>
				
		</ul>
	</div>
</nav>

<!-- Core -->
<script src="./assets/vendor/jquery/dist/jquery.min.js"></script>
<script src="./assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="./assets/js/argon.js?v=1.0.0"></script>

<script>
	//When the page has loaded.
	$(document).ready(function() {
		$('.alert').fadeIn('slow', function() {
			$('.alert').delay(5000).fadeOut();
		});
	});
</script>


<%
	
	
	} else {
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?Message=UnAuthorized");
		rd.forward(request, response);

	}
%>