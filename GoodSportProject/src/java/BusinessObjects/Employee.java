
package BusinessObjects;

import java.sql.*;

/**
 *
 *    mitho
 */
public class Employee {
    String empId;
    String empPassword;
    String empFirstName;
    String empLastName;
    String empEmail;
        
/****************************** 
* 
*Empty constructor
*******************************/
    public void Employee() {
        empId = "";
        empPassword = "";
        empFirstName = "";
        empLastName = "";
        empEmail = "";
    }
        
/****************************** 
* 
*setter constructor
* String Id, String Pswd, String FName, String LName, String Email
     * @param Id
     * ID
     * @param Pswd
     * Password
     * @param FName
     * First Name
     * @param LName
     * Last Name
     * @param Email
     * Email
*******************************/
    public void Employee(String Id, String Pswd, String FName, String LName, 
            String Email) {
        empId = Id;
        empPassword = Pswd;
        empFirstName = FName;
        empLastName = LName;
        empEmail = Email;
    }
    
/****************************** 
* 
     * @return 
     * returns empId
*******************************/
    public String getId() {
        return empId;
    }
/****************************** 
* 
     * @return 
     * returns empPassword
*******************************/
    public String getPassword() {
        return empPassword;
    }
/****************************** 
*  
     * @return 
     * returns empFName
*******************************/
    public String getFName() {
        return empFirstName;
    }
/****************************** 
*
     * @return 
     * returns empLastName
*******************************/    
    public String getLName() {
        return empLastName;
    }
/****************************** 
* 
     * @return 
     * returns empEmail
*******************************/    
    public String getEmail() {
        return empEmail;
    }
/****************************** 
* 
     * @param Email
     * select statement to fill class based on email variable
*******************************/    
    public void selectDB(String Email) {
        try {
            String sql = "SELECT * FROM Employees WHERE EmpEmail = '" + Email + "'";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                empId = rs.getString("EmpID");
                empFirstName = rs.getString("FirstName");
                empLastName = rs.getString("LastName");
                empEmail = rs.getString("EmpEmail");
                empPassword = rs.getString("EmpPassword");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
/****************************** 
* 
* inserts into the employees database
     * @param Id
     * ID
     * @param Pswd
     * Password
     * @param FName
     * Fist Name
     * @param LName
     * Last Name
     * @param Email
     * Email
*******************************/    
    public void insertDB(String Id, String Pswd, String FName, 
            String LName, String Email) {
        try {
            String sql = "INSERT INTO Employees VALUES ('" + Id + "', '" + 
                    Pswd + "', '" + FName + "', '" + LName + "', '" + Email + "')";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
/****************************** 
* 
*updates employees database
     * @param passwd
     * Password
     * @param fName
     * First Name
     * @param lName
     * Last Name
     * @param eMail
     * Email
*******************************/    
    public void updateDB(String passwd, String fName, String lName, String eMail) {
        try {
            String sql = "UPDATE Employees SET EmpID = '" + empId + "', EmpPassword = '"
                    + passwd + "', FirstName = '" + fName + "', LastName = '" +
                    lName + "', EmpEmail = '" + eMail +
                    "' WHERE EmpID = '" + empId + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
/****************************** 
* 
*deletes from employees database
*******************************/    
    public void deleteDB() {
        try {
            String sql = "DELETE FROM Employees WHERE EmpID = '" + empId + "'";
            Statement stmt = Customer.connectDB();
            stmt.execute(sql);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
