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
	content="width=device-width, initial-scale=1">
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
<nav class="sidenav navbar navbar-vertical  fixed-left  navbar-expand-xs navbar-light bg-white" id="sidenav-main">
 <div class="scrollbar-inner">
	
	<!-- Brand -->
      <div class="sidenav-header  align-items-center">
        <a class="navbar-brand" href="javascript:void(0)">
          <img src="images/sociogram.png" class="navbar-brand-img" alt="SocioGram Logo">
        </a>
      </div>
      
      <div class="navbar-inner">  
      
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
          <!-- Nav items -->
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