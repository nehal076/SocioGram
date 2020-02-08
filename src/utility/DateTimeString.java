
package utility;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.sql.Date;


public class DateTimeString {
    
    public static String getString()
    {
        String dateTime=LocalDateTime.now().toString();
        String dt[]= dateTime.split(":");
        int a= dt.length-1;
            System.out.println(dt[a]);
            
        return dateTime.replace(':', '-').replace('.','-');
    }
    public static void main(String[] args) {
        getString();
      
    }

    public static String getMonth(Date date) {
       
        java.util.Date d = date;
        System.out.println("Month Name :"+new SimpleDateFormat("MMM").format(d));
        return new SimpleDateFormat("MMMM").format(d);
        
        
    }
}
