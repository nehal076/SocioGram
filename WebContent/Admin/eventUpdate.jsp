<%-- 
    Document   : eventUpdate
    Created on : Jan 18, 2020, 2:58:41 AM
    Author     : harshit
--%>
<%@page import="POJO.ShowEvent"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="POJO.eventShow"%>
<%@page import="Model.db_query"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
      response.setHeader("Cache-Control", "no-cache,no-store");
    response.setHeader("Pragma", "no-cache,no-store");
    int id=Integer.parseInt(request.getParameter("id"));
    try
    {
Connection con=Model.dbConnection.connect();
Statement s=con.createStatement();
    ArrayList<ShowEvent> events=db_query.eventsForUpdate(id);
            Iterator<ShowEvent> iterator=events.iterator();
 
              while (iterator.hasNext()) {
                   ShowEvent sh = iterator.next();

%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Update Event</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Update Event</h2>
  <form  action="../orgEdit">
      <input type="hidden" name="eventid" value="<%=sh.getId()%>">
      <label for="eventname" class="mb-2 mr-sm-2">Contact Name:</label><br>
    <input  type="text" name="cname" value="<%=sh.getContactname()%>" class="form-control mb-2 mr-sm-2">
    
      
      <label for="eventname" class="mb-2 mr-sm-2">Event Name:</label><br>
    <input  type="text" name="etitle" value="<%=sh.getEventtitle()%>" class="form-control mb-2 mr-sm-2">
    
     <label for="eventname" class="mb-2 mr-sm-2">Contact Email:</label><br>
    <input  type="email" name="cemail" value="<%=sh.getContactemail()%>" class="form-control mb-2 mr-sm-2">
    
     <label for="eventname" class="mb-2 mr-sm-2">Contact Num 1:</label><br>
    <input  type="number" name="cnum1" value="<%=sh.getContactnum1()%>" class="form-control mb-2 mr-sm-2">
    
      <label for="eventname" class="mb-2 mr-sm-2">Contact Num2:</label><br>
    <input  type="number" name="cnum2" value="<%=sh.getContactnum2()%>" class="form-control mb-2 mr-sm-2">
    
    <br>
    
    <label for="Start Time" class="mb-2 mr-sm-2">Start Date:</label>
    <input type="date" class="form-control mb-2 mr-sm-2"  name="estartdate" value="<%=sh.getEventstartdate()%>">
    <br>
    
     <label for="pwd2" class="mb-2 mr-sm-2">End Date:</label>
    <input type="date" class="form-control mb-2 mr-sm-2" name="eenddate" value="<%=sh.getEventenddate()%>">
    <br>
    
     <label for="pwd2" class="mb-2 mr-sm-2">Registeration Date:</label>
    <input type="date" class="form-control mb-2 mr-sm-2" name="elastdate" value="<%=sh.getEventregdate()%>">
    <br>
    
    
     <label for="pwd2" class="mb-2 mr-sm-2">Event Venue:</label>
    <input type="text" class="form-control mb-2 mr-sm-2"  name="evenue" value="<%=sh.getEventvenue()%>">
    <br>
    
     <label for="pwd2" class="mb-2 mr-sm-2">website name:</label>
    <input type="text" class="form-control mb-2 mr-sm-2"  name="ewebsite" value="<%=sh.getEventwebsite()%>">
    <br>
    
  
    
    <button type="submit" class="btn btn-primary mb-2">Submit</button>
  </form>
</div>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
