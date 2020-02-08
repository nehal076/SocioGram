package sociogram;

import java.io.*;
import java.sql.*;
import java.util.Base64;

public class DatabaseConnection 
{
	private final String DB = "sociogram";
    private final String USRNAME = "root";
    private final String PASSWORD = "nehal";

    public Connection conn;
    public PreparedStatement pst;
    public ResultSet resultset;

    public DatabaseConnection(){}

	public Connection setConnection() 
    {
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/" + DB, USRNAME, PASSWORD);
        } 
        catch (ClassNotFoundException e) 
        {
            System.err.println("sql alert[DatabaseConnection] : " + e.getMessage());
        } 
        catch (SQLException e) 
        {
            System.err.println("Set Connection Error : " + e.getMessage());
        } 
        finally 
        {
            return conn;
        }
    }

    public int writeResultset(PreparedStatement pst) 
    {

        this.pst = pst;
        int ra = 0;
        try 
        {
            ra = pst.executeUpdate();
            if (ra != 0) 
            {
               System.err.println("Done");
            }
        } 
        catch (SQLException ex) 
        {
        	System.err.println("Error in writing result : " + ex.getMessage());
        }
        System.err.println("Row(s) Affected : " + ra);
        return ra;
    }

    public ResultSet getResultset(PreparedStatement pst) 
    {
        this.pst = pst;

        try 
        {
            resultset = pst.executeQuery();
        } 
        catch (SQLException ex) 
        {
            System.err.println("Error in writing result : " + ex.getMessage());
        }
        return resultset;
    }
    
    public String blobProcess(Blob blob) throws SQLException, IOException{
        
        String imgurl="";
        InputStream inputStream= blob.getBinaryStream();
        if(inputStream.available()<=0) 
        	inputStream = new FileInputStream("images\\usericon.png");
        
        ByteArrayOutputStream arrayOutputStream=new ByteArrayOutputStream();
        byte [] buffer=new byte[4096];
        int bytesRead=-1;
        while((bytesRead=inputStream.read(buffer)) != -1)
            arrayOutputStream.write(buffer, 0, bytesRead);
        
        byte [] bytes=arrayOutputStream.toByteArray();
        imgurl=Base64.getEncoder().encodeToString(bytes);
        
        /***
         * shortcut way
         *
        bytes=blob.getBytes(1, (int) blob.length());
        imgurl=Base64.getEncoder().encodeToString(bytes);
        * 
        */
        inputStream.close();
        arrayOutputStream.close();
        return imgurl;       
    }
}
