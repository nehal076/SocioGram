<%-- 
    Document   : orgEventShow
    Created on : Jan 18, 2020, 1:04:45 AM
    Author     : harshit
--%>

<%@page import="POJO.ShowEvent"%>
<%@page import="POJO.showGroups"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="POJO.eventShow"%>
<%@page import="Model.db_query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache,no-store");
    response.setHeader("Pragma", "no-cache,no-store");

    HttpSession hs = request.getSession(false);
    if (hs != null) {
        if (hs.getAttribute("email") != null) {
             ArrayList<ShowEvent> events=db_query.fetch_events();
        Iterator<ShowEvent> iterator=events.iterator();
%>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin</title>

  <!-- Custom fonts for this template-->
  <link href="startbootstrap-sb-admin-2-gh-pages/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    
  <!-- Custom styles for this page -->
  <link href="startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="startbootstrap-sb-admin-2-gh-pages/css/sb-admin-2.min.css" rel="stylesheet">
<!-- edit icon for user-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="css/editUser.css">
<script src="js/editUser.js"></script>
<script src="js/editUserr.js"></script>


</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="dashboard.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Admin</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="dashboard.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>
<!-- Create Event -->
       <li class="nav-item ">
        <a class="nav-link" href="event.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Create Event</span></a>
      </li>

      
      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
       <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-user"></i>
          <span>Show Users</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Total Users:</h6>
            <a class="collapse-item" href="showUsers.jsp">Registered</a>
            <a class="collapse-item" href="userLogin.jsp">Login</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item active">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-calendar"></i>
          <span>Events</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Events:</h6>
            <a class="collapse-item" href="eventShow.jsp">View User Event</a>
             <a class="collapse-item" href="orgEventShow.jsp">View Organizer Event</a>
            
          </div>
        </div>
      </li>    

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">
    <li class="nav-item  ">
        <a class="nav-link" href="showGroups.jsp">
          <i class="fas fa-fw fa-users"></i>
          <span>Groups</span></a>
      </li>
      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

         
          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter"></span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Notification
                </h6>
              
              
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                   You have new notification
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter">1</span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">You have a new message</div>
                    <div class="small text-gray-500"></div>
                  </div>
                </a>
              
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Harshit Agarwal</span>
                <img class="img-profile rounded-circle" src="harshit.jpg">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item"  data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->


        <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- Content Row -->
             <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
                   
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                 
                    <thead>
                    <tr>
                      <th>Contact Name </th>
                      <th>Contact Email</th>
                      <th>Contact Number:</th>
                      
                       <th> Title:</th>
                       <th>Description :</th>
                       <th>start Date:</th>
                       <th>End Date:</th>
                       <th>Registeration Date:</th>
                       <th>Event Venue:</th>
                    
                       <th>Status:</th>
                       
                       
                       <th><em class="fa fa-lock"></th>
                    
                       <th><em class="fa fa-cog"></em></th>
                    
                     
                    </tr>
                  </thead>
                
                  <tbody>
                 
                      <%
                        
                       while (iterator.hasNext()) {
                           
                           ShowEvent ev = iterator.next();
                    %>
                    <tr>
                        <td><%=ev.getContactname()%></td>
                        <td><%=ev.getContactemail()%></td>
                        <td><%=ev.getContactnum1()%>, <%=ev.getContactnum2()%></td>
                         <td><%=ev.getEventtitle()%></td>
                          <td><%=ev.getEventdesc()%></td>
                           <td><%=ev.getEventstartdate()%></td>
                            <td><%=ev.getEventenddate()%></td>
                             <td><%=ev.getEventregdate()%></td>
                              <td><%=ev.getEventvenue()%></td>
                        
                          <td><%=ev.getEventstatus()%></td>
                             
                             
                          <% 
                              String status=ev.getEventstatus();
                             
                              if(status.equals("Deactivate"))
                                {
                              %>
                          <td> <a href="../eventActivate?id=<%=ev.getId()%>" title="Permission"  class="fas fa fa-check">
                              </a></td>
                              <% }
                               else
                              { %>
                              <td> <a href="../eventD?id=<%=ev.getId()%>" title="Permission"  class="fas fa fa-times">
                              </a></td>
                              <% } %>
                              
                             <td>
                              <a href="eventUpdate.jsp?id=<%=ev.getId()%>" title="Edit" class="btn btn-default"><em class="fa fa-edit"></em></a>
                              <a href="../orgDelete?id=<%=ev.getId()%>" class="btn btn-default" title="Delete"><em class="fa fa-trash"></em></a>
                             </td> 
                    </tr>
                   <%;}%>
                
                </tbody>
                
                </table>
              </div>
                   
            </div>
          </div>

        </div>
         
          <!-- Content Row -->
        
          <!-- Content Row -->
          </div>
        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->


    <!-- End of Content Wrapper -->

  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="../logout">Logout</a>
        </div>
      </div>
    </div>
  </div>

      <!-- /.modal-dialog --> 
    </div>
    
    
    
   
  </div>
      <!-- /.modal-dialog --> 
    </div>

  <!-- Bootstrap core JavaScript-->
  <script src="startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
  <script src="startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="startbootstrap-sb-admin-2-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="startbootstrap-sb-admin-2-gh-pages/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
 <script src="startbootstrap-sb-admin-2-gh-pages/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.js"></script>
  <!-- Page level custom scripts -->
  <script src="startbootstrap-sb-admin-2-gh-pages/js/demo/datatables-demo.js"></script>

</body>
</html>
<% } else {
          response.sendRedirect("index.jsp");
        }
    }
%>

