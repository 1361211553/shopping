package com.shopping.entity;

public class SOrderdetail {
    private Integer orderdetailid;

    private Integer pid;

    private String oid;

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

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid == null ? null : oid.trim();
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

    @Override
    public String toString() {
        return "SOrderdetail{" +
                "orderdetailid=" + orderdetailid +
                ", pid=" + pid +
                ", oid='" + oid + '\'' +
                ", ppurchasenum=" + ppurchasenum +
                ", ptotalprice=" + ptotalprice +
                '}';
    }
}