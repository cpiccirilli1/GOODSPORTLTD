/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import BusinessObjects.Customer;
import BusinessObjects.Item;
import BusinessObjects.ItemList;
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
 *   mitho
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

    /**
     * This guy updates the customer cart column and pushes to shoppingCart.jsp
     * 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     *   request servlet request
     *   response servlet response
     *   ServletException if a servlet-specific error occurs
     *   IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession ses1 = request.getSession();
        String itemID = request.getParameter("itemNumber");
        String quantity = request.getParameter("Quantity");
        try {
            Customer c1 = (Customer)ses1.getAttribute("c1");
            c1.getId();
            ItemList shoppingCart = (ItemList)ses1.getAttribute("cart");
            shoppingCart.addToCart(itemID, quantity);
            String newCart = shoppingCart.toString();
            c1.updateCart(newCart);
            ses1.setAttribute("c1", c1);
            ses1.setAttribute("cart", shoppingCart);
        } catch(NullPointerException e) {
            ItemList cart = new ItemList();
            if (ses1.getAttribute("cart") != null) {
                cart = (ItemList)ses1.getAttribute("cart");
            }
            cart.addToCart(itemID, quantity);
            ses1.setAttribute("cart", cart);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher("/Pages/shoppingCart.jsp");
            rd.forward(request, response);
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
     *   a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
