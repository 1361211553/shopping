package com.shopping.entity;

public class SOrder {
    private String oid;

    private Integer userid;

    private Integer pcount;

    private Double ptotalprice;

    private Integer pstatus;

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getPcount() {
        return pcount;
    }

    public void setPcount(Integer pcount) {
        this.pcount = pcount;
    }

    public Double getPtotalprice() {
        return ptotalprice;
    }

    public void setPtotalprice(Double ptotalprice) {
        this.ptotalprice = ptotalprice;
    }

    public Integer getPstatus() {
        return pstatus;
    }

    public void setPstatus(Integer pstatus) {
        this.pstatus = pstatus;
    }
}