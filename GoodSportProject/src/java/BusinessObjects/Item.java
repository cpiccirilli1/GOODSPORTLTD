
package BusinessObjects;

import java.sql.*;

/**
 *
 * @author mitho
 */
public class Item {
    int productID;
    String productName;
    String productDesc;
    int quantity;
    double price;
    
    public void Item() {
        productID = 0;
        productName = "";
        productDesc = "";
        quantity = 0;
        price = 0.00;
    }
    
    public void Item(int id, String name, String desc, int quant, double pri) {
        productID = id;
        productName = name;
        quantity = quant;
        price = pri;
    }
    
    public int getId() {
        return productID;
    }
    
    public String getProdName() {
        return productName;
    }
    
    public String getProdDesc() {
        return productDesc;
    }
    
    public int getQuantity() {
        return quantity;
    }
    
    public double getPrice() {
        return price;
    }
    
    public void selectDB(int ID) {
        try {
            String sql = "SELECT * FROM Inventory WHERE ProductID = '" + ID + "'";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                productID = rs.getInt("ProductID");
                productName = rs.getString("ProductName");
                productDesc = rs.getString("PlaceholderText");
                quantity = rs.getInt("Quantity");
                price = rs.getDouble("Price");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void insertDB(int Id, String ProductName, String PlaceholderText, 
            int Quantity, Double Price) {
        try {
            String sql = "INSERT INTO Inventory VALUES ('" + Id + "', '" + 
                    ProductName + "', '" + PlaceholderText + "', '" + Quantity + "', '" + Price + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateDB(String ProductName, String PlaceholderText, int Quantity, Double Price) {
        try {
            String sql = "UPDATE Inventory SET ProductID = '" + productID + "', ProductName = '"
                    + ProductName + "', PlaceholderText = '" + PlaceholderText + "', Quantity = '" +
                    Quantity + "', Price = '" + Price +
                    "' WHERE ProductID = '" + productID + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteDB() {
        try {
            String sql = "DELETE FROM Inventory WHERE ProductID = '" + productID + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public int numItems() {
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) AS rows FROM Inventory";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            count = rs.getInt("rows");
            return count;
        } catch(Exception e) {
            System.out.println(e);
        }
        return count;
    }
}
