<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<%
	DatabaseConnection db = new DatabaseConnection();
	Connection cn = db.setConnection();
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<html>
<head>
<title>SocioGram</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<meta name="keywords"
	content="SocioGram simplifies the process of helping you find people based on your available times, your location, you favorite sports, and your skill level." />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="./assets/img/brand/favicon.ico" rel="icon" type="image/png">
<style> 
        .text{ 
            white-space: nowrap;  
            overflow: hidden; 
            text-overflow: ellipsis;
           
		    padding: 0;
		    font-size: 17px;
		    line-height: 25px;
		    color: #999;
		    font-family: 'Zapf Chancery', cursive;
		    font-weight: normal;
		    -webkit-line-clamp: 2;   
        } 
        
        
    </style> 
    
        
</head>

<body>
	<header id="home">
		
		<jsp:include page="header.jsp"></jsp:include>
		<!-- top-bar -->
	</header>
	<!-- Header -->
            <div class="header py-7 py-lg-8">
                <div class="container">
                    <div class="header-body">
                        <div class="row justify-content-center">
                            <div class="col-lg-5 col-md-6 ">
                                <%
                                    String Message = request.getParameter("Message");
                                    if (Message != null) {
                                        if (Message.equals("LoginFailed")) {
                                %>
                                <div class="alert alert-danger alert-dismissible fade show mb-5" role="alert">
                                    <span class="alert-inner--icon"><i class="fa fa-thumbs-down"></i></span>
                                    <span class="alert-inner--text"><strong>Danger!</strong> Invalid credentials!</span>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <%      } else if (Message.equals("UnAuthorized")) {
                                %>
                                <div class="alert alert-warning alert-dismissible fade show mb-5" role="alert">
                                    <span class="alert-inner--icon"><i class="fa fa-bolt"></i></span>
                                    <span class="alert-inner--text"><strong>Warning!</strong> Login first!</span>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <%} else if (Message.equals("Registered")) {%>
                                <div class="alert alert-success alert-dismissible fade show mb-5" role="alert">
                                <span class="alert-inner--icon"><i class="ni ni-like-2"></i></span>
                                <span class="alert-inner--text"><strong>Success!</strong> Registration successful!</span>
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div> 
                            <%   }else if (Message.equals("Logout")) {%>
                            <div class="alert alert-success alert-dismissible fade show mb-5" role="alert">
                            <span class="alert-inner--icon"><i class="ni ni-like-2"></i></span>
                            <span class="alert-inner--text"><strong>Success!</strong> You have logged out!</span>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <%   }else if (Message.equals("CaptchaFail")) {%>
                        <div class="alert alert-danger alert-dismissible fade show mb-5" role="alert">
                        <span class="alert-inner--icon"><i class="fa fa-bolt"></i></span>
                        <span class="alert-inner--text"><strong>Warning!</strong> Captcha did not match!</span>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <%}else {%>
                    <div class="alert alert-danger alert-dismissible fade show mb-5" role="alert">
                    <span class="alert-inner--icon"><i class="fa fa-bolt"></i></span>
                    <span class="alert-inner--text"><strong>Error!</strong> Unknown error!</span>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                	</div>
                <% }}
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	
	
	<!-- //navigation -->
	
	
	
	
	
	<!-- about us -->
	<section class="features py-5" id="features">
		<div class="container py-md-5 py-3">
			<div class="title-section text-center mb-md-5 mb-4">
				<p class="w3ls-title-sub">Features</p>
				<h3 class="w3ls-title mb-3">
					What You <span>Get</span>
				</h3>
				<div class="feature-grids row">
					<div class="col-lg-4 col-md-6 col-sm-6 mb-5">
						<div class="bottom-gd">
							
							<h3 class="mt-4">Social Connect</h3>
							<p class="mt-2">Helps you connect with groups of
								well-connected professionals, mentors, and potential humans of
								same interest.</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 mb-5">
						<div class="bottom-gd">
							
							<h3 class="mt-4">Great Opportunities</h3>
							<p class="mt-2">Meet new people, get out of their comfort
								zones, learn new things, pursue passions, and find supportive
								communities.</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 mb-5">
						<div class="bottom-gd">
							
							<h3 class="mt-4">Trouble-Free</h3>
							<p class="mt-2">Simplifies the process of helping you find
								people based on your available times,your favorite sports, and
								your skill level.</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 col-sm-6 mb-5">
						<div class="bottom-gd">
							
							<h3 class="mt-4">Sound Fitness</h3>
							<p class="mt-2">Helps with mental ability and physical
								healthiness which is good sign for long run.</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6  mb-5">
						<div class="bottom-gd">
							
							<h3 class="mt-4">Explore Places</h3>
							<p class="mt-2">Friendly & Professional Team for the best
								customer support experience.</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 col-sm-6 mb-5">
						<div class="bottom-gd">
							
							<h3 class="mt-4">Growth & Evolution</h3>
							<p class="mt-2">Boost your own journey of self-confidence
										and development.</p>
								
						</div>
					</div>
				</div>
			</div>
			</div>
	</section>
	
	
		
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/slide.jpg" alt="Los Angeles" style="width: 100%;"
						class="img-responsive ">
				</div>

				<div class="item">
					<img src="images/slide.jpg" alt="Chicago"
						style="width: 100% !important;">
				</div>

				<div class="item">
					<img src="images/slide.jpg" alt="New York"
						style="width: 100% !important;">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div class="container py-xl-5 py-3">
		<div class="row pb-lg-4 pt-lg-5">
			<div class="col-lg-6 col-md-9 text-center">
				<h3 class="w3ls-title mb-2">Subscribe to Newsletter</h3>
				<p class="mb-xl-5 mb-4">Free Delivery on your first order!</p>
				<form action="#" method="post" class="d-flex newsletter-info">
					<input type="email" name="email" placeholder="Enter your Email..."
						required>
					<button type="submit">Submit</button>
				</form>
			</div>
			<div class="col-lg-6 col-md-3">
				<img src="images/yoga1.jpg" alt="Los Angeles" class="img-Thumbnail">

			</div>
		</div>
	</div>


	<div class="container">
	<%
		PreparedStatement ps = cn.prepareStatement("select * from events ORDER BY RAND() LIMIT 3;");
	    ResultSet rs = ps.executeQuery();
	    while(rs.next())
	    {
	    	if(rs.getBlob("eventphoto")!=null)
	    	{
	    	Blob blob = rs.getBlob("eventphoto");
	
	%>
	
		<div class="col-lg-4 col-md-4 text-center">
			<img src="data:image/gif;base64,<%=db.blobProcess(blob)%>" alt="Los Angeles" class="img-Thumbnail">
			<h5 class="blog-title card-title mb-2">
				<a href="eventinfo.jsp?eventid=<%=rs.getString("eventid")%>"><%=rs.getString("eventname") %></a>
			</h5>
			<div class="blog_w3icon border-top border-bottom py-1 mb-3">
				<span> <%= rs.getString("eventvenue") %> - <%= rs.getString("eventdate") %></span>
			</div>
			<p><div class="text"><%=rs.getString("description")%></div></p>
			<a href="single.html" class="button-w3ls active mt-4">Read More <span
				class="fa fa-caret-right ml-1" aria-hidden="true"></span>
			</a>
		</div>
		
		<%}
	    	else
	    	{%>
	    	
	    <div class="col-lg-4 col-md-4 text-center">
			<img src="images/yoga1.jpg" alt="Los Angeles" class="img-Thumbnail">
			<h5 class="blog-title card-title mb-2">
				<a href="eventinfo.jsp?eventid=<%=rs.getString("eventid")%>"><%=rs.getString("eventname") %></a>
			</h5>
			<div class="blog_w3icon border-top border-bottom py-1 mb-3">
				<span> <%= rs.getString("eventvenue") %> - <%= rs.getString("eventdate") %></span>
			</div>
			<p><%=rs.getString("description")%></p>
			<a href="single.html" class="button-w3ls active mt-4">Read More <span
				class="fa fa-caret-right ml-1" aria-hidden="true"></span>
			</a>

		</div>
	    <%  }} %>
	    
	        
		
	
	</div>
	
	
	
	<br>
	<!-- footer -->
	<footer class="py-5">
		<%@ include file="footer.jsp"%>
	</footer>
	<!-- //footer -->
	
	
        <script>
            //When the page has loaded.
            $(document).ready(function () {
                $('.alert').fadeIn('slow', function () {
                    $('.alert').delay(5000).fadeOut();
                });
            });
        </script>
</body>
</html>
