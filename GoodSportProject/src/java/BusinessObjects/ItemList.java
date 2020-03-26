package BusinessObjects;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mitho
 */
public class ItemList {
    public ArrayList<Item> iArr = new ArrayList<>();
    private List<Integer> added = new ArrayList<>();
    int iCount;
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
    
    public ArrayList getArray(){
        return this.iArr;
    }
    
    
    public void addToCart(String itemID) {
        Item i1 = new Item();
        int id = Integer.parseInt(itemID);
        i1.selectDB(id);
        for (int i = 0; i <= added.size(); i++) {
            if (!(added.contains(id)) && (i == added.size())) {
                added.add(id);
                iArr.add(i1);
            }
        }
    }
    
    public void removeFromCart(String itemID) {
        System.out.println(iArr.remove(Integer.parseInt(itemID)));
    }
    
    public void populateCart(String[] cart) {
        for(int i = 0; i < cart.length; i++) {
            Item i1 = new Item();
            i1.selectDB(Integer.parseInt(cart[i]));
            iArr.add(i1);
        }
    }
    
    public void selectSportDB(String sport){
        try{
            String sql = "SELECT * FROM Inventory WHERE Sport = '" + sport + "'";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Item i1 = new Item();
                i1.selectDB(rs.getInt("productID"));
                iArr.add(i1);
            }
            iCount = iArr.size();
            
        }
        catch (Exception e) {
            System.out.println(e);
        }
    
    }

    public void get_related(String term){
        
         try {
            String sql = "SELECT * FROM Inventory WHERE description LIKE '% "+term+" %'";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){
                Item il = new Item();
                il.setProductID(rs.getInt("ProductID"));
                il.setProductName(rs.getString("ProductName"));
                il.setProductDesc(rs.getString("Description"));
                il.setCategory(rs.getString("Category"));
                il.setSport(rs.getString("Sport"));
                il.setQuantity(rs.getInt("Quantity"));
                il.setPrice(rs.getDouble("Price"));
                il.setImgLink(rs.getString("ImageLink"));
                
                iArr.add(il);
    
            //int id, String name, String desc, String cat, String sprt, int quant, double pri, String img
            }
            iCount = iArr.size();
         }
         catch(SQLException ex){
             System.out.println(ex.toString());
         }
         
    }
    
    public void display(){
        
        
        for(Item i : iArr){
            i.display();
        }
    }
    
    @Override
    public String toString() {
        String newCart = "";
            for (int i = 0; i < iArr.size(); i++) {
                newCart = newCart.concat(iArr.get(i).getId() + ",");
            }
        return newCart;
    }
    
    public static void main(String[] args){
        ItemList list = new ItemList();
        list.selectSportDB("football");
        list.display();
        
        
    }
}
