package sociogram;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class CreateEvent
 */
@WebServlet("/CreateEvent")
@MultipartConfig(maxFileSize = 16177215)
public class CreateEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession ssn=request.getSession(false);
		if(ssn==null)
        {
        	response.getWriter().println("session is null ok?");
        }
        else
        {	
        	String userid=(String) ssn.getAttribute("userid");

    		String eventName = request.getParameter("eventName");
    		String eventDateStr = request.getParameter("eventDate");
    		String eventGroup = request.getParameter("eventGroup");
    		String startTime = request.getParameter("startTime");
    		String endTime = request.getParameter("endTime");
    		String eventVenue = request.getParameter("eventVenue");
    		String eventDesc = request.getParameter("eventDesc");
    		String state = request.getParameter("state");
    		String city = request.getParameter("city");
    				
    		Part filePart = request.getPart("eventphoto");
    		InputStream inputStream = null;
    		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy"); // HH:mm:ss
    		java.util.Date date = new java.util.Date();
    		
		try {
				java.util.Date eventDate = formatter.parse(eventDateStr);
				
		try {
			
			PreparedStatement ps;
			ResultSet res;
	        DatabaseConnection db = new DatabaseConnection();
	        Connection con = db.setConnection();
	        int activitystatus=0;
	        if (filePart != null) 
            {
                inputStream = filePart.getInputStream();
            }
	        
	        ps=con.prepareStatement("insert into events values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	        ps.setString(1, "0");
	        ps.setString(2, eventName);				  //eventname
	        if(inputStream != null)
	        	ps.setBlob(3, inputStream);			  //eventphoto
	        ps.setInt(4, Integer.parseInt(userid));   //creatorid
	        ps.setInt(5, Integer.parseInt(eventGroup)); //groupid
	        ps.setString(6, eventDateStr);				//eventdate
	        ps.setString(7, startTime);                 //stateTime
	        ps.setString(8, endTime);                  //endTime
	        ps.setString(9, formatter.format(date));	//datecreated
	        if(eventDate.after(date) || eventDate.equals(date))
	        {
	        	activitystatus=1;
	        }
	        
	        ps.setInt(10, activitystatus);			//activitystatus
	        ps.setString(11, eventVenue);			//eventvenue
	        ps.setString(12, city);					//eventcity
	        ps.setString(13, state);					//eventstate
	        ps.setString(14, eventDesc);  				//description
	        
	        
	        int row = ps.executeUpdate();
	        if(row > 0)
            {
                System.out.println("Event Sucessfully Created : "+eventName);
                response.sendRedirect("home.jsp?Message=done");
            }
            else
            {
            	System.out.println("Event Create Error");
            	response.sendRedirect("home.jsp?Message=fail");
            }
	        
	        
		}
		catch(SQLException e)
		{
			System.out.println("sql alert[CreateEvent] : "+e.getMessage()+"\n");
			e.printStackTrace();
			response.sendRedirect("home.jsp?Message=fail");
		}
		} catch (ParseException e1) {

			System.out.println("parse alert[CreateEvent] : "+e1.getMessage()+"\n");
				
			e1.printStackTrace();
			response.sendRedirect("home.jsp?Message=fail");
		}
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
