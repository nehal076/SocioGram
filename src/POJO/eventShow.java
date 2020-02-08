
package POJO;

import java.sql.Date;
import java.sql.Time;


public class eventShow {
    private int eventid;
    private String eventname;
    private int creatorid;
    private int groupid;
    private Date eventdate;
    private Time starttime;
    private Time endtime;
    private String datecreated;
    private String activitystatus;
    private String venue;
    private String city;
     private String state;

    public eventShow(int eventid, String eventname, int creatorid, int groupid, Date eventdate, Time starttime, Time endtime, String datecreated, String activitystatus, String venue, String city, String state) {
        this.eventid = eventid;
        this.eventname = eventname;
        this.creatorid = creatorid;
        this.groupid = groupid;
        this.eventdate = eventdate;
        this.starttime = starttime;
        this.endtime = endtime;
        this.datecreated = datecreated;
        this.activitystatus = activitystatus;
        this.venue = venue;
        this.city = city;
        this.state = state;
    }

    public int getEventid() {
        return eventid;
    }

    public void setEventid(int eventid) {
        this.eventid = eventid;
    }

    public String getEventname() {
        return eventname;
    }

    public void setEventname(String eventname) {
        this.eventname = eventname;
    }

    public int getCreatorid() {
        return creatorid;
    }

    public void setCreatorid(int creatorid) {
        this.creatorid = creatorid;
    }

    public int getGroupid() {
        return groupid;
    }

    public void setGroupid(int groupid) {
        this.groupid = groupid;
    }

    public Date getEventdate() {
        return eventdate;
    }

    public void setEventdate(Date eventdate) {
        this.eventdate = eventdate;
    }

    public Time getStarttime() {
        return starttime;
    }

    public void setStarttime(Time starttime) {
        this.starttime = starttime;
    }

    public Time getEndtime() {
        return endtime;
    }

    public void setEndtime(Time endtime) {
        this.endtime = endtime;
    }

    public String getDatecreated() {
        return datecreated;
    }

    public void setDatecreated(String datecreated) {
        this.datecreated = datecreated;
    }

    public String getActivitystatus() {
        return activitystatus;
    }

    public void setActivitystatus(String activitystatus) {
        this.activitystatus = activitystatus;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
     
}
