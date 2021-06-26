package sociogram;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class CreateGroup
 */
@WebServlet("/CreateGroup")
@MultipartConfig(maxFileSize = 16177215)
public class CreateGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateGroup() {
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
			String groupName = request.getParameter("groupName");
			String groupInterest = request.getParameter("groupInterest");
			Part filePart = request.getPart("groupphoto");
			InputStream inputStream = null;
		
		try {
			
			PreparedStatement ps;
			
	        DatabaseConnection db = new DatabaseConnection();
	        Connection con = db.setConnection();
	        
	        if (filePart != null) 
            {
                inputStream = filePart.getInputStream();
            }
	        
	        ps=con.prepareStatement("insert into sociogram.groups(groupid,groupname,creatorid,groupphoto,intid,location,permission) values(?,?,?,?,?,?,?)");
	        ps.setString(1, "0");
	        ps.setString(2, groupName);				  //groupname
	        ps.setString(3, userid);				 //creatorid
	        if(inputStream != null)
	        	ps.setBlob(4, inputStream);			 //groupphoto
	        ps.setString(5, groupInterest);  		//intid
	        ps.setString(6,"India");				//location
	        ps.setString(7, "Not Allowed");
	        
	        
	        int row = ps.executeUpdate();
	        if(row > 0)
            {
                System.out.println("Group Sucessfully Created : "+groupName);
                response.sendRedirect("home.jsp?Message=groupreq");
            }
            else
            {
            	System.out.println("Group Create Error for : "+groupName);
            	response.sendRedirect("home.jsp?Message=fail");
            }
	        
	        
		}
		catch(SQLException e)
		{
			System.out.println("sql alert[CreateGroup] : "+e.getMessage()+"\n");
			e.printStackTrace();
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
