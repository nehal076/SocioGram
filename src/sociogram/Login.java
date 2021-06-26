package sociogram;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() 
    {
        super();
    }

    public static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession ssn=request.getSession(false);
		/*String uans_captcha= request.getParameter("uans_captcha");
		String captchAns=(String)ssn.getAttribute("captcha_Ans");
		System.out.println("Captch Ans "+captchAns);*/
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();  
		System.out.println(dtf.format(now)); 
		
		//if(captchAns.equals(uans_captcha)) 
		//{
			String email=request.getParameter("email");
			String password=request.getParameter("passwordLogin");
			
			try
		    {	
			    DatabaseConnection db=new DatabaseConnection();
				Connection cn = db.setConnection();

				PreparedStatement pst=cn.prepareStatement("select * from user where email=? and password=?");
					
				pst.setString(1, email);
				pst.setString(2, password);
					
				ResultSet rst=pst.executeQuery();
				
						
				if(rst.next())
				{
					String userid=rst.getString("userid");

			        ssn=request.getSession();
					    
				    ssn.setAttribute("userid", userid);
				    
				    
				     //* Updating userlogin
				     
					pst=cn.prepareStatement("insert into userlogin values(?,?)");
					pst.setString(1, userid);
					pst.setString(2, dtf.format(now));
					pst.executeUpdate();
					
					/*Rewards*/
					PreparedStatement psreward = cn.prepareStatement("select max(login) from userlogin where userid=?");
					psreward.setString(1, userid);
					ResultSet rsreward = psreward.executeQuery();
					if(rsreward.next())
					{
						if(rsreward.getDate(1)!=null)
						{
							if(!(new Date().equals(rsreward.getDate(1))))
							{
								psreward = cn.prepareStatement("update userinfo set rewards = rewards + ? where userid=?");
								psreward.setInt(1, 100);
								psreward.setString(2, userid);
								psreward.executeUpdate();
								System.out.println("Daily Login Reward Added : "+psreward);
							}
							
						}
					}
					
					
					
					/* End Rewards--*/
					
					
					PreparedStatement psfirst=cn.prepareStatement("select firstlogin from user where userid=?");
					psfirst.setString(1, userid);
					ResultSet rsfirst = psfirst.executeQuery();
					rsfirst.next();
					
					if(rsfirst.getBoolean("firstlogin")==true)
					{
						
						psfirst=cn.prepareStatement("update user set firstlogin=? where userid=?");
						psfirst.setBoolean(1, false);
						psfirst.setString(2, userid);
						psfirst.executeUpdate();
						System.out.println(psfirst);
						response.sendRedirect("welcome.jsp");
					}
					else
					{
						response.sendRedirect("home.jsp");
					}
					
					
					
					
					System.out.println("login successful");
					System.out.println("userid @ Login : "+userid);

						 
				}
				else
				{     
				    response.sendRedirect("index.jsp?Message=LoginFailed");
					
				}
		     }
			 catch(SQLException e)
			 {
				 System.out.println("sql alert - "+e.getMessage()+"\n");
			 }
		/*}
		else {

			response.sendRedirect("index.jsp?Message=CaptchaFail");
		}*/
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
