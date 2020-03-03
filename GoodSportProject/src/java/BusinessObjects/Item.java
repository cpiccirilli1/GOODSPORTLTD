
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
    String category;
    String sport;
    int quantity;
    double price;
    String imgLink;
    
    public void Item() {
        productID = 0;
        productName = "";
        productDesc = "";
        category = "";
        sport = "";
        quantity = 0;
        price = 0.00;
        imgLink =" ";
    }
    
    public void Item(int id, String name, String desc, String cat, String sprt, int quant, double pri, String img) {
        productID = id;
        productName = name;
        productDesc = desc;
        category = cat;
        sport = sprt;
        quantity = quant;
        price = pri;
        imgLink = img;
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
    public String getCategory() {
        return category;
    }
    public String getSport() {
        return sport;
    }
    
    public int getQuantity() {
        return quantity;
    }
    
    public double getPrice() {
        return price;
    }
    public String getimgLink() {
        return imgLink;
    }
    
    public void selectDB(int ID) {
        try {
            String sql = "SELECT * FROM Inventory WHERE ProductID = '" + ID + "'";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                productID = rs.getInt("ProductID");
                productName = rs.getString("ProductName");
                productDesc = rs.getString("Description");
                quantity = rs.getInt("Quantity");
                price = rs.getDouble("Price");
                imgLink = rs.getString("ImageLink");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void insertDB(int Id, String ProductName, String Description, String cat, String sprt, int Quantity, Double Price, String imgLink) {
        try {
            String sql = "INSERT INTO Inventory VALUES ('" + Id + "', '" + ProductName + "', '" + Description + "', '" + cat + "', '" + sprt + "', '" + Quantity + "', '" + Price + ", " + imgLink +"')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateDB(String ProductName, String Description, String cat, String sprt, int Quantity, Double Price) {
        try {
            String sql = "UPDATE Inventory SET ProductID = '" + productID + "', ProductName = '"
                    + ProductName + "', Description = '" + Description + "', Category = '" + cat + "', Sport = '" + sprt + "', Quantity = '" +
                    Quantity + "', Price = '" + Price + "', ImageLink = '" + imgLink +
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
    
    public void display(){
        System.out.println(this.getId());
        System.out.println(this.getPrice());
        System.out.println(this.getProdDesc());
        System.out.println(this.getProdName());
        System.out.println(this.getQuantity());
                
    }
    
}
