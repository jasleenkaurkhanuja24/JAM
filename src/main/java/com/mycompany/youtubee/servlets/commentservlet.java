
package com.mycompany.youtubee.servlets;

import com.mycompany.youtubee.dao.commentsdao;
import com.mycompany.youtubee.entities.comments;

import com.mycompany.youtubee.dao.userdao;
import com.mycompany.youtubee.entities.user;
import com.mycompany.youtubee.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@MultipartConfig
public class commentservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) { 
              String comment = request.getParameter("comment");
              String uid = request.getParameter("ud");
              String p = request.getParameter("pd");
              System.out.println("p " +p);
              System.out.println("uid = "+uid);
              System.out.println("comment "+comment);
              int pid = Integer.parseInt(p);
              commentsdao cd = new commentsdao(ConnectionProvider.getConnection());
             
              comments c = new comments(comment,pid,uid);
              userdao ud = new userdao(ConnectionProvider.getConnection()); 
              user u1 = new user();
              String name1 = ud.getusername(c.getUseremailid());
              boolean status = cd.insertnewcomment(comment, pid, uid);
              if(status==true)
              {
//                  out.println("<div>");
//                
             out.println("By: <a href=\'#\'>"+name1+"</a>");                                 
             out.println(c.getCommentcontent());
             out.println("<br>");
             out.println("<small>");
             out.println(c.getTime());
             out.println("</small>");
             out.println("<hr>");
//             out.println("</div>");
              }
              else
              {
                  out.println("error");
              }

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
    }

}
