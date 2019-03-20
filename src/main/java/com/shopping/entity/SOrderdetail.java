package com.shopping.entity;

public class SOrderdetail {
    private Integer orderdetailid;

    private Integer pid;

    private Integer oid;

    private Integer ppurchasenum;

    private Double ptotalprice;

    public Integer getOrderdetailid() {
        return orderdetailid;
    }

    public void setOrderdetailid(Integer orderdetailid) {
        this.orderdetailid = orderdetailid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
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