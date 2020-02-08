<%@ page session="false" %>
<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>
<html>
<head>
<title>SocioGram</title>
<script type="text/javascript">

function PreviewImage() 
{
    var preview = document.querySelector('#photo1');
    var file = document.querySelector('#FileUpload1').files[0];
    var reader = new FileReader();

    reader.onloadend = function () 
    {
        preview.src = reader.result;
    }

    if (file) 
    {
        reader.readAsDataURL(file);
    } else {
        preview.src = "";
    }
}


</script>
</head>

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
									<h3 class="mb-0">Welcome</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
					  <div class="pl-lg-4">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
										
					<form action="FileUpload" enctype="multipart/form-data" method=post>

	<%

     HttpSession ssn =request.getSession(false);
	 String userid=(String)ssn.getAttribute("userid");

	 DatabaseConnection db=new DatabaseConnection();
	 Connection con = db.setConnection();

	 PreparedStatement ps=con.prepareStatement("select * from userinfo where userid=?");
     ps.setInt(1,Integer.parseInt(userid));
     ResultSet res = ps.executeQuery();

     if(res.next())
     {
    	 %>

			<center>
			<h3>Add a photo so other members know who you are.</h3><br/><br/>
	
			<img ID="photo1" height="190" width="238" src="images/usericon.png"/><br/>
			
			<input type="file" ID="FileUpload1" name="FileUpload1" onchange="PreviewImage()"/><br><br><br>

			<button type=submit class="btn btn-block btn-default" >Use this photo</button>
			</center>
			

    	 <%}%>
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
	</div>
</body>
</html>







<footer class="py-5">
<%@ include file="newfooter.jsp"%>
</body>
</html>