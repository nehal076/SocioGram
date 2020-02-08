
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "reg_event", urlPatterns = {"/reg_event"})
public class reg_event extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            System.err.println("YESS");
           String cname=request.getParameter("cname");
           String cemail=request.getParameter("cemail");
           long cmob1 = Long.parseLong(request.getParameter("cmob1"));
           long cmob2 = Long.parseLong(request.getParameter("cmob2"));
            String etitle=request.getParameter("etitle");
            String edesc=request.getParameter("edesc");
           
            Date estartdate=Date.valueOf(request.getParameter("estartdate"));
            Date eenddate=Date.valueOf(request.getParameter("eenddate"));
              Date elastdate=Date.valueOf(request.getParameter("elastdate"));
            String evenue=request.getParameter("evenue");
             String ewebsite=request.getParameter("ewebsite");
           // String etime=request.getParameter("etime");
            System.out.println("bjufbug");
            System.out.println(" "+etitle+" "+edesc+" "+eenddate+" ");
           if(Model.db_query.createEvent(cname, cemail, cmob1, cmob2, etitle, edesc, estartdate, eenddate, elastdate, evenue, ewebsite))
           {   
               System.out.println("Successfully");
               response.sendRedirect("Admin/event.jsp");
           }
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
            Logger.getLogger(reg_event.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(reg_event.class.getName()).log(Level.SEVERE, null, ex);
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
