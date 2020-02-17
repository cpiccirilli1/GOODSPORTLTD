
package BusinessObjects;

import java.sql.*;

/**
 *
 * @author mitho
 */
public class Customer {
    String custId;
    String custPassword;
    String custFirstName;
    String custLastName;
    String custAddress;
    String custPhone;
    String custEmail;
    
    public void Customer() {
        custId = "";
        custPassword = "";
        custFirstName = "";
        custLastName = "";
        custAddress = "";
        custPhone = "";
        custEmail = "";
    }
    
    public void Customer(String Id, String Pswd, String FName, String LName, 
            String Adr, String Phone, String Email) {
        custId = Id;
        custPassword = Pswd;
        custFirstName = FName;
        custLastName = LName;
        custAddress = Adr;
        custPhone = Phone;
        custEmail = Email;
    }
    
    public String getId() {
        return custId;
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
            conn = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\cgoswic1\\Desktop\\GoodSportsDB.accdb");
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
                custId = rs.getString("CustID");
                custFirstName = rs.getString("FirstName");
                custLastName = rs.getString("LastName");
                custAddress = rs.getString("Address");
                custPhone = rs.getString("PhoneNum");
                custEmail = rs.getString("Email");
                custPassword = rs.getString("CustPassword");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void insertDB(String Id, String Pswd, String FName, 
            String LName, String Adr, String Phone,  String Email) {
        try {
            String sql = "INSERT INTO Customers VALUES ('" + Id + "', '" + 
                    Pswd + "', '" + FName + "', '" + LName + "', '" + Adr + 
                    "', '" + Phone + "', '" + Email + "')";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateDB(String passwd, String fName, String lName, String address, String phone, String eMail) {
        try {
            String sql = "UPDATE Customers SET CustID = '" + custId + "', CustPassword = '"
                    + passwd + "', FirstName = '" + fName + "', LastName = '" +
                    lName + "', Address = '" + address + "', PhoneNum = '" + phone + "', Email = '" + eMail +
                    "' WHERE CustID = '" + custId + "'";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteDB() {
        try {
            String sql = "DELETE FROM Customers WHERE CustID = '" + custId + "'";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
