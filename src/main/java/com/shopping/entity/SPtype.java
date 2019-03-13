package com.shopping.entity;

public class SPtype {
    private Integer ptypeid;

    private String ptypename;

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
}