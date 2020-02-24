package BusinessObjects;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author nkerns
 */
public class OrderList {
    public ArrayList<CustOrder> iArr = new ArrayList<>();
    public void findAllItems() {
        try {
            String sql = "SELECT * FROM CustOrders";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                CustOrder co = new CustOrder();
                co.selectDB(rs.getInt("OrderID"));
                iArr.add(co);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}

