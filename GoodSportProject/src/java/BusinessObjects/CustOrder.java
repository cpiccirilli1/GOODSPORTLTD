package BusinessObjects;

import java.sql.*;

/**
 *
 *   author natha
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
    
    /* No args constructor */
    public void CustOrder() {
        orderID = 0;
        custID = "";
        lastname = "";
        firstname = "";
        address = "";
        phonenum = "";
        email = "";
        orderStatus = "";
    }

    /* Get/Set methods */
    public void CustOrder(int order, String ID, String lname, String fname, String add, String phone, String mail, String orderStatus) {
        

    }

/***********  
* Gets the number of orders in the database
*
*************/
    public int getOrder() {
        int i = 0;
        try {
            String sql = "SELECT COUNT(*) AS count FROM CustOrders";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            i = rs.getInt("count");
            System.out.println(i);
        } catch (Exception e) {
            System.out.println(e);
        }
        return i++;
    }
    
/****************************** 
* Gets orderId variable 
*
*******************************/
    public int getOrderId() {
        return orderID;
    }
    
/****************************** 
* gets Lname variable
*
*******************************/
    public String getLname() {
        return lastname;
    }
    
/****************************** 
* gets Fname variable
*
*******************************/
    public String getFname() {
        return firstname;
    }
    
/****************************** 
* Gets address variable
*
*******************************/
    public String getAddress() {
        return address;
    }
    
/****************************** 
* gets phone number variable
*
*******************************/
    public String getPhone() {
        return phonenum;
    }
    
/****************************** 
* gets email variable
*
*******************************/
    public String getEmail() {
        return email;
    }
        
/****************************** 
* gets orderStatus variable
*
*******************************/
    public String getStatus() {
        return orderStatus;
    }

    /* selectDB selects everything in the database table */
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
    
    /* default insertDB method */
    public void insertDB(int order, String ID, String lname, String fname, String add, String phone, String mail, String orderStatus) {
        try {
            String sql = "INSERT INTO CustOrders VALUES ('" + order + "', '" + 
                    ID + "', '" + lname + "', '" + fname + "', '" + add + 
                    "', '" + phone + "', '" + mail + "', '" + orderStatus + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    /* insertDBOrder is a modifcation of the default insertDB where only specific
    columns are filled.
    */
    public void insertDBOrder(String ID, String lname, String fname, String add, String phone, String mail, String orderStatus) {
        try {
            String sql = "INSERT INTO CustOrders ( CustID, LastName, FirstName, Address, PhoneNum, Email, OrderStatus ) VALUES ('" + 
                    ID + "', '" + lname + "', '" + fname + "', '" + add + 
                    "', '" + phone + "', '" + mail + "', '" + orderStatus + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    /* addressGlue is a method used to string together information from multiple
    data fields.
    */
    public String addressGlue(String add1, String add2, String city, String state,
            String zip){
        String AddressStr = add1 + "," + add2 + "," + city + "," + state + "," + zip;
        
        return AddressStr;
    }
    
    /* updateDB updates the table columns */
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
    
    /* updateStatus is used to change order status from Open to Shipped */
    public void updateStatus(int order) {
        try {
            String sql = "UPDATE CustOrders SET OrderStatus = 'Shipped' WHERE OrderID = '" + order + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    /* deleteDB method */
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
