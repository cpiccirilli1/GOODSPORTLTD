package BusinessObjects;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author mitho
 */
public class ItemList {
    public ArrayList<Item> iArr = new ArrayList<>();
    public void findAllItems() {
        try {
            String sql = "SELECT * FROM Inventory";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Item i1 = new Item();
                i1.selectDB(rs.getInt("productID"));
                iArr.add(i1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void addToCart(String itemID) {
        Item i1 = new Item();
        i1.selectDB(Integer.parseInt(itemID));
        iArr.add(i1);
    }
    public void populateCart(String[] cart) {
        for(int i = 0; i < cart.length; i++) {
            Item i1 = new Item();
            i1.selectDB(Integer.parseInt(cart[i]));
            iArr.add(i1);
        }
    }
    
    public ArrayList get_related(String term){
        ArrayList<Item> itemArr = new ArrayList<>();
         try {
            String sql = "SELECT * FROM Inventory Where ProductName='%"+term+"%'";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                Item il = new Item();
                int pid = rs.getInt("ProductID");
                String pName = rs.getString("ProductName");
                String pDisc = rs.getString("Description");
                int quant = rs.getInt("Quantity");
                double price = rs.getDouble("Price");
                String img = rs.getString("Image");
                il.Item(pid,pName,pDisc,quant,price);
                itemArr.add(il);
            }
            
         }
         catch(SQLException ex){
             System.out.println(ex.toString());
         }
         return itemArr;
    }
}
