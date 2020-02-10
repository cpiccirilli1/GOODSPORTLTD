/**
 * Chelsea
 * UNTESTED!
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import BusinessObjects.Customer;

@WebServlet(name = "accountservlet", urlPatterns = {"/accountservlet"})
public class accountservlet extends HttpServlet {

    /**
     * Processes accountedit.jsp request.
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
        String phone = request.getParameter("phonenum");
        String email= request.getParameter("email");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String password = request.getParameter("password");
        
        String address = addressGlue(address1, address2, city, state, zip);
        
        Customer sess1 = (Customer)request.getSession().getAttribute("sess1");
        String id = sess1.getId();
        
        //Basically none of the fields can be empty, otherwise they get kicked to
        //the err page. LONG 'OR' statement chain. 
        if( isNullOrEmpty(fname) || isNullOrEmpty(lname) || isNullOrEmpty(phone) ||
            isNullOrEmpty(email) || isNullOrEmpty(address1) || isNullOrEmpty(address2) ||
            isNullOrEmpty(city) || isNullOrEmpty(state) || isNullOrEmpty(zip) ||
                isNullOrEmpty(password)){
            
            System.out.println("AccountServlet: Error page redirect");
            RequestDispatcher rd = request.getRequestDispatcher("/acctupdateerr.jsp");
            rd.forward(request, response);
        }
        else{

            Customer cust = new Customer();
           cust.insertDB(id, password, fname, lname,  address, phone, email);
           System.out.println("Customer Updated!");
           
            System.out.println("AccountServlet: Success redirect");
            RequestDispatcher rd = request.getRequestDispatcher("/acctupdatesuccess.jsp");
            rd.forward(request, response);
        }
        

        
        
    }
    
    protected static boolean isNullOrEmpty(String str) {
        if(str != null && !str.isEmpty())
            return false;
        return true;
    }

    protected static String addressGlue(String add1, String add2, String city, String state,
            String zip){
        String AddressStr = add1 + "," + add2 + "," + "city" + "," + "state" + "," + zip;
        
        return AddressStr;
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
