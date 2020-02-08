package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import POJO.*;
import java.sql.Time;


public class db_query {
        public static void main(String[] args) throws SQLException {
     
    }
     public static boolean fetch_login_user(String email, String password) throws SQLException {
        
         Connection con=dbConnection.connect();
         
         System.out.println("connected");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE username= ? and password= ?");
        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet set = ps.executeQuery();

        if (set != null) 
        {
            if (set.next()) {
                return true;
                } else{ 
                    return false;
                }
        }
        return true;
        }
    
    public static int countUser() throws SQLException
    {
        System.out.println("hii");
        int rowCount=-1;
         Connection con=dbConnection.connect();
        Statement s=con.createStatement();
        String sql="Select count(*) from user";
        ResultSet rs=s.executeQuery(sql);
            rs.next();
            rowCount=rs.getInt(1);
            System.out.println(rowCount);
            return rowCount;
            
        
    }
     public static ArrayList<ShowUsers> fetch_users() throws SQLException, ClassNotFoundException 
     {          
            Connection con=dbConnection.connect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM userinfo");
           
            ResultSet rs = ps.executeQuery();
            ArrayList<ShowUsers> users = new ArrayList<>();
            
            if (rs != null) 
            {
                while (rs.next())
                {
                    System.err.println("XXXXXXXXXXXXXx");
                    ShowUsers user = new ShowUsers(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString("email"), rs.getString(6),rs.getString(7),rs.getString(14));
                    users.add(user);
                }
            }
            return users;
        }
     
      public static boolean update_user(int id,String fname,String lname,String dob,String location) throws SQLException {
        int n;
        {
         Connection con=dbConnection.connect();
        PreparedStatement ps = con.prepareStatement("UPDATE USERINFO SET fname=?  ,dob=? ,city=?,lname=? WHERE userid=?");
        ps.setString(1, fname);
       
        ps.setString(2, dob);
        ps.setString(3, location);
        ps.setString(4, lname);
          ps.setInt(5, id);
        n = ps.executeUpdate();
        System.err.println(n);
        return n > 0;
    }
     
      }
      
        public static boolean delete_user(int id) throws SQLException {
       
        {
         Connection con=dbConnection.connect();
        PreparedStatement ps = con.prepareStatement("DELETE FROM USER WHERE userid=?");
        ps.setInt(1, id);
       int n=ps.executeUpdate();
       return n > 0;
    }
     
      }
      public static boolean createEvent(String cname,String cemail,long cmob1,long cmob2,
              String etitle,String edesc,Date estartdate,Date eenddate,Date elastdate,
            String evenue,String ewebsite) throws SQLException {

        Connection con=dbConnection.connect();
        System.out.print("yess");
        PreparedStatement ps = con.prepareCall("INSERT INTO createevent(contactname,contactemail,contactnum1,"
                + "contactnum2,eventtitle,eventdesc,eventstartdate,eventenddate,"
                + "eventregdate,eventvenue,eventwebsite,eventstatus) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
        
       ps.setString(1, cname);
       ps.setString(2, cemail);
       ps.setLong(3, cmob1);
     ps.setLong(4, cmob2);
     ps.setString(5, etitle);
     ps.setString(6, edesc);
      ps.setDate(7,estartdate);
      ps.setDate(8, eenddate);
      ps.setDate(9, elastdate);
    ps.setString(10,evenue);
    ps.setString(11, ewebsite);
    ps.setString(12, "Deactivate");
       
        int e = ps.executeUpdate();
        System.out.println("insert");
        return e>0;
    }

       public static ArrayList<ShowEvent> fetch_events() throws SQLException, ClassNotFoundException 
        {   
              Connection con=dbConnection.connect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM createevent");
           
            ResultSet rs = ps.executeQuery();
            ArrayList<ShowEvent> events = new ArrayList<>();
            
            if (rs != null) 
            {
                while (rs.next())
                {
                    System.err.println("XXXXXXXXXXXXXx");
                    ShowEvent event = new ShowEvent(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getLong(4),rs.getLong(5),
                    rs.getString(6),rs.getString(7),rs.getDate(8),rs.getDate(9),rs.getDate(10),rs.getString(11),
                    rs.getString(12),rs.getString(13));
                    events.add(event);
                }
            }
            return events;
        }
       
       
        public static ArrayList<ShowEvent> eventsForUpdate(int id) throws SQLException, ClassNotFoundException 
        {   
              Connection con=dbConnection.connect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM createevent where id=?");
           ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            ArrayList<ShowEvent> events = new ArrayList<>();
            
            if (rs != null) 
            {
                while (rs.next())
                {
                    System.err.println("XXXXXXXXXXXXXx");
                    ShowEvent event = new ShowEvent(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getLong(4),rs.getLong(5),
                    rs.getString(6),rs.getString(7),rs.getDate(8),rs.getDate(9),rs.getDate(10),rs.getString(11),
                    rs.getString(12),rs.getString(13));
                    events.add(event);
                }
            }
            return events;
        }
       
         public static boolean updateEvent(int id,String cname,String cemail,long cmob1,long cmob2,
              String etitle,Date estartdate,Date eenddate,Date elastdate,
            String evenue,String ewebsite) throws SQLException {

        Connection con=dbConnection.connect();
        System.out.print("yess");
        PreparedStatement ps = con.prepareCall("update  createevent set contactname=?,contactemail=?,contactnum1=?,"
                + "contactnum2=?,eventtitle=?,eventstartdate=?,eventenddate=?,"
                + "eventregdate=?,eventvenue=?,eventwebsite=? where id=?");
        
     ps.setString(1, cname);
     ps.setString(2, cemail);
     ps.setLong(3, cmob1);
     ps.setLong(4, cmob2);
     ps.setString(5, etitle);
   
      ps.setDate(6,estartdate);
      ps.setDate(7, eenddate);
      ps.setDate(8, elastdate);
    ps.setString(9,evenue);
    ps.setString(10, ewebsite);
  ps.setInt(11, id);
  
        int e = ps.executeUpdate();
        System.out.println("update");
        return e>0;
    }
        
          public static boolean orgDeleteEvent(int id) throws SQLException {
       
        {
         Connection con=dbConnection.connect();
        PreparedStatement ps = con.prepareStatement("DELETE FROM createevent WHERE id=?");
        ps.setInt(1, id);
       int n=ps.executeUpdate();
       return n > 0;
    }
        }
        public static ArrayList<eventShow> fetch_user_events() throws SQLException, ClassNotFoundException 
        {   
              Connection con=dbConnection.connect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM events");
           
            ResultSet rs = ps.executeQuery();
            ArrayList<eventShow> events = new ArrayList<>();
            
            if (rs != null) 
            {
                while (rs.next())
                {
                    System.err.println("XXXXXXXXXXXXXx");
                    eventShow event = new eventShow(rs.getInt(1),rs.getString(2),rs.getInt(4),rs.getInt(5),
                    rs.getDate(6),rs.getTime(7),rs.getTime(8),rs.getString(9),rs.getString(10),rs.getString(11),
                    rs.getString(12),rs.getString(13));
                    events.add(event);
                }
            }
            return events;
        }
        
        
         public static ArrayList<eventShow> fetch_events_for_update(int id) throws SQLException, ClassNotFoundException 
        {   
              Connection con=dbConnection.connect();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM events where eventid=?");
           
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            ArrayList<eventShow> events = new ArrayList<>();
            
            if (rs != null) 
            {
                while (rs.next())
                {
                    
                    eventShow event = new eventShow(rs.getInt(1),rs.getString(2),rs.getInt(4),rs.getInt(5),
                    rs.getDate(6),rs.getTime(7),rs.getTime(8),rs.getString(9),rs.getString(10),rs.getString(11),
                    rs.getString(12),rs.getString(13));
                    events.add(event);
                }
            }
            return events;
        }
        public static boolean delete_event(int id) throws SQLException {
       
        {
         Connection con=dbConnection.connect();
        PreparedStatement ps = con.prepareStatement("DELETE FROM events WHERE eventid=?");
        ps.setInt(1, id);
       int n=ps.executeUpdate();
       return n > 0;
    }
        }
       public static ArrayList<showLoginUser> fetch_loginUser() throws SQLException
       {
            Connection con=dbConnection.connect();
           PreparedStatement ps = con.prepareStatement("SELECT user.fname,user.lname,userlogin.login,user.email from user INNER JOIN userlogin ON user.userid=userlogin.userid");
            ResultSet rs = ps.executeQuery();
             ArrayList<showLoginUser> loginuser = new ArrayList<>();
            
            if (rs != null) 
            {
                while (rs.next())
                {
                    showLoginUser user = new showLoginUser(rs.getString(1), rs.getString(2), rs.getTimestamp(3), rs.getString(4));
                    loginuser.add(user);
                }
            }
            return loginuser;
       }
       
        public static boolean update_userEvent(int id,String eventname,Date eventdate,Time startTime,Time endTime,String datecreated,String activitystatus,String eventVenue,String eventCity,String eventState) throws SQLException {
        int n;
        {
         Connection con=dbConnection.connect();
        PreparedStatement ps = con.prepareStatement("UPDATE events SET eventname=? ,eventdate=? ,startTime=? ,endTime=?,datecreated=?,activitystatus=?,eventvenue=?,eventcity=?,eventstate=? WHERE eventid=?");
        ps.setString(1, eventname);
        ps.setDate(2,eventdate) ;
        ps.setTime(3, startTime);
        ps.setTime(4, endTime);
        ps.setString(5, datecreated);
        ps.setString(6, activitystatus);
        ps.setString(7, eventVenue);
        ps.setString(8, eventCity);
        ps.setString(9, eventState);
        ps.setInt(10, id);
        
        n = ps.executeUpdate();
        System.err.println(n);
        return n > 0;
    }
     
      }
       
         public static ArrayList<showGroups> fetch_userGroups() throws SQLException
       {
            Connection con=dbConnection.connect();
            
           PreparedStatement ps = con.prepareStatement("SELECT groups.groupid,groups.groupname,groups.creatorid,groups.location,groups.permission,user.fname from groups INNER JOIN user ON user.userid=groups.creatorid");
            ResultSet rs = ps.executeQuery();
             ArrayList<showGroups> groups = new ArrayList<>();
            
            if (rs != null) 
            {
                while (rs.next())
                {
                    showGroups group = new showGroups(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4),rs.getString(5),rs.getString(6));
                    groups.add(group);
                }
            }
            return groups;
       }
         public static boolean update_Permission(int id,int i) throws SQLException {
        int n;
        
         Connection con=dbConnection.connect();
        PreparedStatement ps = con.prepareStatement("UPDATE groups SET Permission=? WHERE groupid=?");
       if(i==1)
           ps.setString(1, "Allowed");
       else
           ps.setString(1, "Not Allowed");

        ps.setInt(2, id);
        
        n = ps.executeUpdate();
        System.err.println(n);
        return n > 0;
    }     
            
         public static boolean eventDeactivate(int id) throws SQLException {
        int n;
        
         Connection con=dbConnection.connect();
        PreparedStatement ps = con.prepareStatement("UPDATE createevent SET eventstatus=? WHERE id=?");
        ps.setString(1, "Deactivate");
        ps.setInt(2, id);
        
        n = ps.executeUpdate();
        System.err.println(n);
        return n > 0;  
         }
         
          public static boolean eventActivate(int id) throws SQLException {
        int n;
        
         Connection con=dbConnection.connect();
        PreparedStatement ps = con.prepareStatement("UPDATE createevent SET eventstatus=? WHERE id=?");
        ps.setString(1, "Activate");
        ps.setInt(2, id);
        
        n = ps.executeUpdate();
        System.err.println(n);
        return n > 0;  
         }
}
