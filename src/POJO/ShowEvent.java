package POJO;

import java.sql.Date;
public class ShowEvent {
    private int id;
    private String contactname;
    private String contactemail;
    private long contactnum1;
    private long contactnum2;
    private String eventtitle;
    private String eventdesc;
 private Date eventstartdate;
    private Date eventenddate;
    private Date eventregdate;
    private String eventvenue;
    private String eventwebsite;
    private String eventstatus;

    public ShowEvent(int id, String contactname, String contactemail, long contactnum1, long contactnum2, String eventtitle, String eventdesc, Date eventstartdate, Date eventenddate, Date eventregdate, String eventvenue, String eventwebsite, String eventstatus) {
        this.id = id;
        this.contactname = contactname;
        this.contactemail = contactemail;
        this.contactnum1 = contactnum1;
        this.contactnum2 = contactnum2;
        this.eventtitle = eventtitle;
        this.eventdesc = eventdesc;
        this.eventstartdate = eventstartdate;
        this.eventenddate = eventenddate;
        this.eventregdate = eventregdate;
        this.eventvenue = eventvenue;
        this.eventwebsite = eventwebsite;
        this.eventstatus = eventstatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
   
    public String getContactname() {
        return contactname;
    }

    public void setContactname(String contactname) {
        this.contactname = contactname;
    }

    public String getContactemail() {
        return contactemail;
    }

    public void setContactemail(String contactemail) {
        this.contactemail = contactemail;
    }

    public long getContactnum1() {
        return contactnum1;
    }

    public void setContactnum1(long contactnum1) {
        this.contactnum1 = contactnum1;
    }

    public long getContactnum2() {
        return contactnum2;
    }

    public void setContactnum2(long contactnum2) {
        this.contactnum2 = contactnum2;
    }

    public String getEventtitle() {
        return eventtitle;
    }

    public void setEventtitle(String eventtitle) {
        this.eventtitle = eventtitle;
    }

    public String getEventdesc() {
        return eventdesc;
    }

    public void setEventdesc(String eventdesc) {
        this.eventdesc = eventdesc;
    }

    public Date getEventstartdate() {
        return eventstartdate;
    }

    public void setEventstartdate(Date eventstartdate) {
        this.eventstartdate = eventstartdate;
    }

    public Date getEventenddate() {
        return eventenddate;
    }

    public void setEventenddate(Date eventenddate) {
        this.eventenddate = eventenddate;
    }

    public Date getEventregdate() {
        return eventregdate;
    }

    public void setEventregdate(Date eventregdate) {
        this.eventregdate = eventregdate;
    }

    public String getEventvenue() {
        return eventvenue;
    }

    public void setEventvenue(String eventvenue) {
        this.eventvenue = eventvenue;
    }

    public String getEventwebsite() {
        return eventwebsite;
    }

    public void setEventwebsite(String eventwebsite) {
        this.eventwebsite = eventwebsite;
    }

    public String getEventstatus() {
        return eventstatus;
    }

    public void setEventstatus(String eventstatus) {
        this.eventstatus = eventstatus;
    }
   
}
