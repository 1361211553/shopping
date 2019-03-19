package com.shopping.entity;

public class SOrderdetail {
    private Integer odid;

    private String oid;

    private Integer pid;

    private Integer ppurchasenum;

    private Double ptotalprice;

    private Integer addressid;

    public Integer getOdid() {
        return odid;
    }

    public void setOdid(Integer odid) {
        this.odid = odid;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
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

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }
}