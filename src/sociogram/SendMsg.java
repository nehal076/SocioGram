package sociogram;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SendMsg
 */
@WebServlet("/SendMsg")
public class SendMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMsg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msgTitle = request.getParameter("txttitle");
        String msgBody = request.getParameter("areabody");
        String receiver =request.getParameter("receiver");
        HttpSession ssn = request.getSession(false);
		String userid = (String) ssn.getAttribute("userid");
        TimeZone.setDefault(TimeZone.getTimeZone("IST"));
        String dt=  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
        DatabaseConnection db = new DatabaseConnection();
        Connection con;
        PreparedStatement ps;
        String query;
        
            try{
            query = "INSERT INTO messaging(dateTime, title, body, delivered, receiver, sender) VALUES(?,?,?,?,?,?)";
            con = db.setConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, dt);
            ps.setString(2, msgTitle);
            ps.setString(3, msgBody);
            ps.setBoolean(4, false);
            ps.setInt(5, Integer.parseInt(receiver));
            ps.setInt(6, Integer.parseInt(userid));
            ps.execute();
            //saved to DB success 
                response.sendRedirect("messaging.jsp?sent=yes&userid="+receiver);
           
            }catch(SQLException sqlex){
                
                sqlex.printStackTrace();
                response.sendRedirect("messaging.jsp?sent=no&userid="+receiver);
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
