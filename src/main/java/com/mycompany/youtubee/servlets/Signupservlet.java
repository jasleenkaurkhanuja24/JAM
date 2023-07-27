
package com.mycompany.youtubee.servlets;

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
import jakarta.servlet.http.HttpSession;
//import static java.lang.System.out;
@MultipartConfig
public class Signupservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter())
        {
            String firstname = request.getParameter("first_name");
            String lastname = request.getParameter("last_name");
            String emailid = request.getParameter("user_email");
            String pass1 = request.getParameter("password1");
            String pass2 = request.getParameter("password2");
            String role = request.getParameter("user");
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobile");
            String gender = request.getParameter("gender");
            String profile;
            
            if(role==null || firstname==null || emailid==null || gender==null|| pass1==null || pass2==null)
            {
                out.println("Values");
            }
            if(gender.equals("female"))
            {
                profile = "female.jpg";
            }
            else
            {
                profile = "male.jpg";
            }
            //Fetching current user email address
            
            
            if(pass1.length()<8)
            {
                out.println("PassShort");
            }
            else if(!pass1.equals(pass2) )
            {
                out.println("Wrongpass");
            }
            else if(pass1.equals(pass2) )
            {
                user u = new user(address,mobile,firstname, lastname, emailid, pass1, role, gender,profile);
                userdao dao = new userdao(ConnectionProvider.getConnection());
                boolean c=dao.saveuserdata(u);
                System.out.println(c);
                if(c==true)
                {
                    out.println("Done");
                }
                else
                {
                    out.println("Present");
                }
                System.out.println(u.getProfile());
            }
             
            else
            {
                out.println("Present");
            }
            //out.println("<h2>"+c+"</h2>");
            
        }
        catch(Exception e)
        {
            System.out.println(e);
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
