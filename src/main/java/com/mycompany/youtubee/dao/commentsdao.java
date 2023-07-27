package com.mycompany.youtubee.dao;
import com.mycompany.youtubee.entities.comments;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class commentsdao 
{
    private Connection con;

    public commentsdao(Connection con) 
    {
        this.con = con;
    }
    public  List getcomments(int pid)
    {
        List<comments> list= new ArrayList<>();
        try{
            String query = "select * from comments where pid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,pid);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                int commentid = rs.getInt("commentid");
                String useremailid = rs.getString("useremailid");
                String commentcontent = rs.getString("commentcontent");
                Timestamp time = rs.getTimestamp("commenttime");
                comments c = new comments(commentcontent,pid,useremailid,time);
                System.out.println(time);
                list.add(c);
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return list;
    }
    public boolean insertnewcomment(String c,int pid,String useremailid)
    {
        boolean status=false;
        try
        {
            String query = "insert into comments(commentcontent, pid, useremailid ) values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, c);
            ps.setInt(2, pid);
            ps.setString(3,useremailid);
            int s = ps.executeUpdate();
            System.out.println(s);
            if(s!=0)
            {
                System.out.println("comment added");
                status = true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return status;
    }
}
