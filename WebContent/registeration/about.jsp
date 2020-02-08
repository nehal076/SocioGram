<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/register/favicon.ico">

	<title>SocioGram | Register </title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/register/apple-icon.png" />
	<link rel="icon" type="image/png" href="../assets/img/register/favicon.png" />

	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Files -->
	<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="../assets/css/material-bootstrap-wizard.css" rel="stylesheet" />

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="../assets/css/demo.css" rel="stylesheet" />
	
	

<script type="text/javascript">
var array = []
var interests = document.querySelectorAll('input[type=checkbox]:checked')

for (var i = 0; i < interests.length; i++) {
  array.push(interests[i].value)
}

</script>


<script>
            function showhidePass() {
                var x = document.getElementById("password");
                var eye = document.getElementById("eye");

                if (x.type === "password") {
                    x.type = "text";
                    eye.className = "fa fa-eye"
                } else {
                    x.type = "password";
                    eye.className = "fa fa-eye-slash"
                }
            }
            
            function showhidePass1() {
                var x = document.getElementById("cnfpassword");
                var eye = document.getElementById("eye1");

                if (x.type === "password") {
                    x.type = "text";
                    eye.className = "fa fa-eye"
                } else {
                    x.type = "password";
                    eye.className = "fa fa-eye-slash"
                }
            }
</script>

</head>


<%
	try 
	{
		HttpSession ssn = request.getSession(false);
		String userid = (String) ssn.getAttribute("userid");
		System.out.println("userid @ registration : " + userid);

		DatabaseConnection db = new DatabaseConnection();
		Connection cn = db.setConnection();

		
%>
<body>
	<div class="image-container set-full-height" style="background-image: url('../assets/img/register/wizard-profile.jpg')">
	    <!--   Creative Tim Branding   -->
	    <a href="http://creative-tim.com">
	         <div class="logo-container">
	            <div class="logo">
	                <img src="../assets/img/register/new_logo.png">
	            </div>
	            <div class="brand">
	                SocioGram
	            </div>
	        </div>
	    </a>

		<!--  Made With Material Kit  -->
		<a href="https://sociogram.com" class="made-with-mk">
			<div class="brand">SG</div>
			<div class="made-with"><strong>SocioGram</strong></div>
		</a>

	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">
		            <!--      Wizard container        -->
		            <div class="wizard-container">
		                <div class="card wizard-card" data-color="green" id="wizardProfile">
		                    <form action="../Register" method="post" enctype="multipart/form-data">
		                <!--        You can switch " data-color="purple" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->

		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">
		                        	   Register and Build Your Profile
		                        	</h3>
									<h5>This information will let us know more about you.</h5>
		                    	</div>
								<div class="wizard-navigation">
									<ul>
			                            <li><a href="#about" data-toggle="tab">About</a></li>
			                            <li><a href="#interests1" data-toggle="tab">Interests</a></li>
			                           	<li><a href="#topics" data-toggle="tab">Topics</a></li>
			                            <li><a href="#address" data-toggle="tab">Address</a></li>
			                        </ul>
								</div>

		                        <div class="tab-content">
		                            <div class="tab-pane" id="about">
		                              <div class="row">
		                                	<h4 class="info-text"> Let's start with the basic information (with validation)</h4>
		                                	<div class="col-sm-4 col-sm-offset-1">
		                                    	<div class="picture-container">
		                                        	<div class="picture">
                                        				<img src="../assets/img/register/default-avatar.png" class="picture-src" id="wizardPicturePreview" title=""/>
		                                            	<input type="file" id="wizard-picture" name="FileUpload1">
		                                        	</div>
		                                        	<h6>Choose Picture</h6>
		                                    	</div>
		                                	</div>
		                                	<div class="col-sm-6">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">face</i>
													</span>
													<div class="form-group label-floating">
			                                          <label class="control-label">First Name <small>(required)</small></label>
			                                          <input name="fname" type="text" class="form-control">
			                                        </div>
												</div>

												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">record_voice_over</i>
													</span>
													<div class="form-group label-floating">
													  <label class="control-label">Last Name <small>(required)</small></label>
													  <input name="lname" type="text" class="form-control">
													</div>
												</div>
		                                	</div>
		                                	<div class="col-sm-10 col-sm-offset-1">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">email</i>
													</span>
													<div class="form-group label-floating">
			                                            <label class="control-label">Email <small>(required)</small></label>
			                                            <input name="email" type="email" class="form-control">
			                                        </div>
												</div>
		                                	</div>
		                                	
		                                	<div class="col-sm-10 col-sm-offset-1">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-eye-slash" id="eye" onclick="showhidePass()" ></i>
													</span>
													<div class="form-group label-floating">
			                                            <label class="control-label">Password <small>(required)</small></label>
			                                            <input name="password" id="password" type="password" class="form-control">
			                                        </div>
												</div>
		                                	</div>
		                                	
		                                	<div class="col-sm-10 col-sm-offset-1">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-eye-slash" id="eye1" onclick="showhidePass1()"></i>
													</span>
													<div class="form-group label-floating">
			                                            <label class="control-label">Confirm Password <small>(required)</small></label>
			                                            <input name="cnfpassword" id="cnfpassword" type="password" class="form-control">
			                                        </div>
												</div>
		                                	</div>
		                            	</div>
		                            </div>
	
		                            
		                        <div class="wizard-footer">
		                            <div class="pull-right">
		                                <input type='submit' class='btn btn-next btn-fill btn-success btn-wd' name='next' value='Next' />
		                                
		                            </div>

		                            <div class="pull-left">
		                                <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />
		                            </div>
		                            <div class="clearfix"></div>
		                        </div>
		                    </form>
		                </div>
		            </div> <!-- wizard container -->
		        </div>
	        </div><!-- end row -->
	    </div> <!--  big container -->

	    <div class="footer">
	        <div class="container text-center">
	             Made with <i class="fa fa-heart heart"></i> by <a href="sociogram.com">SocioGram</a>.
	        </div>
	    </div>
	</div>

</body>
<%

		} 
		catch (Exception e) 
		{
			System.out.println("sql alert[registration] - " + e.getMessage() + "\n");
		}
		%>
	<!--   Core JS Files   -->
    <script src="../assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../assets/js/jquery.bootstrap.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="../assets/js/material-bootstrap-wizard.js"></script>

    <!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="../assets/js/jquery.validate.min.js"></script>

</html>
