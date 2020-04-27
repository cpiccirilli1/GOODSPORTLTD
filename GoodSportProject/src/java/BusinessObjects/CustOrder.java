package BusinessObjects;

import java.sql.*;
import java.util.ArrayList;

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
    String itemlist;
    String orderStatus;
    ArrayList<CustOrder> arr = new ArrayList<>();
    //billing variables

    String b_Address;
    String b_LName;
    String b_FName;
    /*****************
     * Constructor for billing information/customer order
     ****************/
    public CustOrder(String id, String lname, String fname, String add, String custPhone,
            String custEmail, String iList, String OrderStatus, String b_add, String b_fname, String b_lname) { 
        custID = id;
        lastname = lname;
        firstname = fname;
        address = add;
        phonenum = custPhone;
        email = custEmail;
        itemlist = iList;
        orderStatus = OrderStatus;
        
        
        //Billing variables
         b_Address  = b_add;
         b_LName = b_lname;
         b_FName = b_fname;
         
    }
    
    public CustOrder(int orderId) { 
        orderID = orderId;
        
         
    }
    
    
    /*************
     *No args constructor
     ****************/
    public CustOrder() {
        orderID = 0;
        custID = "";
        lastname = "";
        firstname = "";
        address = "";
        phonenum = "";
        email = "";
        itemlist = "";
        orderStatus = "";
    }



    /* Get/Set methods */
    public CustOrder(int order, String ID, String lname, String fname, String add, String phone, String mail, String iList, String orderStatus1) {
        
        orderID = order;
        custID = ID;
        lastname = lname;
        firstname = fname;
        address = add;
        phonenum = phone;
        email = mail;
        itemlist = iList;
        orderStatus = orderStatus1;

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
* gets itemlist variable
*
*******************************/
    public String getItemList() {
       return itemlist;
    }
    
    public String getStatus() {
        return orderStatus;
    }

    /***************
     * selectDB selects everything in the database table 
     ************************/
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
                itemlist = rs.getString("ItemList");
                orderStatus = rs.getString("OrderStatus");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    /****************************
     * Selects orders by customer id
     * @param custID 
     ******************************/
    public void selectCustDB(String custID) {
        try {
            String sql = "SELECT * FROM CustOrders WHERE CustId = '" + custID + "'";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                
                
                
                orderID = rs.getInt("OrderID");
                
                
                /*
                *String id, int orderId, String lname, String fname, String add, String custPhone,
            String custEmail, String iList, String OrderStatus, String b_add, String b_fname, String b_lname
                */
                CustOrder z = new CustOrder();
                z.setOrderID(orderID);
                arr.add(z);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    /*************************
     * default insertDB method 
     **************************/
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
    
    /******************************
     * insertDBOrder is a modification of the default insertDB where only specific
     * columns are filled.
    *******************************/
    public void insertDBOrder() {
        try {
            String sql = "INSERT INTO CustOrders ( CustID, LastName, FirstName, Address, PhoneNum, Email, ItemList, OrderStatus, BillingAddress, b_fname, b_lname) VALUES ('" + 
                    custID + "', '" + lastname + "', '" + firstname + "', '" + address + 
                    "', '" + phonenum + "', '" + email + "', '" + itemlist + "', '" + orderStatus +"', '" + b_Address +"', '" + b_FName +"', '" + b_LName + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    /********************************
     * addressGlue is a method used to string together information from multiple data fields.
    ********************************/
    public String addressGlue(String add1, String add2, String city, String state,
            String zip){
        String AddressStr = add1 + "," + add2 + "," + city + "," + state + "," + zip;
        
        return AddressStr;
    }
    
    /********************************
     * updateDB updates the table columns 
     ************************************/
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
    
    /*****************************
     * updateStatus is used to change order status from Open to Shipped 
     *******************************/
    public void updateStatus(int order) {
        try {
            String sql = "UPDATE CustOrders SET OrderStatus = 'Shipped' WHERE OrderID = '" + order + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    /************************ 
     * deleteDB method 
     ***************************/
     public void deleteDB(int order) {
        try {
            String sql = "DELETE FROM CustOrders WHERE OrderID = '" + order + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    

    /**
     * @return the orderID
     */
    public int getOrderID() {
        return orderID;
    }

    /**
     * @param custID the custID to set
     */
    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }
    
    public ArrayList getArr(){
        return arr;
    }

    public void displayArr(){
        for(CustOrder i : arr){
            System.out.println(""+i.getOrderID());
        }
    }
    
    public static void main(String[] args){
       CustOrder c = new CustOrder();
       c.selectCustDB("2");
       c.displayArr();
       
       
        
    }
}
