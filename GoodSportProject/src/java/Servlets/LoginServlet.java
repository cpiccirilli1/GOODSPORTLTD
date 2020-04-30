package Servlets;

import BusinessObjects.*;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * author mitho
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    /**
     * Validates login before pushing to homepage. 
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
        HttpSession ses1 = request.getSession();
        String email = request.getParameter("emailSignIn");
        String password = request.getParameter("passwordSignIn");
        String check = request.getParameter("employeeCheck");
        String signInErr = null;
        RequestDispatcher rd;
        //used for determining login type in future files
        boolean customer;
        if (check.equals("Customer")) {
            Customer c1 = new Customer();
            c1.selectDB(email);
            if (null == c1.getEmail()){
                signInErr = ("Email incorrect. Please try again.");
                ses1.setAttribute("signInErr", signInErr);
                rd = request.getRequestDispatcher("/Pages/SignIn.jsp");
                rd.forward(request, response);
            }
            String dbPassword = c1.getPassword();
            if (dbPassword.equals(password)) {
                customer = true;
                ses1.setAttribute("c1", c1);
                ses1.setAttribute("customer", customer);
                ItemList cart = new ItemList();
                try {
                    cart.populateCart(c1.getCart().split(","));
                    cart.storeIds();
                } catch (Exception e) {
                    System.out.println(e);
                }
                if (ses1.getAttribute("cart") != null) {
                    ItemList guestCart = (ItemList)ses1.getAttribute("cart");
                    String[] quantities = guestCart.quantities.split(",");
                    for (int i = 0; i < guestCart.iArr.size(); i++) {
                        Item i1 = guestCart.iArr.get(i);
                        cart.addToCart(String.valueOf(i1.getId()), quantities[i]);
                    }
                    c1.updateCart(cart.toString());
                }
                ses1.setAttribute("cart", cart);
                rd = request.getRequestDispatcher("accountinfo");
                rd.forward(request, response);
            } else {
                signInErr = ("Password incorrect. Please try again.");
                ses1.setAttribute("signInErr", signInErr);
                rd = request.getRequestDispatcher("/Pages/SignIn.jsp");
                rd.forward(request, response);
            }
        } else {
            Employee e1 = new Employee();
            customer = false;
            e1.selectDB(email);
            if (null == e1.getEmail()){
            signInErr = ("Email incorrect. Please try again.");
            ses1.setAttribute("signInErr", signInErr);
            rd = request.getRequestDispatcher("/Pages/SignIn.jsp");
            rd.forward(request, response);
            }
            String dbPassword = e1.getPassword();
            if (dbPassword.equals(password)) {
                ses1.setAttribute("e1", e1);
                rd = request.getRequestDispatcher("/Pages/empPortal.jsp");
                rd.forward(request, response);
            } else {
                signInErr = ("Password incorrect. Please try again.");
                ses1.setAttribute("signInErr", signInErr);
                rd = request.getRequestDispatcher("/Pages/SignIn.jsp");
                rd.forward(request, response);
            }
        }
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
