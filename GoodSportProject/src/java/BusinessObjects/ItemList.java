package BusinessObjects;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 *   author mitho
 */
public class ItemList {

    /**
     *   return the iCount
     */
    public int getCount() {
        return iCount;
    }
    public ArrayList<Item> iArr = new ArrayList<>();
    public List<Integer> added = new ArrayList<>();
    public String quantities = "";
    public int iCount;
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
    /* returns iArr*/
    public ArrayList getArray(){
        return iArr;
    }
    
/****************************** 
* 
* adds to cart 
*
*******************************/
    public void addToCart(String itemID, String quantity) {
        Item i1 = new Item();
        int id = Integer.parseInt(itemID);
        i1.selectDB(id);
        for (int i = 0; i <= added.size(); i++) {
            if (!(added.contains(id)) && (i == added.size())) {
                quantities = quantities.concat(quantity + ",");
                added.add(id);
                iArr.add(i1);
            }
        }
    }
    /****************************** 
* 
*removes from cart
* 
*******************************/
    public void removeFromCart(String itemID) {
        iArr.remove(Integer.parseInt(itemID));
    }
/****************************** 
* 
* populate cart 
*
*******************************/    
    public void populateCart(String[] cart) {
        for(int i = 0; i < cart.length; i++) {
            String[] item = cart[i].split("x");
            Item i1 = new Item();
            try{
            i1.selectDB(Integer.parseInt(item[0]));
            }catch(Exception e){System.out.println("This is the error I am looking for:" + e);}
            quantities = quantities.concat(item[1] + ",");
            iArr.add(i1);
        }
    }
 /****************************** 
* 
* get all from Inventory table that matches the Sport column
*
*******************************/   
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
/****************************** 
* 
* method to search database inventory item descriptions for
* key words.
* 
*******************************/
    public void get_related(String term){
        
         try {
            String sql = "SELECT * FROM Inventory WHERE description LIKE '% "+term+" %' OR ProductName LIKE '% " + term + "%'" ;
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
/****************************** 
* 
* display all in array
* 
*******************************/    
    public void display(){
        
        
        for(Item i : iArr){
            i.display();
        }
    }
/****************************** 
* 
* overrides to string to turn the cart into a string value. 
* 
*******************************/    
    @Override
    public String toString() {
        String newCart = "";
        String[] quant = quantities.split(",");
            for (int i = 0; i < iArr.size(); i++) {
                newCart = newCart.concat(iArr.get(i).getId() + "x" + quant[i] + ",");
            }
        return newCart;
    }
/****************************** 
*
* Puts all of the ids in the cart into a list to keep duplicates from being added.
*
*******************************/
    public void storeIds() {
         for (int i = 0; i < iArr.size(); i++) {
            int id = iArr.get(i).getId();
            if (!(added.contains(id))) {
                added.add(id);
            }
         }
    }


/****************************** 
* 
* Used to test methods.
*
*******************************/    
    public static void main(String[] args){
        ItemList il = new ItemList();
        il.get_related("Ball");
        il.display();
        
        
        
    }
}
