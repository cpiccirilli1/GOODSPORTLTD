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
    public void addToCart(Item i1) {
        try {
            iArr.add(i1);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
