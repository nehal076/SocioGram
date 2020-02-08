<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>SocioGram</title>


<!-- Mobiscroll JS and CSS Includes -->
<link rel="stylesheet" href="./assets/css/mobiscroll.javascript.min.css">
<script src="./assets/js/mobiscroll.javascript.min.js"></script>

<style type="text/css">
body {
	margin: 0;
	padding: 0;
}
</style>

</head>
<jsp:include page="sidenavbar.jsp"></jsp:include>
<body>
	<div class="main-content">
		<jsp:include page="newheader.jsp"></jsp:include>

		<!-- Header -->
		<div class="header pb-8 pt-5 pt-md-8"
			style="background-color: #22a6b3">
			<div class="container-fluid">
				<div class="header-body"></div>
			</div>
		</div>
		<!-- Page content -->

		<div class="container-fluid mt--7">
			<div class="row justify-content-center">
				<div class="col-xl-12 mb-5 mb-xl-0">
					<div class="card bg-secondary shadow">
						<div class="card-header bg-white">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">Calendar</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											
											
											
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>



	</div>


	<script>
		mobiscroll.settings = {
			theme : 'ios',
			themeVariant : 'light',
			lang : 'en'
		};

		var inst = mobiscroll.eventcalendar('#demo-desktop-month-view', {
			lang : 'en', // Specify language like: lang: 'pl' or omit setting to use default
			theme : 'ios', // Specify theme like: theme: 'ios' or omit setting to use default
			themeVariant : 'light', // More info about themeVariant: https://docs.mobiscroll.com/4-9-1/javascript/eventcalendar#opt-themeVariant
			display : 'inline', // Specify display mode like: display: 'bottom' or omit setting to use default
			calendarHeight : 614, // More info about calendarHeight: https://docs.mobiscroll.com/4-9-1/javascript/eventcalendar#opt-calendarHeight
			view : { // More info about view: https://docs.mobiscroll.com/4-9-1/javascript/eventcalendar#opt-view
				calendar : {
					labels : true
				// More info about labels: https://docs.mobiscroll.com/4-9-1/javascript/eventcalendar#opt-labels
				}
			},
			onEventSelect : function(event, inst) { // More info about onEventSelect: https://docs.mobiscroll.com/4-9-1/javascript/eventcalendar#event-onEventSelect
				mobiscroll.toast({

					message : event.event.text
				});
			}
		});

		mobiscroll.util.getJson('https://trial.mobiscroll.com/events/',
				function(events) {
					inst.setEvents(events);
				}, 'jsonp');
	</script>
</body>
</html>