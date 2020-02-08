package sociogram;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Base64;

/**
 * Servlet implementation class FileUpload
 */
@WebServlet("/FileUpload")
@MultipartConfig(maxFileSize = 16177215) // Upload file size up to 16MB
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FileUpload() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession ssn = request.getSession(false);

		response.setContentType("text/html;charset=UTF-8");

		if (ssn == null) {
			response.getWriter().println("session is null ok?");
		} else {
			String userid = (String) ssn.getAttribute("userid");
			System.out.println("userid @ FileUpload : " + userid);
			Part filePart = request.getPart("FileUpload1");
			System.out.println("file part value : "+filePart);
			InputStream inputStream = null;
			PreparedStatement ps;
			String query = "";
			DatabaseConnection dbh = new DatabaseConnection();
			Connection con;
			String message;

			try {
				if (filePart.getSize()>0) {
					inputStream = filePart.getInputStream();

					query = "update userinfo set profilepic=? where userid=?";
					con = dbh.setConnection();

					ps = con.prepareStatement(query);
					if (inputStream != null) {

						ps.setInt(2, Integer.parseInt(userid));
						ps.setBlob(1, inputStream);
					}
					int row = ps.executeUpdate();
					if (row > 0) {
						System.out.println("Image Uploaded and saved into DB.");
						response.sendRedirect("interests.jsp");
					}

					else
						System.out.println("Image Upload Failed");
				}
				else if(filePart.getSize()<=0)
				{
					System.out.println("no file selected.");
					response.sendRedirect("interests.jsp");
				}
			} catch (SQLException sqe) {
				message = "Error:" + sqe.getMessage();
				sqe.printStackTrace();
			
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
