package com.mycompany.youtubee.entities;

import java.sql.Timestamp;

public class comments 
{
    private int commentid;
    private String commentcontent;
    private String useremailid;
    private int pid;
    private Timestamp time;

    public String getUseremailid() {
        return useremailid;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public comments(String commentcontent, int pid, String useremailid) {
        this.commentcontent = commentcontent;
        this.useremailid = useremailid;
        this.pid = pid;
    }

    public comments( String commentcontent, int pid, String useremailid, Timestamp time) {
        
        this.commentcontent = commentcontent;
        this.useremailid = useremailid;
        this.pid = pid;
        this.time = time;
    }

    public void setUseremailid(String useremailid) {
        this.useremailid = useremailid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public comments(int commentid, String commentcontent) {
        this.commentid = commentid;
        this.commentcontent = commentcontent;
    }

    public comments() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getCommentid() {
        return commentid;
    }

    public void setCommentid(int commentid) {
        this.commentid = commentid;
    }

    public String getCommentcontent() {
        return commentcontent;
    }

    public void setCommentcontent(String commentcontent) {
        this.commentcontent = commentcontent;
    }
        
}
