package com.mycompany.youtubee.entities;

import java.sql.Timestamp;

public class Post 
{
    private int pid;
    private int cid;
    private String ptitle;
    private String pdescription;
    private String pcode;
    private Timestamp ptime;
    private String ppic;
    private String poster;
    private String pcontent;
    

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

   

    

    public Post(int pid, int cid, String ptitle, String pdescription, String pcode, Timestamp ptime, String ppic, String poster, String pcontent) {
        this.pid = pid;
        this.cid = cid;
        this.ptitle = ptitle;
        this.pdescription = pdescription;
        this.pcode = pcode;
        this.ptime = ptime;
        this.ppic = ppic;
        this.poster = poster;
        this.pcontent = pcontent;
        
    }

    public Post() {
    }

    

    public String getPoster() {
        return poster;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPdescription() {
        return pdescription;
    }

    public void setPdescription(String pdescription) {
        this.pdescription = pdescription;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public Timestamp getPtime() {
        return ptime;
    }

    public void setPtime(Timestamp ptime) {
        this.ptime = ptime;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public Post(int cid,String ptitle, String pdescription, String pcode, Timestamp ptime, String ppic,String poster,String pcontent) {
        this.ptitle = ptitle;
        this.pdescription = pdescription;
        this.pcode = pcode;
        this.ptime = ptime;
        this.ppic = ppic;
        this.poster = poster;
        this.cid = cid;
        this.pcontent = pcontent;       
    }
    
}

