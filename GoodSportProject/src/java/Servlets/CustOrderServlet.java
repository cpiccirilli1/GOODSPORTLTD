package Servlets;
import BusinessObjects.CustOrder;
import BusinessObjects.Customer;
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
 *   natha
 * 
 * CustOrderServlet takes input from the purchase.jsp page. It will take customer object
 * out of the session to find its CustID for use in the CustOrders table.
 */
@WebServlet(name = "CustOrderServlet", urlPatterns = {"/CustOrderServlet"})
public class CustOrderServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession ses1 = request.getSession();
            
           //grab shipping info from purchase.jsp
           String firstname = request.getParameter("fname");
           String lastname = request.getParameter("lname");
           String address = request.getParameter("streetAddr");
           String addressext = request.getParameter("addr");
           String city = request.getParameter("city");
           String stat = request.getParameter("state");
           String zipc = request.getParameter("zip");
           
           System.out.println("== SHIPPING INFO ==");
           System.out.println("First Name: " + firstname);
           System.out.println(" Last Name: " + lastname);
           System.out.println("Address: " + address + addressext);
           System.out.println("City: " + city);
           System.out.println("State: " + stat);
           System.out.println("Zipcode: " + zipc);
           
           // contact info
           String mail = request.getParameter("email");
           String pho = request.getParameter("phone");
           
           System.out.println("== CONTACT INFO ==");
           System.out.println("Email: " + mail);
           System.out.println("Phone Number: " + pho);
           // billing address
           if ("on".equals(request.getParameter("address"))) {
            String fname2 = request.getParameter("fname2");
            String lname2 = request.getParameter("lname2");
            String address2 = request.getParameter("streetAddr2");
            String addressext2 = request.getParameter("addr2");
            String city2 = request.getParameter("city2");
            String state2 = request.getParameter("state2");
            String zipc2 = request.getParameter("zip2");



            System.out.println("== BILLING INFO ==");
            System.out.println("First Name: " + fname2);           
            System.out.println("Last Name: " + lname2);
            System.out.println("Address: " + address2 + addressext2);
            System.out.println("City: " + city2);
            System.out.println("State: " + state2);
            System.out.println("Zip Code: "+ zipc2);
           }
          
           Customer c1 = (Customer)request.getSession().getAttribute("c1");
           String id = "guest";
           ItemList cart = (ItemList)ses1.getAttribute("cart");
           String stringCart = cart.toString();
           
           CustOrder c0 = new CustOrder();
           String glue = c0.addressGlue(address, addressext, city, stat, zipc);
           Boolean update = (Boolean)ses1.getAttribute("updateAddr");
           if (c1 == null) {
           } else {
               id = c1.getCustId();
               stringCart = c1.getCart();
               if (update == true) {
                   c1.updateDB(c1.getPassword(), c1.getFName(), c1.getLName(), glue, c1.getPhone(), c1.getEmail(), c1.getCart());
               }
           }
           String orderStatus = "Open";
           c0.insertDBOrder(id, lastname, firstname, glue, pho, mail, stringCart, orderStatus);
           
            RequestDispatcher rd;
            rd = request.getRequestDispatcher("/Pages/payment.jsp");
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
     *   request servlet request
     *   response servlet response
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
     *   request servlet request
     *   response servlet response
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
