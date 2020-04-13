/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import BusinessObjects.Customer;
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
 *   mitho
 */
@WebServlet(name = "CreateAccountServlet", urlPatterns = {"/CreateAccountServlet"})
public class CreateAccountServlet extends HttpServlet {

    /**
     * Creates an account for users in the database. Puts blanks info in the address 
     * field....
     * 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     * 
     *
     *   request servlet request
     *   response servlet response
     *   ServletException if a servlet-specific error occurs
     *   IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
{
        response.setContentType("text/html;charset=UTF-8");
        HttpSession ses1 = request.getSession();
        String email = request.getParameter("emailSignUp");
        String passwd = request.getParameter("passwordSignUp");
        String confirmpasswd = request.getParameter("confirmPswd");
        String fName = request.getParameter("firstNameSignUp");
        String lName = request.getParameter("lastNameSignUp");
        String phone = request.getParameter("phoneNumberSignUp");
        String adEntered = request.getParameter("address");
        String address = "NA,NA,NA,NA,NA";
        String signUpErr = null;
        
        System.out.println(email);
        System.out.println(passwd);
        System.out.println(fName);
        System.out.println(lName);
        System.out.println(phone);
        
        if ("on".equals(adEntered)) {
            String street = request.getParameter("streetSignUp");
            String street1 = request.getParameter("streetSignUp1");
            String city = request.getParameter("citySignUp");
            String state = request.getParameter("stateSignUp");
            String zipcode = request.getParameter("zipcodeSignUp");
            address = street + ","+street1+","+ city + "," + state + "," + zipcode;
        } else {}
        Customer c1 = new Customer();
        c1.selectDB(email);
        if (passwd.equals(confirmpasswd)){
            if(c1.getEmail() == null){
            c1.insertDB2(lName, fName, address, phone, email, passwd);
            c1.setCustFirstName(fName);
            c1.setCustLastName(lName);
            c1.setCustAddress(address);
            c1.setCustEmail(email);
            c1.setCustPassword(passwd);
            c1.setCustPhone(phone);
            ses1.setAttribute("c1", c1);
            RequestDispatcher rd;
            rd = request.getRequestDispatcher("/Pages/SignIn.jsp");
            rd.forward(request, response);
            }
            else{
            signUpErr = ("Account already exist with this email. Either sign in or use another email.");
            ses1.setAttribute("signUpErr", signUpErr);
            RequestDispatcher rd;
            rd = request.getRequestDispatcher("Pages/SignIn.jsp");
            rd.forward(request, response);
            }
        }
        else{            
            signUpErr = ("Passwords do not match. Please retry.");
            ses1.setAttribute("signUpErr", signUpErr);
            RequestDispatcher rd;
            rd = request.getRequestDispatcher("Pages/SignIn.jsp");
            rd.forward(request, response);
        }
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     *   request servlet request
     *   response servlet response
     *   ServletException if a servlet-specific error occurs
     *   IOException if an I/O error occurs
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
     *   ServletException if a servlet-specific error occurs
     *   IOException if an I/O error occurs
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
