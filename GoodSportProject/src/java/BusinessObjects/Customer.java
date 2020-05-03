
package BusinessObjects;

import java.sql.*;

/**
 *
 *    mitho
 */
public class Customer {
    /**
     *   @param cart the cart to set
     */
    public void setCart(String cart) {
        this.cart = cart;
    }

    /**
     *    @return custId the custId
     */
    public String getCustId() {
        return custId;
    }

    /**
     * 
     * @param custId
     *  custId the custId to set
     */
    public void setCustId(String custId) {
        this.custId = custId;
    }


    /**
     *   
     * @param custPassword
     *  custPassword the custPassword to set
     */
    public void setCustPassword(String custPassword) {
        this.custPassword = custPassword;
    }

    /**
     *   
     * @param custFirstName
     *  custFirstName the custFirstName to set
     */
    public void setCustFirstName(String custFirstName) {
        this.custFirstName = custFirstName;
    }

    /**
     *   
     * @param custLastName
     *  custLastName the custLastName to set
     */
    public void setCustLastName(String custLastName) {
        this.custLastName = custLastName;
    }

    /**
     * @param custAddress
     *  custAddress the custAddress to set
     */
    public void setCustAddress(String custAddress) {
        this.custAddress = custAddress;
    }

    /**
     * @param custPhone
     *   custPhone the custPhone to set
     */
    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone;
    }

    /**
     * @param custEmail
     *   custEmail the custEmail to set
     */
    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail;
    }
    private String custId;
    private String custPassword;
    private String custFirstName;
    private String custLastName;
    private String custAddress;
    private String custPhone;
    private String custEmail;
    private String cart;
    
        
/****************************** 
* Blank constructor
*
*******************************/
    public void Customer() {
        setCustId("");
        setCustPassword("");
        setCustFirstName("");
        setCustLastName("");
        setCustAddress("");
        setCustPhone("");
        setCustEmail("");
        setCart("");
       
    }
        
/****************************** 
* Constructor that sets all variables
*
     * @param Id
     *  Id
     * @param Pswd
     *  pasword
     * @param FName
     *  first name
     * @param LName
     *  Last name
     * @param Adr
     *  Address
     * @param Phone
     * Phone
     * @param Email
     * Email
     * @param cart
     * Cart
*******************************/
    public void Customer(String Id, String Pswd, String FName, String LName, 
            String Adr, String Phone, String Email, String cart) {
        setCustId(Id);
        setCustPassword(Pswd);
        setCustFirstName(FName);
        setCustLastName(LName);
        setCustAddress(Adr);
        setCustPhone(Phone);
        setCustEmail(Email);
        setCart(cart);
    }
    /*gets custId*/
    public String getId() {
        return getCustId();
    }
    /*gets custPassword*/
    public String getPassword() {
        return custPassword;
    }
    /*gets FName Variable */
    public String getFName() {
        return custFirstName;
    }
    /*gets custLastName variable*/
    public String getLName() {
        return custLastName;
    }
    
    /*gets custAddress Variable*/
    public String getAddr() {
        return custAddress;
    }
    /*gets custPhone variable*/
    public String getPhone() {
        return custPhone;
    }
  /*gets email variable*/  
    public String getEmail() {
        return custEmail;
    }
    
    /**
     * @return 
     *  the cart
     */
    public String getCart() {
        return cart;
    }
        
/****************************** 
     * @return 
     * Main database connection Statement
* Update path if needed.  
*******************************/
    protected static Statement connectDB() {
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection conn;
            //Edit this next line of code starting with C: to the file path of the database
            conn = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\coope\\OneDrive\\Documents\\Database\\GoodSportsDB.accdb");
            Statement stmt = conn.createStatement();
            return stmt;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return null;
    }
        
/****************************** 
* 
*
     * @param Email
     * pulls customers from database using email address
*******************************/
    public void selectDB(String Email) {
        try {
            String sql = "SELECT * FROM Customers WHERE Email = '" + Email + "'";
            Statement stmt = connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                setCustId(rs.getString("CustID"));
                setCustFirstName(rs.getString("FirstName"));
                setCustLastName(rs.getString("LastName"));
                setCustAddress(rs.getString("Address"));
                setCustPhone(rs.getString("PhoneNum"));
                setCustEmail(rs.getString("Email"));
                setCustPassword(rs.getString("CustPassword"));
                setCart(rs.getString("ShoppingCart"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
        
/****************************** 
* inserts into customer table
*
     * @param Id
     *  Id
     * @param Pswd
     *  pasword
     * @param FName
     *  first name
     * @param LName
     *  Last name
     * @param Adr
     *  Address
     * @param cart
     * cart
     * @param Phone
     * Phone
     * @param Email
     * Email
*******************************/
    public void insertDB(String Id, String Pswd, String FName, 
            String LName, String Adr, String Phone,  String Email, String cart) {
        try {
            String sql = "INSERT INTO Customers VALUES ('" + Id + "', '" + 
                    Pswd + "', '" + FName + "', '" + LName + "', '" + Adr + 
                    "', '" + Phone + "', '" + Email + "', '" + cart + "')";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
        
/****************************** 
* A different insert into the customer table
*
     * @param Pswd
     *  pasword
     * @param FName
     *  first name
     * @param LName
     *  Last name
     * @param Adr
     *  Address
     * @param Phone
     * Phone
     * @param Email
     * Email
*******************************/
    public void insertDB2(String LName, String FName, String Adr, String Phone, String Email, String Pswd) {
        try {
            String sql = "INSERT INTO Customers (LastName, FirstName, Address, PhoneNum, Email, CustPassword) VALUES ('" + LName + "', '" + FName + "','" + Adr + "','" + Phone + "','" + Email + "','" + Pswd + "')";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }            

        
/****************************** 
* Updates line based on customer id
*
     * @param passwd
     *password
     * @param fName
     * first name
     * @param lName
     * Last name
     * @param address
     * Address
     * @param cart
     * cart
     * @param phone
     * Phone
     * @param eMail
     * Email
*******************************/
    public void updateDB(String passwd, String fName, String lName, String address, String phone, String eMail, String cart) {
        try {
            String sql = "UPDATE Customers SET CustID = '" + getCustId() + "', CustPassword = '"
                    + passwd + "', FirstName = '" + fName + "', LastName = '" +
                    lName + "', Address = '" + address + "', PhoneNum = '" + phone + "', Email = '" + eMail +
                    "', ShoppingCart='"+ cart +
                    "' WHERE CustID = '" + getCustId() + "'";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
/****************************** 
*
     * @param cart
     * updates the customer ShoppingCart based on customer id
*******************************/
    public void updateCart(String cart) {
        try {
            String sql = "UPDATE Customers Set ShoppingCart = '" + cart + "' WHERE CustID = '" + getCustId() + "'";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
        
/****************************** 
* deletes a line based on custid
*
*******************************/
    public void deleteDB() {
        try {
            String sql = "DELETE FROM Customers WHERE CustID = '" + getCustId() + "'";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
        
/****************************** 
* Displays all variables in class
*
*******************************/
    public void Display(){
        System.out.println("ID: " + this.getId());
        System.out.println("FName: "+this.getFName());
        System.out.println("LName: "+this.getLName());
        System.out.println("Email: "+this.getEmail());
        System.out.println("Addr: "+this.getAddr());
        System.out.println("Pass: "+this.getPassword());
        System.out.println("Phone: "+this.getPhone());
        System.out.println("Cart: "+this.getCart());
    }
        
/****************************** 
*
     * @param args
        Tests class
*******************************/
    public static void main(String[] args){
        Customer c1 = new Customer();
        c1.selectDB("johndoe1@mail.com");
        c1.updateDB("sesame", "jane", "doe", "1234 Sanity St.,apt B,New York,NY,303030","5555555", "janedoe1@mail.com", " ");
        
        c1.selectDB("janedoe1@mail.com");
        c1.Display();
        
    }
}
