package sociogram;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FetchData
 */
@WebServlet("/FetchData")
public class FetchData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchData() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	  PreparedStatement pc = null;
	  try 
      {
			
	    if(request.getParameter("state")!=null)
	    {
	        String State = request.getParameter("state");
	        
	        DatabaseConnection db = new DatabaseConnection();
	        Connection cn=db.setConnection();
	        
	       pc = cn.prepareStatement("select * from location where city_state=? order by city_name");
				pc.setString(1, State);
				System.out.println(pc);
				ResultSet rc = pc.executeQuery();
				while (rc.next()) {
	                
	                String val = rc.getString("city_name");
	                response.getWriter().write(val+"+");
	                System.out.println(val);
				}
	    }
	    
	    if(request.getParameter("groupid")!=null)
	    {
	        String groupid = request.getParameter("groupid");
	        
	        DatabaseConnection db = new DatabaseConnection();
	        Connection cn=db.setConnection();
	        
	       pc = cn.prepareStatement("select intid from groups where groupid=?");
				pc.setString(1, groupid);
				System.out.println(pc);
				ResultSet rc = pc.executeQuery();
				if (rc.next()) {
					
					 pc = cn.prepareStatement("select * from topics where intid=?");
				     pc.setString(1, rc.getString("intid"));
				     System.out.println(pc);
				     rc = pc.executeQuery();
	                
				     while (rc.next())
				     {
				    	 String val = rc.getString("topics");
				         response.getWriter().write(val+"+");
				    	 System.out.println(val);
				     }
				}
	    }
        } catch (SQLException e) 
        {
			System.out.println("sql alert[FetchData]"+e.getMessage());
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
