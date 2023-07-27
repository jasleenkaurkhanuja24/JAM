
package com.mycompany.youtubee.servlets;

import com.mycompany.youtubee.dao.userdao;
import com.mycompany.youtubee.entities.user;
import com.mycompany.youtubee.helper.ConnectionProvider;
import com.mycompany.youtubee.helper.Message;
import com.mycompany.youtubee.helper.deletefile;
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

@MultipartConfig
public class EditProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet EditProfileServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
            String firstname = request.getParameter("first_name");
            String lastname = request.getParameter("last_name");
            
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            Part part = request.getPart("picture");
            String profilepicturename = part.getSubmittedFileName();
            
            //get current user from the session
            HttpSession hs = request.getSession();
            user u = (user)hs.getAttribute("currentUser");
            System.out.println(profilepicturename);
            
            u.setAddress(address);
            u.setFirstname(firstname);
            u.setLastname(lastname);
            u.setMobile(mobile);
            u.setPassword(password);
            String oldfile = u.getProfile();
            if(profilepicturename!="")
            {
                u.setProfile(profilepicturename);
            }
            userdao alteruser = new userdao(ConnectionProvider.getConnection());
            boolean done = alteruser.alteruserdata(u);
            if(done==true)
            {
                System.out.println("Success");
                if(profilepicturename!="")
                {
                    String pro = u.getProfile();
                    if(!u.getProfile().equals("female.jpg") && !u.getProfile().equals("male.jpg"))
                    {
                        deletefile df = new deletefile();
                        df.deletingfile(request.getRealPath("/") + "images" + File.separator + oldfile);
                    }
                String path = request.getRealPath("/")+"images"+File.separator+profilepicturename;
                savefile sf = new savefile();
                if(sf.savingfile(part.getInputStream(),path))
                {
                    System.out.println("done");
                }
                }
                Message m = new Message("Profile details updated successfully!!","success","alert-success");
                hs.setAttribute("msg", m);
                response.sendRedirect("profile.jsp");
            }
            else
            {
                System.out.println("Failure");
                Message m = new Message("Something went wrong!!","error","alert-error");
                hs.setAttribute("msg", m);
                response.sendRedirect("profile.jsp");
            }
//            
//            out.println("</body>");
//            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
