package BusinessObjects;

import java.sql.*;

/**
 *
 *    nkerns
 */
public class EmpOrder {

    int emporderID;
    String productID;
    String quantityreq;

    /*empty constructor */
    public void EmpOrder() {
        emporderID = 0;
        productID = "";
        quantityreq = "";

    }
    /*setting constructor*/
    public void EmpOrder(int orderID, String prodID, String quantity) {
        emporderID = orderID;
        productID = prodID;
        quantityreq = quantity;


    }
    /* gets emporderID variable*/
    public int getOrderID() {
        return emporderID;
    }
    /* gets productID  variable*/
    public String getProductID() {
        return productID;
    }
    /*gets quantityreq variable*/
    public String getQuantity() {
        return quantityreq;
    }
    
/****************************** 
*
     * @param EmpOrderID
     * gets Employee order by EmpOrderId
*******************************/
    public void selectDB(int EmpOrderID) {
        try {
            String sql = "SELECT * FROM EmpOrders WHERE EmpOrderID = '" + EmpOrderID + "'";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                emporderID = rs.getInt("EmpOrderID");
                productID = rs.getString("ProductID");
                quantityreq = rs.getString("QuantityNeeded");

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
/****************************** 
*  Inserts into the EmpOrders table
*
     * @param orderID
     * Order ID
     * @param prodID
     * Product ID
     * @param quantity
     * Quantity
*******************************/
    public void insertDB(int orderID, String prodID, String quantity) {
        try {
            String sql = "INSERT INTO EmpOrders VALUES ('" + orderID + "', '"
                    + prodID + "', '" + quantity + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
        
/****************************** 
* Inserts into EmpOrders Database using prodID and quantity
*
     * @param prodID
     * Product ID
     * @param quantity
     * Quantity
*******************************/
    public void insertDBorder(String prodID, String quantity) {
        try {
        String sql = "INSERT INTO EmpOrders (ProductID, QuantityNeeded) VALUES ('" + prodID + "', '" + quantity + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

        
/****************************** 
* updates emporders table 
* requires orderID prodID and quantity
*
     * @param orderID
     * Order ID
     * @param prodID
     * product ID
     * @param quantity
     * Quantity
*******************************/
    public void updateDB(int orderID, String prodID, String quantity) {
        try {
            String sql = "UPDATE EmpOrders SET EmpOrderID = '" + orderID + "', ProductID = '"
                    + prodID + "', QuanitityNeeded = '" + quantity + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
/****************************** 
*
     * @param orderID
     * deletes row from emporders table, requires orderID
*******************************/
    public void deleteDB(int orderID) {
        try {
            String sql = "DELETE FROM EmpOrders WHERE EmpOrderID = '" + orderID + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
