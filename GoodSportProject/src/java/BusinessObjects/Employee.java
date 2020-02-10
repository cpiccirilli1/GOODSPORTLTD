
package BusinessObjects;

import java.sql.*;

/**
 *
 * @author mitho
 */
public class Employee {
    String empId;
    String empPassword;
    String empFirstName;
    String empLastName;
    String empEmail;
    
    public void Employee() {
        empId = "";
        empPassword = "";
        empFirstName = "";
        empLastName = "";
        empEmail = "";
    }
    
    public void Employee(String Id, String Pswd, String FName, String LName, 
            String Email) {
        empId = Id;
        empPassword = Pswd;
        empFirstName = FName;
        empLastName = LName;
        empEmail = Email;
    }
    
    public String getId() {
        return empId;
    }
    
    public String getPassword() {
        return empPassword;
    }
    
    public String getFName() {
        return empFirstName;
    }
    
    public String getLName() {
        return empLastName;
    }
    
    public String getEmail() {
        return empEmail;
    }
    
    private Statement connectDB() {
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection conn;
            //Edit this next line of code starting with C: to the file path of the database
            conn = DriverManager.getConnection("jdbc:ucanaccess://C:" +
                    "\\Users\\mitho\\GoodSportsDB.accdb");
            Statement stmt = conn.createStatement();
            return stmt;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void selectDB(String Email) {
        try {
            String sql = "SELECT * FROM Employees WHERE Email = '" + Email + "'";
            Statement stmt = connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                empId = rs.getString("CustID");
                empFirstName = rs.getString("FirstName");
                empLastName = rs.getString("LastName");
                empEmail = rs.getString("Email");
                empPassword = rs.getString("CustPassword");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void insertDB(String Id, String Pswd, String FName, 
            String LName, String Email) {
        try {
            String sql = "INSERT INTO Employees VALUES ('" + Id + "', '" + 
                    Pswd + "', '" + FName + "', '" + LName + "', '" + Email + "')";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateDB(String passwd, String fName, String lName, String eMail) {
        try {
            String sql = "UPDATE Employees SET EmpID = '" + empId + "', EmpPassword = '"
                    + passwd + "', FirstName = '" + fName + "', LastName = '" +
                    lName + "', Email = '" + eMail +
                    "' WHERE EmpID = '" + empId + "'";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteDB() {
        try {
            String sql = "DELETE FROM Employees WHERE EmpID = '" + empId + "'";
            Statement stmt = connectDB();
            stmt.execute(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
