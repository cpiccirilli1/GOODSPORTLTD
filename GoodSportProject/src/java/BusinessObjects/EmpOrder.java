package BusinessObjects;

import java.sql.*;

/**
 *
 * @author nkerns
 */
public class EmpOrder {

    int emporderID;
    String productID;
    String quantityreq;


    public void EmpOrder() {
        emporderID = 0;
        productID = "";
        quantityreq = "";

    }

    public void EmpOrder(int orderID, String prodID, String quantity) {
        emporderID = orderID;
        productID = prodID;
        quantityreq = quantity;


    }

    public int getOrderID() {
        return emporderID;
    }

    public String getProductID() {
        return productID;
    }

    public String getQuantity() {
        return quantityreq;
    }

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
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void insertDB(int orderID, String prodID, String quantity) {
        try {
            String sql = "INSERT INTO EmpOrders VALUES ('" + orderID + "', '"
                    + prodID + "', '" + quantity + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void insertDBorder(String prodID, String quantity) {
        try {
        String sql = "INSERT INTO EmpOrders (ProductID, QuantityNeeded) VALUES ('" + prodID + "', '" + quantity + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateDB(int orderID, String prodID, String quantity) {
        try {
            String sql = "UPDATE EmpOrders SET EmpOrderID = '" + orderID + "', ProductID = '"
                    + prodID + "', QuanitityNeeded = '" + quantity + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteDB(int orderID) {
        try {
            String sql = "DELETE FROM EmpOrders WHERE EmpOrderID = '" + orderID + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
