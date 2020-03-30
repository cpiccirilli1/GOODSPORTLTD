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
    String orderStatus;

    public void CustOrder() {
        orderID = 0;
        custID = "";
        lastname = "";
        firstname = "";
        address = "";
        phonenum = "";
        email = "";
        orderStatus = "Open";
    }

    public void CustOrder(int order, String CustID, String lname, String fname, String add, String phone, String mail, String orderStatus) {
        

    }

    public int getOrder() {
        return orderID;
    }
    
    public String getCustID() {
        return custID;
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
    
    public String getStatus() {
        return orderStatus;
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
                orderStatus = rs.getString("OrderStatus");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void insertDB(int order, String CustID, String lname, String fname, String add, String phone, String mail, String orderStatus) {
        try {
            String sql = "INSERT INTO CustOrders VALUES ('"+ order + "', '" + CustID + "', '" + lname + "', '" + fname + "', '" + add + 
                    "', '" + phone + "', '" + mail + "', '" + orderStatus + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
     public void insertDBOrder(String CustID, String lname, String fname, String add, String phone, String mail, String orderStatus) {
        try {
            String sql = "INSERT INTO CustOrders (CustID, LastName, FirstName, Address, PhoneNum, Email, OrderStatus) VALUES ('" + CustID + "', '" + lname + "', '" + fname + "', '" + add + 
                    "', '" + phone + "', '" + mail + "', '" + orderStatus + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateDB(int order, String ID, String lname, String fname, String add, String phone, String mail, String orderStatus) {
    try {
            String sql = "UPDATE CustOrders SET OrderID = '" + order + "', CustID = '"
                    + ID + "', LastName = '" + lname + "', FirstName = '" +
                    fname + "', Address = '" + add + "', PhoneNum = '" + phone + "', Email = '" + mail + "', OrderStatus = '" + orderStatus + "' WHERE CustID = '" + ID + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateStatus(int order) {
        try {
            String sql = "UPDATE CustOrders SET OrderStatus = 'Shipped' WHERE OrderID = '" + order + "'";
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
     
     public void display() {
        System.out.println("OrderID: " + this.getOrder());
        System.out.println("LastName: " + this.getLname());
        System.out.println("FirstName: " + this.getFname());
        System.out.println("Address: " + this.getAddress());
        System.out.println("PhoneNo: " + this.getPhone());
        System.out.println("Email: " + this.getEmail());
        System.out.println("OrderStatus: " + this.getStatus());
                }
     public static void main(String[] args) {
         CustOrder c1 = new CustOrder();
         c1.insertDBOrder("1235", "Honey", "Dan", "546 New Road,,State", "4445556666", "danhoney@mail.com", "Open");
         c1.display();
     }
     
}
