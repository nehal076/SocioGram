
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "editEvent", urlPatterns = {"/editEve"})
public class editEvent extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        int id=Integer.parseInt(request.getParameter("id"));
        Date eventdate=Date.valueOf(request.getParameter("eventdate"));
        Time startTime=Time.valueOf(request.getParameter("startTime"));
         Time endTime=Time.valueOf(request.getParameter("endTime"));
         
         String eventname=request.getParameter("eventname");
         String datecreated=request.getParameter("datecreated");
         String activityStatus=request.getParameter("activitystatus");
         String eventvenue=request.getParameter("eventvenue");
         String eventstate=request.getParameter("eventstate");
         String eventcity=request.getParameter("eventcity");
         
         if(Model.db_query.update_userEvent(id, eventname, eventdate, startTime, endTime, datecreated, activityStatus, eventvenue, eventcity, eventstate))
         {
           System.out.println("Successfully");
          response.sendRedirect("Admin/eventShow.jsp");  
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(editEvent.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(editEvent.class.getName()).log(Level.SEVERE, null, ex);
        }
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
