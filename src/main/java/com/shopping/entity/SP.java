package com.shopping.entity;


import java.util.Date;

public class SP {
    private Integer pid;

    private String pname;

    private Double pprice;

    private String pimg;

    private Integer pnum;

    private Date pcdate;

    private Integer pclicks;

    private Integer ptypeid;

    private String pdescription;

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public Double getPprice() {
        return pprice;
    }

    public void setPprice(Double pprice) {
        this.pprice = pprice;
    }

    public String getPimg() {
        return pimg;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg == null ? null : pimg.trim();
    }

    public Integer getPnum() {
        return pnum;
    }

    public void setPnum(Integer pnum) {
        this.pnum = pnum;
    }

    public Date getPcdate() {
        return pcdate;
    }

    public void setPcdate(Date pcdate) {
        this.pcdate = pcdate;
    }

    public Integer getPclicks() {
        return pclicks;
    }

    public void setPclicks(Integer pclicks) {
        this.pclicks = pclicks;
    }

    public Integer getPtypeid() {
        return ptypeid;
    }

    public void setPtypeid(Integer ptypeid) {
        this.ptypeid = ptypeid;
    }

    public String getPdescription() {
        return pdescription;
    }

    public void setPdescription(String pdescription) {
        this.pdescription = pdescription == null ? null : pdescription.trim();
    }

    @Override
    public String toString() {
        return "SP{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", pprice=" + pprice +
                ", pimg='" + pimg + '\'' +
                ", pnum=" + pnum +
                ", pcdate=" + pcdate +
                ", pclicks=" + pclicks +
                ", ptypeid=" + ptypeid +
                ", pdescription='" + pdescription + '\'' +
                '}';
    }
}