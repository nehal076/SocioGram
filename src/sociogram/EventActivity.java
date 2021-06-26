package sociogram;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EventActivity
 */
@WebServlet("/EventActivity")
public class EventActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventActivity() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession ssn=request.getSession(false);
		String userid=(String) ssn.getAttribute("userid");
		String eventid = request.getParameter("eventid");
		
		
		try
		{
			if(eventid!=null)
			{
				
				DatabaseConnection db = new DatabaseConnection();
		        Connection con = db.setConnection();
		        PreparedStatement ps;
		       
		        ps= con.prepareStatement("insert into sociogram.userevents values (?,?,?)");
		        ps.setString(1, eventid);
		        ps.setString(2, "Going");
		        ps.setString(3, userid);
		        
		        
		        ps.executeUpdate();
		        
			}
			response.sendRedirect("eventinfo.jsp?Message=done&eventid="+eventid);
		}catch(SQLException sqlex){
            
            sqlex.printStackTrace();
            response.sendRedirect("eventinfo.jsp?Message=fail&eventid="+eventid);
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
