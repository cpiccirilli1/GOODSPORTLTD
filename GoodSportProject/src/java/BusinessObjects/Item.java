/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
    
    private Statement connectDB() {
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection conn;
            //Edit this next line of code starting with C: to the file path of the database
            conn = DriverManager.getConnection("jdbc:ucanaccess://C:" +
                    "\\Users\\mitho\\GoodSportsDB.accdb");
            Statement stmt = conn.createStatement();
            return stmt;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void selectDB(int ID) {
        try {
            String sql = "SELECT * FROM Inventory WHERE ProductID = '" + "'";
            Statement stmt = connectDB();
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
}
