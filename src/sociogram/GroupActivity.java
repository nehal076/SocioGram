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
 * Servlet implementation class GroupActivity
 */
@WebServlet("/GroupActivity")
public class GroupActivity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupActivity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String groupid = request.getParameter("groupid");
		
		HttpSession ssn=request.getSession(false);
		String userid=(String) ssn.getAttribute("userid");
		
		try
		{
			if(groupid!=null)
			{
				
				DatabaseConnection db = new DatabaseConnection();
		        Connection con = db.setConnection();
		        PreparedStatement ps;
		       
		        ps= con.prepareStatement("insert into usergroups values (?,?)");
		        ps.setString(1, userid);
		        ps.setString(2, groupid);
		       
		        
		        
		        ps.executeUpdate();
		        
			}
			response.sendRedirect("groupinfo.jsp?Message=done&groupid="+groupid);
		}catch(SQLException sqlex){
            
            sqlex.printStackTrace();
            response.sendRedirect("groupinfo.jsp?Message=fail&groupid="+groupid);
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
