
package BusinessObjects;

import java.sql.*;

/**
 *
 * @author mitho
 */
public class Customer {

    /**
     * @return the cart
     */
    public String getCart() {
        return cart;
    }

    /**
     * @param cart the cart to set
     */
    public void setCart(String cart) {
        this.cart = cart;
    }

    /**
     * @return the custId
     */
    public String getCustId() {
        return custId;
    }

    /**
     * @param custId the custId to set
     */
    public void setCustId(String custId) {
        this.custId = custId;
    }


    /**
     * @param custPassword the custPassword to set
     */
    public void setCustPassword(String custPassword) {
        this.custPassword = custPassword;
    }

    /**
     * @param custFirstName the custFirstName to set
     */
    public void setCustFirstName(String custFirstName) {
        this.custFirstName = custFirstName;
    }

    /**
     * @param custLastName the custLastName to set
     */
    public void setCustLastName(String custLastName) {
        this.custLastName = custLastName;
    }

    /**
     * @param custAddress the custAddress to set
     */
    public void setCustAddress(String custAddress) {
        this.custAddress = custAddress;
    }

    /**
     * @param custPhone the custPhone to set
     */
    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone;
    }

    /**
     * @param custEmail the custEmail to set
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
    
    public String getId() {
        return getCustId();
    }
    
    public String getPassword() {
        return custPassword;
    }
    
    public String getFName() {
        return custFirstName;
    }
    
    public String getLName() {
        return custLastName;
    }
    
    public String getAddr() {
        return custAddress;
    }
    
    public String getPhone() {
        return custPhone;
    }
    
    public String getEmail() {
        return custEmail;
    }
    
    protected static Statement connectDB() {
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection conn;
            //Edit this next line of code starting with C: to the file path of the database
            conn = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\mitho\\GoodSportsDB.accdb");
            Statement stmt = conn.createStatement();
            return stmt;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
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
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void insertDB(String Id, String Pswd, String FName, 
            String LName, String Adr, String Phone,  String Email, String cart) {
        try {
            String sql = "INSERT INTO Customers VALUES ('" + Id + "', '" + 
                    Pswd + "', '" + FName + "', '" + LName + "', '" + Adr + 
                    "', '" + Phone + "', '" + Email + "', '" + cart + "')";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateDB(String passwd, String fName, String lName, String address, String phone, String eMail, String cart) {
        try {
            String sql = "UPDATE Customers SET CustID = '" + getCustId() + "', CustPassword = '"
                    + passwd + "', FirstName = '" + fName + "', LastName = '" +
                    lName + "', Address = '" + address + "', PhoneNum = '" + phone + "', Email = '" + eMail +
                    "', ShoppingCart='"+ cart +
                    "' WHERE CustID = '" + getCustId() + "'";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteDB() {
        try {
            String sql = "DELETE FROM Customers WHERE CustID = '" + getCustId() + "'";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
