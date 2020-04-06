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
 * @author natha
 * 
 * This servlet is designed to take all information from the payment page and compile it into
 * the Payments table in the database. It will not process if CC information is incorrect.
 */
@WebServlet(name = "CustPaymentServlet", urlPatterns = {"/CustPaymentServlet"})
public class CustPaymentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession ses1 = request.getSession();
            // grab payment info from payment.jsp
           String name = request.getParameter("owner");
           String creditcard = request.getParameter("cardNumber");
           String expMonth = request.getParameter("expiration-month");
           String expYear = request.getParameter("expiration-year");
           String security = request.getParameter("cvv");
           
           System.out.println("== PAYMENT INFO ==");
           System.out.println("Name On Card: " + name);
           System.out.println("Credit Card Number: " + creditcard);
           System.out.println("Expiration Date: " + expMonth + expYear);
           System.out.println("CVC: "+ security);
           
           Customer c1 = (Customer)ses1.getAttribute("c1");
           CustOrder c01 = new CustOrder();
           int payid = c01.getOrder();
           payments p1 = new payments();
           Double payment = (Double)ses1.getAttribute("c");
 
           String glueexpiration = p1.expirationGlue(expMonth, expYear);
           p1.insertDB(payid, name, payment, creditcard, glueexpiration, security);
           //p1.insertDBtemp(name, creditcard, glueexpiration, security);
           
           RequestDispatcher rd;
            rd = request.getRequestDispatcher("/Pages/orderConfirmation.jsp");
            rd.forward(request, response);
        }
        catch (Exception e) {
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
