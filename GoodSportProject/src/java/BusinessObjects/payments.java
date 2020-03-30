/**
 *  Business Object for handling inserting credit card records.
 *  OrderID needs to be "Number -> general number"
 */
package BusinessObjects;

import java.sql.*;

/**
 *
 *   cpicciri
 */
public class payments {

    /**
     *  the payId
     */
    public int getPayId() {
        return payId;
    }

    /**
     * payId the payId to set
     */
    public void setPayId(int payId) {
        this.payId = payId;
    }

    /**
     *   the fname
     */
    public String getFname() {
        return fname;
    }

    /**
     *   param fname the fname to set
     */
    public void setFname(String fname) {
        this.fname = fname;
    }

    /**
     *   the lname
     */
    public String getLname() {
        return lname;
    }

    /**
     *   param lname the lname to set
     */
    public void setLname(String lname) {
        this.lname = lname;
    }

    /**
     *   the email
     */
    public String getEmail() {
        return email;
    }

    /**
     *   param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     *   the currency
     */
    public Double getCurrency() {
        return currency;
    }

    /**
     *   param currency the currency to set
     */
    public void setCurrency(Double currency) {
        this.currency = currency;
    }

    /**
     *   the cardNumber
     */
    public String getCardNumber() {
        return cardNumber;
    }

    /**
     *   param cardNumber the cardNumber to set
     */
    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    /**
     *   the exp
     */
    public String getExp() {
        return exp;
    }

    /**
     *   param exp the exp to set
     */
    public void setExp(String exp) {
        this.exp = exp;
    }

    /**
     *   the cvc
     */
    public String getCvc() {
        return cvc;
    }

    /**
     *   param cvc the cvc to set
     */
    public void setCvc(String cvc) {
        this.cvc = cvc;
    }
    
    private int payId;
    private String fname;
    private String lname;
    private String email;
    private Double currency;
    private String cardNumber;
    private String exp;
    private String cvc;
    
    
    public void payments(){
        this.setPayId(0);
        this.setFname("");
        this.setLname("");
        this.setEmail("");
        this.setCurrency(0.0);
        this.setCardNumber("");
        this.setExp("");
        this.setCvc("");
    }
    
    
    public void payments( int payId, String fname, String lname, String email, Double currency,
            String card, String exp, String cvc){
        this.setPayId(payId);
        this.setFname(fname);
        this.setLname(lname);
        this.setEmail(email);
        this.setCurrency(currency);
        this.setCardNumber(card);
        this.setExp(exp);
        this.setCvc(cvc);
    }
    
    
    public void insertDB(){
        
        try{
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection conn;
            //Edit this next line of code starting with C: to the file path of the database
            conn = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\cpicciri\\Documents\\Database\\GoodSportsDB.accdb");
            
            
            String query = "INSERT INTO Payments(OrderID, LastName, FirstName, Email, PaymentTotal, CCNum, ExpDate, CVC)"+
                    "Values(?, ?, ?, ?, ?, ?, ?, ?)";                        
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, this.getPayId());
            stmt.setString(2, this.getLname());
            stmt.setString(3, this.getFname());
            stmt.setString(4, this.getEmail());
            stmt.setDouble(5, this.getCurrency());
            stmt.setString(6, this.getCardNumber());
            stmt.setString(7, this.getExp());
            stmt.setString(8, this.getCvc());
            stmt.executeUpdate();
            conn.close();
            
            System.out.println("Payments - Insert Successful!");
            
        }
        catch(SQLException ex){
            System.out.println(ex.toString());
        }
        catch(ClassNotFoundException cnfe){
            System.out.println(cnfe.toString());
        }
        
    }
    
    public void selectDB(int payid){
         try{
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            Connection conn;
            //Edit this next line of code starting with C: to the file path of the database
            conn = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\cpicciri\\Documents\\Database\\GoodSportsDB.accdb");
            String query = "SELECT * from payments where orderid=?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, payid);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                
                this.setPayId(rs.getInt("PayID"));
                this.setFname(rs.getString("FirstName"));
                this.setLname(rs.getString("LastName"));
                this.setEmail(rs.getString("Email"));
                this.setCurrency(rs.getDouble("PaymentTotal"));
                this.setCardNumber(rs.getString("CCNum"));
                this.setExp(rs.getString("ExpDate"));
                this.setCvc(rs.getString("CVC"));
                
            }
            
         }
         catch(SQLException ex){
            System.out.println(ex.toString());
        }
        catch(ClassNotFoundException cnfe){
            System.out.println(cnfe.toString());
        }
    }
    
    public void display(){
        System.out.println("Pay Id: " + this.getPayId() );
        System.out.println("First Name: "+this.getFname());
        System.out.println("Last Name: "+this.getLname());
        System.out.println("Email: "+this.getEmail());
        System.out.println("Currency: "+ this.getCurrency());
        System.out.println("Card #: "+ this.getCardNumber());
        System.out.println("Exp: "+ this.getExp());
        System.out.println("CVC #: "+this.getCvc());
                
    }
    
    public static void main(String[] args){
        
        payments pay = new payments();
        pay.payments(53, "C", "Piccirilli", "Hi@gmail.com", 32.95, "34", "2/2021", "232");
//        pay.insertDB();
        pay.selectDB(53);
        pay.display();
        
        
    }


}
