<%@ page import="java.sql.*, sociogram.DatabaseConnection"%>

<%@ page session="false" %>  

<%! ResultSet rst=null,rsi=null,rsiUpd=null;
  PreparedStatement pst=null,psi=null,psiUpd=null; %>
  
  
<%
HttpSession ssn = request.getSession(false);
String userid=(String)ssn.getAttribute("userid");

DatabaseConnection db=new DatabaseConnection();
Connection cn = db.setConnection();
%>

<html>
<head>
<title>SocioGram</title>
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
						
						<div class="card-body">
							<div class="pl-lg-4">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
										
										<center>

	<form action=groups.jsp>
	<font face=arial size=5>Narrow It Down</font><br><br>
    <%

	 
	 System.out.println("userid @ topics : "+userid);
    
    String interests[]=request.getParameterValues("interests");
    
    try
	{

		pst = cn.prepareStatement("select topicid,topics,intid from topics where intid=?");
		psi = cn.prepareStatement("select interests from interests where intid=?");
		psiUpd = cn.prepareStatement("insert into userinterest (intid,userid) values(?,?)");

		

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
    }
    catch(SQLException e)
    {
         System.out.println("sql alert[topics] - "+e.getMessage()+"\n");
    }%>

</form>
</center>
										
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



<%@ include file="newfooter.jsp" %>
</html>
