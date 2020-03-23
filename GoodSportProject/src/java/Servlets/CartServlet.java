/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import BusinessObjects.Customer;
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
 * @author mitho
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession ses1 = request.getSession();
        String itemID = request.getParameter("itemNumber");
        try {
            Customer c1 = (Customer)ses1.getAttribute("c1");
            ItemList shoppingCart = new ItemList();
            if (!c1.getCart().equals("")) {
                String[] cart = c1.getCart().split(",");
                shoppingCart.populateCart(cart);
            }
            shoppingCart.addToCart(itemID);
            String newCart = "";
            for (int i = 0; i < shoppingCart.iArr.size(); i++) {
                newCart = newCart.concat(shoppingCart.iArr.get(i).getId() + ",");
            }
            c1.updateCart(newCart);
            ses1.setAttribute("c1", c1);
            ses1.setAttribute("cart", shoppingCart);
        } catch(NullPointerException e) {
            ItemList cart = new ItemList();
            if (ses1.getAttribute("cart") != null) {
                cart = (ItemList)ses1.getAttribute("cart");
            }
            cart.addToCart(itemID);
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
