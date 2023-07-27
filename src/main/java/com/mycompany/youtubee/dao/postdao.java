package com.mycompany.youtubee.dao;
import java.sql.*;
import com.mycompany.youtubee.entities.Category;
import com.mycompany.youtubee.entities.Post;
import java.util.ArrayList;
import java.util.List;

public class postdao 
{
    private Connection con=null;
    public postdao(Connection con)
    {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories()
    {
        ArrayList<Category> a = new ArrayList<>();
        try
        {
            String q = "select * from category";
            Statement s;
            s = this.con.createStatement();
            ResultSet rs = s.executeQuery(q);
            while(rs.next())
            {
                int cid = rs.getInt("cid");
                String cname = rs.getString("cname");
                Category category = new Category(cid,cname);
                a.add(category);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return a;
    }
    public boolean savepostdata(Post p)
    {
        boolean status = false;
        try
        {
            String statement = "insert into posts(cid,ptitle,pdescription,pcode,ppic,poster,pcontent) values(?,?,?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(statement);
            ps.setInt(1, p.getCid());
            ps.setString(2, p.getPtitle());
            ps.setString(3, p.getPdescription());
            ps.setString(4, p.getPcode());
            ps.setString(5, p.getPpic());
            ps.setString(6, p.getPoster());
            ps.setString(7, p.getPcontent());
            int c = ps.executeUpdate();
            System.out.println(p.getCid());
            if(c!=0)
            {
                status = true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return status;
    }
    
    public List getAllPosts()
    {
        List<Post> list = new ArrayList<Post>();
        try{
            String query = "select * from posts order by rand()";
            Statement s;
            s = this.con.createStatement();
            ResultSet rs = s.executeQuery(query);
            while(rs.next())
            {
                System.out.print("got");
                String title = rs.getString("ptitle");
                String description = rs.getString("pdescription");
                String code = rs.getString("pcode");
                String content = rs.getString("pcontent");
                String pic = rs.getString("ppic");
                String poster = rs.getString("poster");
                int cid = rs.getInt("cid");
                int pid = rs.getInt("pid");
                Timestamp ts = rs.getTimestamp("ptime");
                int like = rs.getInt("plike");
                int comment = rs.getInt("pcomment");
                Post p = new Post(pid,cid,title,description,code,ts,pic,poster,content);
                list.add(p);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    public List getPostByCategory(int cid)
    {
        List<Post> list = new ArrayList<>();
        try{
            String query = "select * from posts where cid=? order by rand()";
            PreparedStatement ps;
            ps = con.prepareStatement(query);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                String title = rs.getString("ptitle");
                String description = rs.getString("pdescription");
                String code = rs.getString("pcode");
                String content = rs.getString("pcontent");
                String pic = rs.getString("ppic");
                String poster = rs.getString("poster");
                int pid = rs.getInt("pid");
                Timestamp ts = rs.getTimestamp("ptime");
                
                Post p = new Post(pid,cid,title,description,code,ts,pic,poster,content);
                
                list.add(p);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    public Post getPostData(int pid)
    {
        Post p = new Post();
        try{
            String query = "select * from posts where pid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                String title = rs.getString("ptitle");
                String description = rs.getString("pdescription");
                String code = rs.getString("pcode");
                String content = rs.getString("pcontent");
                String pic = rs.getString("ppic");
                String poster = rs.getString("poster");
                int cid = rs.getInt("cid");
                Timestamp ts = rs.getTimestamp("ptime");
                
                p = new Post(pid,cid,title,description,code,ts,pic,poster,content);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return p;
    }
    
    
}
