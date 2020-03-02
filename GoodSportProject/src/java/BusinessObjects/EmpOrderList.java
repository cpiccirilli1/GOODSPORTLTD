package BusinessObjects;
import java.sql.*;
import java.util.ArrayList;
/**
 *
 * @author natha
 */
public class EmpOrderList {
    public ArrayList<EmpOrder> iArr = new ArrayList<>();
    public void findAllItems() {
        try {
            String sql = "SELECT * FROM EmpOrders";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                EmpOrder eOrder = new EmpOrder();
                eOrder.selectDB(rs.getInt("EmpOrderID"));
                iArr.add(eOrder);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
