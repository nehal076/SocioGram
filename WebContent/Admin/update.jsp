<%-- 
    Document   : update
    Created on : Jan 16, 2020, 8:49:01 PM
    Author     : harshit
--%>

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
    ArrayList<eventShow> events=db_query.fetch_events_for_update(id);
            Iterator<eventShow> iterator=events.iterator();
 
              while (iterator.hasNext()) {
                   eventShow ev = iterator.next();

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
  <form  action="../editEve">
      <input type="hidden" name="id" value="<%=ev.getEventid()%>">
      <label for="eventname" class="mb-2 mr-sm-2">Event Name:</label><br>
    <input  type="text" name="eventname" value="<%=ev.getEventname()%>" class="form-control mb-2 mr-sm-2">
    

      <label for="eventname" class="mb-2 mr-sm-2">Event Date:</label><br>
    <input  type="date" name="eventdate" value="<%=ev.getEventdate()%>" class="form-control mb-2 mr-sm-2">
    
    <br>
    
    <label for="Start Time" class="mb-2 mr-sm-2">Start Time:</label>
    <input type="time" class="form-control mb-2 mr-sm-2"  name="startTime" value="<%=ev.getStarttime()%>">
    <br>
    
     <label for="pwd2" class="mb-2 mr-sm-2">End Time:</label>
    <input type="time" class="form-control mb-2 mr-sm-2" name="endTime" value="<%=ev.getEndtime()%>">
    <br>
    
     <label for="pwd2" class="mb-2 mr-sm-2">Date Created:</label>
    <input type="text" class="form-control mb-2 mr-sm-2"  name="datecreated" value="<%=ev.getDatecreated()%>" readonly>
    <br>
    
    <label for="pwd2" class="mb-2 mr-sm-2">Activity:</label>
    <input type="text" class="form-control mb-2 mr-sm-2"  name="activitystatus" value="<%=ev.getActivitystatus() %>">
    <br>
    
     <label for="pwd2" class="mb-2 mr-sm-2">Event Venue:</label>
    <input type="text" class="form-control mb-2 mr-sm-2"  name="eventvenue" value="<%=ev.getVenue()%>">
    <br>
    
     <label for="pwd2" class="mb-2 mr-sm-2">City name:</label>
    <input type="text" class="form-control mb-2 mr-sm-2"  name="eventcity" value="<%=ev.getCity() %>">
    <br>
    
     <label for="pwd2" class="mb-2 mr-sm-2">Event State:</label>
    <input type="text" class="form-control mb-2 mr-sm-2"  name="eventstate" value="<%=ev.getState() %>">
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