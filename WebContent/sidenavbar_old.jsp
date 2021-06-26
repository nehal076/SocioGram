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
<!-- Sidenav -->
<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
 
 
  <div class="container-fluid">
  	<div class="collapse navbar-collapse" id="navbarSupportedContent">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
      <a class="navbar-brand pt-0" href="/index.jsp">
          <img src="images/sociogram.png" class="navbar-brand-img"  alt="SocioGram Logo">
      </a>
      
      
      <!-- User -->
      <ul class="nav align-items-center d-md-none ml-md-auto">
      
      
        <%
		pshead = con.prepareStatement("select count(*) from sociogram.messaging where receiver=?");
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
                <%pshead = con.prepareStatement("select * from sociogram.messaging where receiver=? limit 5");
					pshead.setInt(1, Integer.parseInt(useridhead));
					rshead = pshead.executeQuery();
					while(rshead.next())
					{
						pshead = con.prepareStatement("select * from sociogram.userinfo where userid=?");
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
      
      
      
      
      
      
      
      
      
      
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
          <!-- Collapse header -->
          <div class="navbar-collapse-header d-md-none">
              <div class="row">
                  <div class="col-6 collapse-brand">
                      <a href="">
                          <img src="images/sociogram.png">
                      </a>
                  </div>
                  <div class="col-6 collapse-close">
                      <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                          <span></span>
                          <span></span>
                      </button>
                  </div>
              </div>
          </div>
          <!-- Navigation -->
          <ul class="navbar-nav">
              <li class="nav-item">
                  <a class="nav-link" href="home.jsp">
                      <i class="ni ni-shop text-indigo"></i> Home
                  </a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="explore.jsp">
                      <i class="ni ni-world text-teal"></i> Explore
                  </a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="#">
                      <i class="ni ni-square-pin text-green"></i> Upcoming Events 
                  </a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="mygroups.jsp">
                      <i class="fa fa-group text-purple"></i> My Groups
                  </a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="rewards.jsp">
                      <i class="ni ni-trophy text-orange"></i> My Rewards
                  </a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="mycalendar.jsp">
                      <i class="ni ni-badge text-blue"></i> My Calendar
                  </a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="organizerEvents.jsp">
                      <i class="ni ni-collection text-green"></i> Organizer Events
                  </a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="#navbar-messages" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-forms">
                      <i class="ni ni-bell-55 text-yellow"></i>
                      <span class="nav-link-text">Messages</span> 
                  </a>
                  <div class="collapse" id="navbar-messages">
                      <ul class="nav nav-sm flex-column">
                          <li class="nav-item">
                              <a href="inbox.jsp" class="nav-link">
                                  <i class="fa fa-comments-o text-yellow"></i>
                                  Inbox
                              </a>
                          </li>
                          <li class="nav-item">
                              <a href="messaging.jsp" class="nav-link active">
                                  <i class="ni ni-send" style="color:#22a6b3"></i>
                                  Create Message
                              </a>
                          </li>
                      </ul>
                  </div>
              </li>
          </ul>
          <!-- Divider -->
          <hr class="my-3">
          <!-- Heading -->
          <h6 class="navbar-heading text-muted"> Activity Centre</h6>
          <!-- Navigation -->
          <ul class="navbar-nav mb-md-3">	
              <!-- create menu -->
              <li class="nav-item">
                  <a class="nav-link" href="#navbar-create" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-forms">
                      <i class="material-icons text-green">add</i>
                      <span class="nav-link-text">Create/Host</span>
                  </a>
                  <div class="collapse" id="navbar-create">
                      <ul class="nav nav-sm flex-column">
                          <li class="nav-item">
                              <a href="creategroup.jsp" class="nav-link">
                                  <i class="ni ni-single-02 text-purple"></i>
                                  Group
                              </a>
                          </li>
                          <li class="nav-item">
                              <a href="createevent.jsp" class="nav-link active">
                                  <i class="ni ni-building" style="color:#22a6b3"></i>
                                  Event
                              </a>
                          </li>
                      </ul>
                  </div>
              </li>
              <!-- Edit Menu-->
              <li class="nav-item">
                  <a class="nav-link" href="#navbar-Edit" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-forms">
                      <i class="material-icons text-purple">create</i>
                      <span class="nav-link-text">Edit</span>
                  </a>
                  <div class="collapse" id="navbar-Edit">
                      <ul class="nav nav-sm flex-column">
                          <li class="nav-item">
                              <a href="#" class="nav-link">
                                  <i class="ni ni-circle-08 text-green"></i>
                                  Group
                              </a>
                          </li>
                          <li class="nav-item">
                              <a href="#" class="nav-link">
                                  <i class="ni ni-single-02 text-purple"></i>	
                                  Event
                              </a>
                          </li>
                          <li class="nav-item">
                              <a href="#" class="nav-link">
                                  <i class="ni ni-building" style="color:#22a6b3"></i>
                                    Activity
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        </div>
    </div>
</nav>

<%
	} else {
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp?Message=UnAuthorized");
		rd.forward(request, response);
	}
%>