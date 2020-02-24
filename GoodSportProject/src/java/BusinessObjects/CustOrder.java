package BusinessObjects;

import java.sql.*;

/**
 *
 * @author natha
 */
public class CustOrder {

    int orderID;
    String custID;
    String lastname;
    String firstname;
    String address;
    String phonenum;
    String email;
    //boolean orderStatus;

    public void CustOrder() {
        orderID = 0;
        custID = "";
        lastname = "";
        firstname = "";
        address = "";
        phonenum = "";
        email = "";
        //orderStatus = false;
    }

    public void CustOrder(int order, String ID, String lname, String fname, String add, String phone, String mail /*boolean status*/) {
        
        //orderStatus = status;
    }

    public int getOrder() {
        return orderID;
    }

    public String getLname() {
        return lastname;
    }

    public String getFname() {
        return firstname;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phonenum;
    }

    public String getEmail() {
        return email;
    }

    public void selectDB(int OrderID) {
        try {
            String sql = "SELECT * FROM CustOrders WHERE OrderID = '" + OrderID + "'";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                orderID = rs.getInt("OrderID");
                custID = rs.getString("CustID");
                lastname = rs.getString("LastName");
                firstname = rs.getString("FirstName");
                address = rs.getString("Address");
                phonenum = rs.getString("PhoneNum");
                email = rs.getString("Email");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void insertDB(int order, String ID, String lname, String fname, String add, String phone, String mail /*boolean status*/) {
        try {
            String sql = "INSERT INTO CustOrders VALUES ('" + order + "', '" + 
                    ID + "', '" + lname + "', '" + fname + "', '" + add + 
                    "', '" + phone + "', '" + mail + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateDB(int order, String ID, String lname, String fname, String add, String phone, String mail /*boolean status*/) {
    try {
            String sql = "UPDATE CustOrders SET OrderID = '" + order + "', CustID = '"
                    + ID + "', LastName = '" + lname + "', FirstName = '" +
                    fname + "', Address = '" + add + "', PhoneNum = '" + phone + "', Email = '" + mail +
                    "' WHERE CustID = '" + ID + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
     public void deleteDB(int order) {
        try {
            String sql = "DELETE FROM CustOrders WHERE OrderID = '" + order + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}