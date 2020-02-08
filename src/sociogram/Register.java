package sociogram;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
@MultipartConfig(maxFileSize = 16177215) // Upload file size up to 16MB
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String userid="";
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		//String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		//String dob=request.getParameter("dob");
		/*Part filePart = request.getPart("FileUpload1");
		System.out.println("filepart : "+filePart);
		InputStream inputStream = null;*/
		

		try
		{
			DatabaseConnection db = new DatabaseConnection();
			Connection cn = db.setConnection();
			
	        PreparedStatement pst = cn.prepareStatement("insert into user(fname,lname,email,password,firstlogin) values(?,?,?,?,?);");

	        pst.setString(1, fname);
	        pst.setString(2, lname);
	        pst.setString(3, email);
	        pst.setString(4, password);
	        /*if (filePart.getSize()>0) 
	        {
				inputStream = filePart.getInputStream();
				if (inputStream != null) 
				{
					pst.setBlob(6, inputStream);
				}
			}
			else if(filePart.getSize()<=0)
			{
				pst.setBlob(6, inputStream);
				pst.executeUpdate();
				System.out.println("no file selected.");
				
			}*/
	        pst.setBoolean(5,true);
	        
	        System.out.println(pst);        
	        pst.executeUpdate();
	        
	        
	        PreparedStatement tmp = cn.prepareStatement("select * from user order by userid desc limit 1");
	        ResultSet tmprs = tmp.executeQuery();
	        while(tmprs.next())
	        {
	        	userid = tmprs.getString("userid");
	        }
	        
	        
	        
	        PreparedStatement psuserinfo = cn.prepareStatement("insert into userinfo(userid,fname,lname,email,password) values(?,?,?,?,?)");
	        psuserinfo.setString(1, userid);
	        psuserinfo.setString(2, fname);
	        psuserinfo.setString(3, lname);
	        psuserinfo.setString(4, email);
	        psuserinfo.setString(5, password);
	        psuserinfo.executeUpdate();
	        
	        response.sendRedirect("index.jsp?Message=Registered");
		               
		 }
		 catch(SQLException e)
		 {
         System.out.println("sql alert[Register] - "+e.getMessage()+"\n");
         response.sendRedirect("index.jsp?Message=RegisterFail");
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
