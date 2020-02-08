<!DOCTYPE html>
<html>
<head>
<title>SocioGram</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<link href="global.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

</head>
<body>
	<form action="Login">


		<div class="container-fluid" id="bg">
			<div class="row">
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
				<div class="col-md-4 col-sm-4 col-xs-12">
					<!-- form start -->
					<form class="form-container">
						<h1>Login Form</h1>
						<div class="form-group">
							<label for="InputEmail1">Email:</label> <input type="email"
								class="form-control" id="InputEmail1" name="email"
								placeholder="Email">
						</div>
						<div class="form-group">
							<label for="InputPassword1">Password:</label> <input
								type="password" class="form-control" id="InputPassword1"
								name="password" placeholder="Password">
						</div>

						<div class="checkbox">
							<label> <input type="checkbox">Remember Me
							</label>
						</div>
						<button type="submit" class="btn btn-success btn-block">Submit</button>
					</form>

					<!-- form end -->
				</div>
				<div class="col-md-4 col-sm-4 col-xs-12"></div>
			</div>
		</div>
</body>
</html>
