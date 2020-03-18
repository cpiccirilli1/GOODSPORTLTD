package Servlets;
import BusinessObjects.Item;

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
 */
@WebServlet(name = "UpdateItemListServlet", urlPatterns = {"/UpdateItemListServlet"})
public class UpdateItemListServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           HttpSession ses1 = request.getSession();

            String product = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String desc = request.getParameter("description");
            String cat = request.getParameter("category");
            String sport = request.getParameter("sport");
            String price = request.getParameter("Price");
            String imglink = request.getParameter("img");
            int prod = Integer.parseInt(product);
            //double pri = Double.parseDouble(price);
            System.out.println("ENTERED STATEMENTS:");
            System.out.println(prod);
            System.out.println(productName);
            System.out.println(desc);
            System.out.println(cat);
            System.out.println(sport);
            System.out.println(price);
            System.out.println(imglink);

            
            String action = request.getParameter("action");

            if ("search".equals(action)) {
            Item i3 = new Item();
            i3.selectDB(prod);
            i3.display();
            RequestDispatcher rd = request.getRequestDispatcher("/Pages/UpdateItemList.jsp");
            rd.forward(request,response);
            }
            else if ("update".equals(action)){
            Item i4 = new Item();
            i4.selectDB(prod);
            i4.updateItemDB(productName, desc, cat, sport, imglink);
            RequestDispatcher rd = request.getRequestDispatcher("/Pages/empinventory.jsp");
            rd.forward(request,response);
            }  
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
