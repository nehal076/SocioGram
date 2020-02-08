
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbConnection {
    public static Connection connect() throws SQLException{
        Connection con=null;
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sociogram?zeroDateTimeBehavior=convertToNull",
                    "root", "nehal");
            
           
        } catch (Exception ex) {
            System.err.println("Erro "+ex.toString());
        }
         return con;
    }
}
