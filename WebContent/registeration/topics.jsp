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

<%! ResultSet rst=null,rsi=null,rsiUpd=null;
  PreparedStatement pst=null,psi=null,psiUpd=null; %>
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
			                            <li><a href="#about" >About</a></li>
			                            <li><a href="#interests1" data-toggle="tab">Interests</a></li>
			                           	<li><a href="#topics" >Topics</a></li>
			                            <li><a href="#address">Address</a></li>
			                        </ul>
								</div>
								
								<div class="tab-pane" id="topics">
		                              <div class="row">
		                                	<h4 class="info-text"> Now Narrow It Down</h4>
		                                	<script>
		                                	

												for(var i=0; i<array.length; i++){
													$('input[type="checkbox"][value="' + array[i] +'"]');
												}
		                            
		                                	</script>	
		                            	</div>
		                            </div>


    <%

	 
	 System.out.println("userid @ topics : "+userid);
    
    String interests[]=request.getParameterValues("interests");
    
		pst = cn.prepareStatement("select topicid,topics,intid from topics where intid=?");
		psi = cn.prepareStatement("select interests from interests where intid=?");
		psiUpd = cn.prepareStatement("insert into userinterests (intid,userid) values(?,?)");

		

        for(String s : interests)
        {
        	System.out.print(s+",");
        	psi.setInt(1, Integer.parseInt(s));
        	rsi=psi.executeQuery();
        	rsi.next();
        	
        	pst.setInt(1, Integer.parseInt(s));
        	rst=pst.executeQuery();
        	
        	psiUpd.setInt(1, Integer.parseInt(s));
        	psiUpd.setInt(2, Integer.parseInt(userid));
        	psiUpd.executeUpdate();
        	System.out.println(psiUpd);

        	%>
       		<font face=arial size=4><u><%=rsi.getString(1)%><br></u></font>
       		<div class="container">
        	<%

        	while(rst.next())
    		{
    		%><p>
    			<div class="checklist">
    			<input type="checkbox" id="topics" name="topics" value=<%=rst.getString("topicid")%>><%=rst.getString("topics")%></input>
    			</div>
              </p>
        	<%
        	}
        }
        %>
        
        	</div>
        	
        	<input type=submit value='Next'>
        <%
    %>

</div>
		                        <div class="wizard-footer">
		                            <div class="pull-right">
		                                <input type='button' class='btn btn-next btn-fill btn-success btn-wd' name='next' value='Next' />
		                                <input type='button' class='btn btn-finish btn-fill btn-success btn-wd' name='finish' value='Finish' />
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
			System.out.println("sql alert[registration - topics] - " + e.getMessage() + "\n");
		}
		%>
	<!--   Core JS Files   -->
    <script src="assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery.bootstrap.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="assets/js/material-bootstrap-wizard.js"></script>

    <!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="assets/js/jquery.validate.min.js"></script>

</html>
