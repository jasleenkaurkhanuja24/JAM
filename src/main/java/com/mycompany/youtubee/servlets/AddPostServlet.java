package com.mycompany.youtubee.servlets;

import com.mycompany.youtubee.dao.postdao;
import com.mycompany.youtubee.entities.Post;
import com.mycompany.youtubee.entities.user;
import com.mycompany.youtubee.helper.ConnectionProvider;
import com.mycompany.youtubee.helper.savefile;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Timestamp;


@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) 
        {
            int cid = Integer.parseInt(request.getParameter("cid"));
            String title = request.getParameter("title");
            String code = request.getParameter("code");
            String content = request.getParameter("content");
            Part file = request.getPart("file");
            String filename = file.getSubmittedFileName();
            String description = request.getParameter("description");
            //Timestamp t;
            HttpSession session = request.getSession();
            user u = (user)session.getAttribute("currentUser");
            String emailid = u.getEmailid();
            Post p = new Post(cid,title,description,code,null,filename,emailid,content);
            postdao pd = new postdao(ConnectionProvider.getConnection());
            if(cid==0 || title==null)
            {
                out.println("F");
            }
            else if(pd.savepostdata(p))
            {
                out.println("Done");
                String path = request.getRealPath("/")+"images"+File.separator+p.getPpic();
                
                savefile sf = new savefile();
                if(sf.savingfile(file.getInputStream(), path))
                { 
                    System.out.println("Done");
                }
                
            }
            else
            {
                out.println("F");
            }
//            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
