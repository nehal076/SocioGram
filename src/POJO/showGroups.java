/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package POJO;

/**
 *
 * @author harshit
 */
public class showGroups {
    private int groupid;
    private String groupname;
    private int creatorid;
    private String location;
    private String permission;
    private String username;

    public showGroups(int groupid, String groupname, int creatorid, String location, String permission, String username) {
        this.groupid = groupid;
        this.groupname = groupname;
        this.creatorid = creatorid;
        this.location = location;
        this.permission = permission;
        this.username = username;
    }

    public int getGroupid() {
        return groupid;
    }

    public void setGroupid(int groupid) {
        this.groupid = groupid;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }

    public int getCreatorid() {
        return creatorid;
    }

    public void setCreatorid(int creatorid) {
        this.creatorid = creatorid;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

   
    
}
