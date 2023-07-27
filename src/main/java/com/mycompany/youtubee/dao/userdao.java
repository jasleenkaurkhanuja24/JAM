package com.mycompany.youtubee.dao;
import java.sql.*;
import com.mycompany.youtubee.entities.user;
//user to signup
public class userdao 
{
   private final Connection con;

    public userdao(Connection con) {
        this.con=con;
    }
    public boolean saveuserdata(user u)
    {
        boolean f=false; 
        try{
        String stm="insert into signup(address,mobile,firstname,lastname,emailid,password,role,gender,profile) values(?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps;
        
        ps = con.prepareStatement(stm);
        ps.setString(1, u.getAddress());
        ps.setString(2, u.getMobile());
        ps.setString(3, u.getFirstname());
        ps.setString(4, u.getLastname());
        ps.setString(5, u.getEmailid());
        ps.setString(6, u.getPassword());
        ps.setString(7, u.getRole());
        ps.setString(8, u.getGender());
        ps.setString(9, u.getProfile());
        //System.out.println("ps created1");
        int c=ps.executeUpdate();
        System.out.println("c = " + c);
        if(c==1)
            f=true;
        
        }
        catch(SQLException e)
        {
            //f=true;
            System.out.println("gfg  "+e);
        }
        return f;
    }
    //used to login
    public user getUserData(String emailid, String password)
    {
        user u=null;
        try{
            String query = "select * from signup where emailid=? and password=?";
            PreparedStatement ps;
            ps=con.prepareStatement(query);
            ps.setString(1, emailid);
            ps.setString(2, password);
            
            ResultSet set = ps.executeQuery();
            if(set.next())
            {
                u = new user();
                String fname = set.getString("Firstname");
                u.setFirstname(fname);
                String lname = set.getString("Lastname");
                u.setLastname(lname);
                String pass = set.getString("Password");
                u.setPassword(pass);
                String role = set.getString("Role");
                u.setRole(role);
                String email = set.getString("Emailid");
                u.setEmailid(email);
                String gender = set.getString("Gender");
                u.setGender(gender);
                String address = set.getString("Address");
                u.setAddress(address);
                String mobile = set.getString("mobile");
                u.setMobile(mobile);
                String profile = set.getString("profile");
                u.setProfile(profile);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return u;
    }
    public boolean alteruserdata(user u)
    {
        boolean status = false;
        try
        {
            String email = u.getEmailid();
            System.out.println(email);
            String query = "update signup set firstname=?, lastname=?, mobile=?, address=?, password=?, profile=? where emailid='"+email+"'";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, u.getFirstname());
            ps.setString(2, u.getLastname());
            ps.setString(3, u.getMobile());
            ps.setString(4, u.getAddress());
            ps.setString(5, u.getPassword());
            ps.setString(6, u.getProfile());
            int c = ps.executeUpdate();
            
            System.out.println(c);
            if(c!=0)
            {
                status=true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return status;
    }
    
    
     public String getusername(String emailid)
    {
        String name = "";
        try
        {
            String query = "select firstname, lastname from signup where emailid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, emailid);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                name = name + rs.getString("firstname");
                name = name + " " + rs.getString("lastname");
                
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return name;
    }
}
