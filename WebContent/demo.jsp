<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>SocioGram</title>

</head>
<jsp:include page="sidenavbar.jsp"></jsp:include>
<body>
	<div class="main-content">
		<jsp:include page="newheader.jsp"></jsp:include>

		<!-- Header ->
		<div class="header pb-8 pt-5 pt-md-8"
			style="background-color: #22a6b3">
			<div class="container-fluid">
				<div class="header-body"></div>
			</div>
		</div>
		<!-- Page content ->

		<!--<div class="container-fluid mt--7">
			<div class="row justify-content-center">
				<div class="col-xl-12 mb-5 mb-xl-0">
					<div class="card bg-secondary shadow">
						<div class="card-header bg-white">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">Demo</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group"></div>
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


<div class="card card-profile">
    <img src="./assets/img/theme/img-1-1000x600.jpg" alt="Image placeholder" class="card-img-top">
    <div class="row justify-content-center">
        <div class="col-lg-3 order-lg-2">
            <div class="card-profile-image">
                <a href="#">
                    <img src="./assets/img/theme/team-4-800x800.jpg" class="rounded-circle">
                </a>
            </div>
        </div>
    </div>
    <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
        <div class="d-flex justify-content-between">
            <a href="#" class="btn btn-sm btn-info mr-4">Connect</a>
            <a href="#" class="btn btn-sm btn-default float-right">Message</a>
        </div>
    </div>
    <br><br><br>
    <div class="card-body pt-0">
        <div class="row">
            <div class="col">
                <div class="card-profile-stats d-flex justify-content-center">
                    <div>
                        <span class="heading">22</span>
                        <span class="description">Friends</span>
                    </div>
                    <div>
                        <span class="heading">10</span>
                        <span class="description">Photos</span>
                    </div>
                    <div>
                        <span class="heading">89</span>
                        <span class="description">Comments</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center">
            <h5 class="h3">
                Jessica Jones<span class="font-weight-light">, 27</span>
            </h5>
            <div class="h5 font-weight-300">
                <i class="ni location_pin mr-2"></i>Bucharest, Romania
            </div>
            
            
        </div>
    </div>
</div>
</div>-->

<br><br><br><br><br><br><br><br><br>

		<div class="row">

			<div class="col-md-4">
				<button type="button" class="btn btn-block btn-default"
					data-toggle="modal" data-target="#modal-form">Form</button>
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
													src="../../assets/img/icons/common/github.svg"></span> <span
												class="btn-inner--text">Github</span>
											</a> <a href="#" class="btn btn-neutral btn-icon"> <span
												class="btn-inner--icon"><img
													src="../../assets/img/icons/common/google.svg"></span> <span
												class="btn-inner--text">Google</span>
											</a>
										</div>
									</div>
									<div class="card-body px-lg-5 py-lg-5">
										<div class="text-center text-muted mb-4">
											<small>Or sign in with credentials</small>
										</div>
										<form role="form">
											<div class="form-group mb-3">
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-email-83"></i></span>
													</div>
													<input class="form-control" placeholder="Email"
														type="email">
												</div>
											</div>
											<div class="form-group">
												<div class="input-group input-group-alternative">
													<div class="input-group-prepend">
														<span class="input-group-text"><i
															class="ni ni-lock-circle-open"></i></span>
													</div>
													<input class="form-control" placeholder="Password"
														type="password">
												</div>
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
												<button type="button" class="btn btn-primary my-4">Sign
													in</button>
											</div>
										</form>
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



