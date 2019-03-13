package com.shopping.entity;

public class SAddress {
    private Integer addreessid;

    private Integer userid;

    private String consignee;

    private String addressname;

    private String addressphone;

    private Integer status;

    public Integer getAddreessid() {
        return addreessid;
    }

    public void setAddreessid(Integer addreessid) {
        this.addreessid = addreessid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee == null ? null : consignee.trim();
    }

    public String getAddressname() {
        return addressname;
    }

    public void setAddressname(String addressname) {
        this.addressname = addressname == null ? null : addressname.trim();
    }

    public String getAddressphone() {
        return addressphone;
    }

    public void setAddressphone(String addressphone) {
        this.addressphone = addressphone == null ? null : addressphone.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}