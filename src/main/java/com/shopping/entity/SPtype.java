package com.shopping.entity;

public class SPtype {
    private Integer ptypeid;

    private String ptypename;

    private Integer ptypestate;

    public Integer getPtypeid() {
        return ptypeid;
    }

    public void setPtypeid(Integer ptypeid) {
        this.ptypeid = ptypeid;
    }

    public String getPtypename() {
        return ptypename;
    }

    public void setPtypename(String ptypename) {
        this.ptypename = ptypename == null ? null : ptypename.trim();
    }

    public Integer getPtypestate() {
        return ptypestate;
    }

    public void setPtypestate(Integer ptypestate) {
        this.ptypestate = ptypestate;
    }
}