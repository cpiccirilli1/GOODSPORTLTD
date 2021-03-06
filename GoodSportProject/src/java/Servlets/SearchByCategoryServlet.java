/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import BusinessObjects.ItemList;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * author cgoswic1
 */
@WebServlet(name = "SearchByCategoryServlet", urlPatterns = {"/SearchByCategoryServlet"})
public class SearchByCategoryServlet extends HttpServlet {

    /**
     * Gets sport from top menu bar and then kicks all the products under that sport
     * to the itemgrid
     * 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * param request servlet request
     * param response servlet response
     * throws ServletException if a servlet-specific error occurs
     * throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            /* TODO output your page here. You may use following sample code. */
            String sport = request.getParameter("sport");
            ItemList il1 = new ItemList();
            il1.selectSportDB(sport);
            HttpSession ses1 = request.getSession();
            ses1.setAttribute("il1", il1);
            RequestDispatcher rd;
            rd = request.getRequestDispatcher("/Pages/ItemGrid.jsp");
            rd.forward(request, response);
        }
        catch(Exception e){System.out.println(e);}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * param request servlet request
     * param response servlet response
     * throws ServletException if a servlet-specific error occurs
     * throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * param request servlet request
     * param response servlet response
     * throws ServletException if a servlet-specific error occurs
     * throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
