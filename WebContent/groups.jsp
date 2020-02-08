<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>

 
<%! ResultSet rst=null,rsg=null, rsl=null;
  PreparedStatement pst=null, psg=null, psl=null; %>

<%@ page session="false" %>

<%


HttpSession ssn = request.getSession(false);
String userid=(String)ssn.getAttribute("userid");

DatabaseConnection db=new DatabaseConnection();
Connection cn = db.setConnection();



%>

<html>
<head>
<title>SocioGram</title>
<head>

</head>

<body>

<center>






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
						
						<div class="card-body">
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
										<form action=events.jsp>
										<h1>Find a group to join</h1>

	<% 
	 System.out.println("userid @ groups : "+userid);
	
	String topics[]=request.getParameterValues("topics");
	
	try
	{
		

		pst=cn.prepareStatement("insert into usertopic (topicid,userid) values(?,?)");

		for(String s : topics)
		{
			pst.setInt(1, Integer.parseInt(s));
			pst.setInt(2, Integer.parseInt(userid));
			pst.executeUpdate();
		}
		

		
		psl=cn.prepareStatement("select city from userinfo where userid=?");
		
		psl.setInt(1,Integer.parseInt(userid));
		rsl=psl.executeQuery();
		/*rsl.next();
		String location=rsl.getString(1);*/

		
		
		
		psg=cn.prepareStatement("select * from groups where intid in (select distinct(intid) from userinterest where userid=?);");
		psg.setInt(1,Integer.parseInt(userid));
		
		rsg=psg.executeQuery();

		
		%>
		
		<div class="container">
		
		<%
		
	    while(rsg.next())
	    {
	    %>
			
			<div class="col-lg-4 col-md-4 text-center" style="float:left">
			   <% Blob blob=rsg.getBlob("groupphoto"); %>
	   	    	<img src="data:image/gif;base64,<%=db.blobProcess(blob)%>" class="img-Thumbnail">
	   	    	<h5 class ="blog-title card-title mb-2">
					<input type=checkbox id="groups" name="groups" value=<%=rsg.getString("groupid")%> > <%=rsg.getString("groupname")%> </input>
				</h5>
			</div>
		<%
		}
		
		%>
		 
		 </div>
		 
		 <input type=submit value="Next"></a>
		<%


	%>

	<%
	}
    catch(SQLException e)
    {
         System.out.println("sql alert[groups] - "+e.getMessage()+"\n");
    }
    %>
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


