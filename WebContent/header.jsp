<%@page import="java.util.Base64"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="nl.captcha.Captcha"%>

<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script>
	addEventListener("load", function () 
	{
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() 
	{
		window.scrollTo(0, 1);
	}

function showhidePass() {
    var x = document.getElementById("password");
    var eye = document.getElementById("eye");

    if (x.type === "password") {
        x.type = "text";
        eye.className = "ni ni-world"
    } else {
        x.type = "password";
        eye.className = "ni ni-lock-circle-open"
    }
}

</script>
<!--// Meta tag Keywords -->
<!-- Custom-Files -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Bootstrap-Core-CSS -->
<link href="css/css_slider.css" type="text/css" rel="stylesheet" media="all">
<!-- css slider -->
<!-- Style-CSS -->
<link href="css/style.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- Font-Awesome-Icons-CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- //Custom-Files -->

<!-- Web-Fonts -->
<link
	href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&amp;subset=latin-ext"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Barlow+Semi+Condensed:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- //Web-Fonts -->

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


<!-- Core -->
<script src="./assets/vendor/jquery/dist/jquery.min.js"></script>
<script src="./assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="./assets/js/argon.js?v=1.0.0"></script>



<%
     Captcha captcha = new Captcha.Builder(160, 50)
             .addNoise()
             .addText()
             .addBorder()
             .gimp()
             .addBackground()
             .build();
     ByteArrayOutputStream baos = new ByteArrayOutputStream();
     ImageIO.write(captcha.getImage(), "jpg", baos);
     baos.flush();
     byte[] arrbyte = baos.toByteArray();
     String captchsrc = Base64.getEncoder().encodeToString(arrbyte);
     session.setAttribute("captcha_Ans", captcha.getAnswer());
 %>

		
<!-- navigation -->
<nav>
<div class="main-top py-1">
  <div class="container">
    <div class="nav-content">
      <!-- logo -->
      <h1>
        <a id="logo" class="logo" href="index.jsp">
          <img src="" alt="" class="img-fluid"> SocioGram
        </a>
      </h1>
<!-- //logo -->
<div class="nav_web-dealingsls">
 <label for="drop" class="toggle"><i class="ni ni-align-center"></i></label>
    <input type="checkbox" id="drop" />
    <ul class="menu">
      <li><a href="creategroup.jsp">Start a New Group</a></li>
    	<li>
    		<button type="button" class="btn btn-block btn-default"
					data-toggle="modal" data-target="#modal-form">Login</button>
    	</li>
    	<li>
    		<button type="button" class="btn btn-block btn-primary"
					data-toggle="modal" data-target="#modal-form-register">Sign Up</button>
    	</li>
    </ul>    
<div class="modal fade" id="modal-form" tabindex="-1" role="dialog"
	aria-labelledby="modal-form" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-sm"
		role="document">
		<div class="modal-content">

			<div class="modal-body p-0">


				<div class="card bg-secondary shadow border-0">
					<div class="card-header bg-transparent pb-5">
						<div class="text-muted text-center mt-2 mb-3">
							<small>Sign in with</small>
						</div>
						<div class="btn-wrapper text-center">
							<a href="#" class="btn btn-neutral btn-icon"> <span
								class="btn-inner--icon"><img
									src="./assets/img/icons/common/github.svg"></span> <span
								class="btn-inner--text">Github</span>
							</a> <a href="#" class="btn btn-neutral btn-icon"> <span
								class="btn-inner--icon"><img
									src="./assets/img/icons/common/google.svg"></span> <span
								class="btn-inner--text">Google</span>
							</a>
						</div>
					</div>
					<div class="card-body px-lg-5 py-lg-5">
						<div class="text-center text-muted mb-4">
							<small>Or sign in with credentials</small>
						</div>
						<form action="Login" method="post">
							<div class="form-group mb-3">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="ni ni-email-83"></i></span>
									</div>
									<input class="form-control" placeholder="Email"
										type="email" name="email">
								</div>
							</div>
							<div class="form-group">
								<div class="input-group input-group-alternative">
									<div class="input-group-prepend">
										<span class="input-group-text"><i
											class="ni ni-lock-circle-open"></i></span>
									</div>
									<input class="form-control" placeholder="Password"
										type="password" name="password">
								</div>
							</div>
							<div class="form-group">
								<div class="g-recaptcha" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"></div>
							</div>
							<div
								class="custom-control custom-control-alternative custom-checkbox">
								<input class="custom-control-input" id=" customCheckLogin"
									type="checkbox"> <label
									class="custom-control-label" for=" customCheckLogin">
									<span class="text-muted">Remember me</span>
								</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary my-4">Sign
									in</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>




<div class="modal fade" id="modal-form-register" tabindex="-1" role="dialog"
	aria-labelledby="modal-form-register" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-sm"
		role="document">
		<div class="modal-content">

			<div class="modal-body p-0">


		
          <div class="card bg-secondary shadow border-0">
            <div class="card-header bg-transparent pb-5">
              <div class="text-muted text-center mt-2 mb-4"><small>Sign up with</small></div>
              <div class="text-center">
                <a href="#" class="btn btn-neutral btn-icon mr-4">
                  <span class="btn-inner--icon"><img src="./assets/img/icons/common/github.svg"></span>
                  <span class="btn-inner--text">Github</span>
                </a>
                <a href="signinwithgoogle.jsp" class="btn btn-neutral btn-icon">
                  <span class="btn-inner--icon"><img src="./assets/img/icons/common/google.svg"></span>
                  <span class="btn-inner--text" >Google</span>
                </a>
              </div>
            </div>
            <div class="card-body px-lg-5 py-lg-5">
              <div class="text-center text-muted mb-4">
                <small>Or sign up with credentials</small>
              </div>
              <form action="Register" method="post">
                <div class="form-group">
                  <div class="input-group input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-circle-08"></i></span>
                    </div>
                    <input class="form-control" placeholder="First Name" type="text" name="fname" id="fname">
                  </div>                  
                </div>         
                <div class="form-group">
                  <div class="input-group input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                    </div>
                    <input class="form-control" placeholder="Last Name" type="text" name="lname" id="name">
                  </div>
                </div>          
                <div class="form-group">
                  <div class="input-group input-group-alternative mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                    </div>
                    <input class="form-control" placeholder="Email" type="email"  name="email">
                  </div>
                </div>
                <div class="form-group">
                  <div class="input-group input-group-alternative">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                      <i class="ni ni-lock-circle-open" onclick="showhidePass()" id="eye"></i></span>
                    </div>
                    <input class="form-control" placeholder="Password" type="password" id="password" name="password">
                  </div>
                </div>
                <div class="text-muted font-italic"><small>password strength: <span class="text-success font-weight-700">strong</span></small></div>
                <div class="row my-4">
                  <div class="col-12">
                    <div class="custom-control custom-control-alternative custom-checkbox">
                      <input class="custom-control-input" id="customCheckRegister" type="checkbox" required>
                      <label class="custom-control-label" for="customCheckRegister">
                        <span class="text-muted">I agree with the <a href="privacypolicy.html">Privacy Policy</a></span>
                      </label>
                    </div>
                  </div>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn btn-primary mt-4">Create account</button>
                </div>
              </form>
            </div>
          </div>
          </form>


			</div>
		</div>
	</div>
</div>

  
<div class="modal fade" id="popup1" role="dialog">
	<div class="modal-dialog">
    	<div class="modal-content">
			<div class="modal-header">
            	<h3 class="modal-title">Login
                <button type="button" class="close" data-dismiss="modal">&times;</button></h3>
            </div> <!--model-header-->
       
            <div class="modal-body">
            	<fieldset>
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                        <input type="email" class="form-control" name="email" placeholder="Username">
                    </div>
                    <div class="clearfix"></div><br>

                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                        <input type="password" class="form-control" name="password" placeholder="Password">
                    </div>
                    <div class="clearfix"></div><br>
                    
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                        <img name="captcha" id="captcha" src="data:image/jpg;base64,<%= captchsrc%>">
                        <input type="button" class="btn" value="Refresh" onClick="window.location.reload();"/>
                    </div>
                    <div class="clearfix"></div><br>
                    
                    
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                        <input type="text"  class="form-control" name="uans_captcha" id="captchans"/> 
                    </div>
                    <div class="clearfix"></div><br>
       

                    <div class="input-prepend">
                        <label class="remember" for="remember"><input type="checkbox" id="remember"> Remember me</label>
                    </div>
                    <div class="clearfix"></div>
                    
                    <!-- <div class="g-recaptcha" data-sitekey="6LeIxAcTAAAAAJcZVRqyHh71UMIEGNQ_MXjiZKhI"></div>-->
                 	
                 	<div class="center col-md-5">
                    	<button type="submit" class="btn btn-primary" name="login" value="login">Login</button>
                    </div>
                </fieldset>
            </div> 
            <!--model-body-->
            <div class="modal-footer">
            <input type="button" class="btn btn-danger" data-dismiss="modal" value="Close">
            </div> 
            <!--model-footer-->
        		</div> <!--model-content-->
    		</div> <!--model-dialog-->
		</div> 
	</form><!--model header-->   
    </div>
  </div>
</div>
</div> <!-- of main top class -->
</nav>