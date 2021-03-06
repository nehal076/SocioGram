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

	<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/register/apple-icon.png" />
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
		                    <form action="topics.jsp" method="post">
		                <!--        You can switch " data-color="purple" "  with one of the next bright colors: "green", "orange", "red", "blue"       -->

		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">
		                        	   Register and Build Your Profile
		                        	</h3>
									<h5>This information will let us know more about you.</h5>
		                    	</div>
								<div class="wizard-navigation">
									<ul>
			                            <li><a href="#about">About</a></li>
			                            <li><a href="#interests1" data-toggle="tab">Interests</a></li>
			                           	<li><a href="#topics" >Topics</a></li>
			                            <li><a href="#address">Address</a></li>
			                        </ul>
								</div>

		                        <div class="tab-content">
		                        	<div class="tab-pane active" id="interests1">
		                                <h4 class="info-text"> Get started by picking a few interests. </h4>
		                                <div class="row">
		                                    <div class="col-sm-10 col-sm-offset-1">
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Tech">
		                                                
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Tech.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>	
		                                                </div>
		                                                <h6>Tech</h6>	                                                
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Family">
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Family.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>
		                                                </div>
		                                                <h6>Family</h6>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Sports">
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Sports and Fitness.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>	
		                                                </div> 
		                                                <h6>Sports and Fitness</h6>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                
		                                <div class="row">
		                                    <div class="col-sm-10 col-sm-offset-1">
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Learning">
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Learning.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>	
		                                                </div>
		                                                <h6>Learning</h6>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Language and Culture">
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Language and Culture.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>	
		                                                </div>
		                                                <h6>Language & Culture</h6>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Music">
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Music.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>	
		                                                </div>
		                                                <h6>Music</h6>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                                
		                                <div class="row">
		                                    <div class="col-sm-10 col-sm-offset-1">
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Book Clubs">
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Book Clubs.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>	
		                                                </div>
		                                                <h6>Book Clubs</h6>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Hobbies and Craft">
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Hobbies and Craft.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>	
		                                                </div>
		                                                <h6>Hobbies and Craft</h6>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Career and Business">
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Career and Business.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>	
		                                                </div>
		                                                <h6>Career and Business</h6>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            	<div class="row">
		                                    <div class="col-sm-10 col-sm-offset-1">
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Fashion and Beauty">
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Fashion and Beauty.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>	
		                                                </div>
		                                                <h6>Fashion and Beauty</h6>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Food and Drink">
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Food and Drink.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>	
		                                                </div>
		                                                <h6>Food and Drink</h6>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="interests" id="interests" value="Outdoor & Adventure">
		                                                <div class="picture icon">
		                                                	<img src="../assets/img/interests/Outdoor & Adventure.jpeg" class="picture-src" id="wizardPicturePreview" title=""/>	
		                                                </div>
		                                                <h6>Outdoor and Adventure</h6>
		                                            </div>
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
