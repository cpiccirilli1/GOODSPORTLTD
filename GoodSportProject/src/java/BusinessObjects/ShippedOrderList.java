package BusinessObjects;
import java.sql.*;
import java.util.ArrayList;


/**
 *
 *   author natha
 */
public class ShippedOrderList {
    public ArrayList<CustOrder> iArr = new ArrayList<>();
    /****************************** 
* 
* selects all shipped orders from CustOrders
*
*******************************/
    public void findShippedItems() {
        try {
            String sql = "SELECT * FROM CustOrders WHERE OrderStatus = 'Shipped'";
            
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                CustOrder co2 = new CustOrder();
                co2.selectDB(rs.getInt("OrderID"));
                iArr.add(co2);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
