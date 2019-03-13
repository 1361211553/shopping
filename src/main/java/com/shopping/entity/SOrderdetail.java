package com.shopping.entity;

public class SOrderdetail {
    private Integer odid;

    private Integer oid;

    private Integer pid;

    private Integer ppurchasenum;

    private Double ptotalprice;

    public Integer getOdid() {
        return odid;
    }

    public void setOdid(Integer odid) {
        this.odid = odid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPpurchasenum() {
        return ppurchasenum;
    }

    public void setPpurchasenum(Integer ppurchasenum) {
        this.ppurchasenum = ppurchasenum;
    }

    public Double getPtotalprice() {
        return ptotalprice;
    }

    public void setPtotalprice(Double ptotalprice) {
        this.ptotalprice = ptotalprice;
    }
}