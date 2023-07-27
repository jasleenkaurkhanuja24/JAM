
package com.mycompany.youtubee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class likesdao 
{
    private static Connection con = null;   

    public likesdao(Connection con) 
    {
        this.con = con;
    }
    public boolean insertnewlike(int pid,String useremailid)
    {
        boolean status = false;
        try{
            String query = "insert into likes(pid,useremailid) values(?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setString(2, useremailid);
            int c = ps.executeUpdate();
            if(c!=0)
            {
                status = true;
            }
        }
        catch(Exception e)
        {
            System.out.println("ok then "+e);
        }
        return status;
    }
    public int countlikes(int pid)
    {
        int likes=0;
        try
        {
            String query = "select count(*) from likes where pid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                likes = rs.getInt("count(*)");
                System.out.println(likes);
            }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return likes;
    }
    public boolean isalreadyliked(int pid,String useremailid)
    {
        boolean status = false;
        try{
            String query = "select * from likes where pid=? and useremailid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setString(2, useremailid);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                status = true;
                return status;
            }
            
                System.out.println("not liked");
            
        }
        catch(Exception e)
        {
            System.out.println("ok so " + e);
        }
        return status;
    }
    public void deletelike(int pid, String useremailid)
    {
        try{
        String query = "delete from likes where pid=? and useremailid=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, pid);
        ps.setString(2, useremailid);
        ps.executeUpdate();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
