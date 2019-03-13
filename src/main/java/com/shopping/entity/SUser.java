package com.shopping.entity;

import org.springframework.boot.autoconfigure.domain.EntityScan;

import java.util.Date;


public class SUser {
    private Integer userid;

    private String username;

    private String userpass;

    private String userrealname;

    private String usersex;

    private Date userbirthday;

    private String useremail;

    private String userphone;

    private Integer useraddressid;

    private String userface;

    private Date userregdate;

    private Integer landingtimes;

    private Integer slock;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass == null ? null : userpass.trim();
    }

    public String getUserrealname() {
        return userrealname;
    }

    public void setUserrealname(String userrealname) {
        this.userrealname = userrealname == null ? null : userrealname.trim();
    }

    public String getUsersex() {
        return usersex;
    }

    public void setUsersex(String usersex) {
        this.usersex = usersex == null ? null : usersex.trim();
    }

    public Date getUserbirthday() {
        return userbirthday;
    }

    public void setUserbirthday(Date userbirthday) {
        this.userbirthday = userbirthday;
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail == null ? null : useremail.trim();
    }

    public String getUserphone() {
        return userphone;
    }

    public void setUserphone(String userphone) {
        this.userphone = userphone == null ? null : userphone.trim();
    }

    public Integer getUseraddressid() {
        return useraddressid;
    }

    public void setUseraddressid(Integer useraddressid) {
        this.useraddressid = useraddressid;
    }

    public String getUserface() {
        return userface;
    }

    public void setUserface(String userface) {
        this.userface = userface == null ? null : userface.trim();
    }

    public Date getUserregdate() {
        return userregdate;
    }

    public void setUserregdate(Date userregdate) {
        this.userregdate = userregdate;
    }

    public Integer getLandingtimes() {
        return landingtimes;
    }

    public void setLandingtimes(Integer landingtimes) {
        this.landingtimes = landingtimes;
    }

    public Integer getSlock() {
        return slock;
    }

    public void setSlock(Integer slock) {
        this.slock = slock;
    }
}