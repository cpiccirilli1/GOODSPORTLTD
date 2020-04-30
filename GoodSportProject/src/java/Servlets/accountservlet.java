/**
 * Chelsea
 * 
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
import javax.servlet.http.HttpSession;
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
        
        
        
        Customer cust1 = (Customer)request.getSession().getAttribute("c1");
        
        String id = cust1.getId();
        String cart = cust1.getCart();
        if(address2 == null || cart == null){
            address2 = " ";
            cart = " ";
        }
        
        String address = addressGlue(address1, address2, city, state, zip);
//        System.out.println(id + cart + address);
        
        //Basically none of the fields can be empty, otherwise they get kicked to
        //the err page. LONG 'OR' statement chain. 
        if( isNullOrEmpty(fname) || isNullOrEmpty(lname) || isNullOrEmpty(phone) ||
            isNullOrEmpty(email) || isNullOrEmpty(address1) ||
            isNullOrEmpty(city) || isNullOrEmpty(state) || isNullOrEmpty(zip) ||
                isNullOrEmpty(password)){
            
            System.out.println("AccountServlet: Error page redirect");
            RequestDispatcher rd = request.getRequestDispatcher("/Pages/accterr.jsp");
            rd.forward(request, response);
        }
        else{
           
            cust1.updateDB(password, fname, lname, address, phone, email, cart);
            cust1.selectDB(email);
            
           System.out.println("Customer Updated!");
           
           HttpSession ses1 = request.getSession();
           ses1.removeAttribute("c1");
           ses1.setAttribute("c1", cust1);
           
           
            System.out.println("AccountServlet: Successful insert");
            RequestDispatcher rd = request.getRequestDispatcher("accountinfo");
            rd.forward(request, response);
        }
        

        
        
    }
    /*****
     * checks str to see if null or empty. 
     * param str
     * return 
     */
    protected static boolean isNullOrEmpty(String str) {
        if(str != null && !str.isEmpty())
            return false;
        return true;
    }
    /*****
    * sticks all of the address strings together, returns one string.
    * 
    ********/
    protected static String addressGlue(String add1, String add2, String city, String state,
            String zip){
        String AddressStr = add1 + "," + add2 + "," + city + "," + state + "," + zip;
        
        return AddressStr;
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
