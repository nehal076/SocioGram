
package POJO;


public class ShowUsers {
        private int id;
        private String fname;
        private String lname;
        private String email;
        private String dob;
        private String city;
        private String password;
    

    public ShowUsers(int id,String fname,String lname,String email,String dob,String city,String password ) {
        this.id=id;
        this.fname=fname;
        this.lname=lname;
      
        this.email=email;
       
        this.dob=dob;
        this.city=city;
        this.password=password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    
  
    
    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPassword() {
        return password;
    }

    public void sePassword(String password) {
        this.password = password;
    }
    
   
    
}
