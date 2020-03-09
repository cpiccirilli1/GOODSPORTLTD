
package BusinessObjects;

import java.sql.*;

/**
 *
 * @author mitho
 */
public class Item {


    private int productID;
    private String productName;
    private String productDesc;
    private String category;
    private String sport;
    private int quantity;
    private double price;
    private String imgLink;
    private ItemList iList;
    
    public void Item() {
        setProductID(0);
        setProductName("");
        setProductDesc("");
        setCategory("");
        setSport("");
        setQuantity(0);
        setPrice(0.00);
        setImgLink(" ");
    }
    
    public void Item(int id, String name, String desc, String cat, String sprt, int quant, double pri, String img) {
        setProductID(id);
        setProductName(name);
        setProductDesc(desc);
        setCategory(cat);
        setSport(sprt);
        setQuantity(quant);
        setPrice(pri);
        setImgLink(img);
    }
    
     /**
     *   productID the productID to set
     */
    public void setProductID(int productID) {
        this.productID = productID;
    }

    /**
     *   productName the productName to set
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     *   productDesc the productDesc to set
     */
    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    /**
     *   category the category to set
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     *   sport the sport to set
     */
    public void setSport(String sport) {
        this.sport = sport;
    }

    /**
     *   quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     *   price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     *   imgLink the imgLink to set
     */
    public void setImgLink(String imgLink) {
        this.imgLink = imgLink;
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
                setProductID(rs.getInt("ProductID"));
                setProductName(rs.getString("ProductName"));
                setProductDesc(rs.getString("Description"));
                setSport(rs.getString("Sport"));
                setCategory(rs.getString("Category"));
                setQuantity(rs.getInt("Quantity"));
                setPrice(rs.getDouble("Price"));
                setImgLink(rs.getString("ImageLink"));
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
    
    public void updateQuantity(int Quantity) {
        try {
            String sql = "UPDATE Inventory SET Quantity = '" +
                    Quantity + "' WHERE ProductID = '" + productID + "'";
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
        //int id, String name, String desc, String cat, String sprt, int quant, double pri, String img
        
        String div = "**********************";
        System.out.println(div);
        System.out.println("Prod. Name: "+this.getProdName());
        System.out.println("Prod. ID: "+this.getId());
        System.out.println("Prod. Price: "+this.getPrice());
        System.out.println("Prod. Desc: "+this.getProdDesc());
        System.out.println("Prod. Cat.: "+this.getCategory());
        System.out.println("Prod. Sport: "+this.getSport());
        System.out.println("IMG: "+this.getimgLink());
        System.out.println("QUANTITY: "+this.getQuantity());
                
    }
    
    public static void main(String[] args){
        Item i = new Item();
        i.selectDB(1);
        i.display();
        
    }
    
}
