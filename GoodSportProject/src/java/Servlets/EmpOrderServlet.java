package Servlets;

import BusinessObjects.*;
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
 * Processes employee orders
 */
@WebServlet(name = "EmpOrderServlet", urlPatterns = {"/EmpOrderServlet"})
public class EmpOrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession ses1 = request.getSession();

            String product = request.getParameter("productID");
            String quant = request.getParameter("quantity");
            int prod = Integer.parseInt(product);
            int quan = Integer.parseInt(quant);
            System.out.println(prod);
            System.out.println(quan);

            EmpOrder emp1 = new EmpOrder();
            ses1.setAttribute("emp1", emp1);
            ses1.setAttribute("product", product);
            ses1.setAttribute("quant", quant);
            
            emp1.insertDBorder(product, quant);
            Item i2 = new Item();
            i2.selectDB(prod);
            int currentquant = i2.getQuantity();
            quan += currentquant;
            
            i2.updateQuantity(quan);
            RequestDispatcher rd;
            rd = request.getRequestDispatcher("/Pages/empinventory.jsp");
            rd.forward(request, response);
            
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
            throws ServletException, IOException 
{
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
