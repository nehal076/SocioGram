
package POJO;
import java.sql.Timestamp;


public class showLoginUser {
    private String fname;
    private String lname;
    private String email;
    private Timestamp  loginDate;

    public showLoginUser(String fname, String lname, Timestamp loginDate,String email) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.loginDate = loginDate;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Timestamp getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Timestamp loginDate) {
        this.loginDate = loginDate;
    }
    
    
}
