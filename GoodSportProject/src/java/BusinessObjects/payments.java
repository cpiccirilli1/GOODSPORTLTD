/**
 *  Business Object for handling inserting credit card records.
 *  OrderID needs to be "Number -> general number"
 */
package BusinessObjects;

import java.sql.*;
import java.util.ArrayList;

/**
 *
 *   cpicciri
 */
public class payments {

    /**
     * @return the orderID
     */
    public int getOrderID() {
        return orderID;
    }

    /**
     * @param orderID the orderID to set
     */
    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

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
     *  the NameOnCard
     */
    public String getNameOnCard() {
        return NameOnCard;
    }

    /**
     * the NameOnCard to set
     */
    public void setNameOnCard(String NameOnCard) {
        this.NameOnCard = NameOnCard;
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
    private int orderID;
    private String NameOnCard;
    private Double currency;
    private String cardNumber;
    private String exp;
    private String cvc;
    ArrayList<payments> payArr = new ArrayList<>();
    
    /***************************
     * 
     * blank constructor 
     * 
     ****************************/
    public void payments(){
        this.setPayId(0);
        this.setNameOnCard("");;
        this.setCurrency(0.0);
        this.setCardNumber("");
        this.setExp("");
        this.setCvc("");
    }
    
        
    /***************************
     * 
     * setter constructor
     * 
     ****************************/
    public void payments( int payId, Double currency,
            String card, String exp, String cvc){
        this.setPayId(payId);
        this.setCurrency(currency);
        this.setCardNumber(card);
        this.setExp(exp);
        this.setCvc(cvc);
    }
    
        
    /***************************
     * 
     *Database table insert 
     * 
     ****************************/
    
    public void insertDB( String NameOnCard, int orderid, Double currency,
            String card, String exp, String cvc){
        
        try{
            String sql = "INSERT INTO Payments(orderID, NameOnCard, PaymentTotal, CCNum, ExpDate, CVC)"+
                    "Values('" +
                    orderid+ "', '"+
                    NameOnCard + "',  '" + currency + "',  '" + card + "', '" + exp + 
                    "', '" + cvc + "')";                        
            Statement stmt = Customer.connectDB();
           
            stmt.execute(sql);
            System.out.println("Payments - Insert Successful!");   
        }
        catch(SQLException ex){
            System.out.println(ex.toString());
        }
        
    }
    
    /* temporary bypass */
    public void insertDBtemp(String NameOnCard,
            String card, String exp, String cvc){
        
        try{
            String sql = "INSERT INTO Payments(NameOnCard, CCNum, ExpDate, CVC)"+
                    "Values('" + NameOnCard + "', '" + card + "', '" + exp + 
                    "', '" + cvc + "')";                        
            Statement stmt = Customer.connectDB();
           
            stmt.execute(sql);
            System.out.println("Payments - Insert Successful!");   
        }
        catch(SQLException ex){
            System.out.println(ex.toString());
        }
        
    }
    
    /***************************
     * 
     * select all from payments table based on orderid
     * 
     ****************************/    
    public void selectDB(int payid){
         try{
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            
            String query = "SELECT * from payments where orderid='"+payid+"'";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next()){
                
                this.setPayId(rs.getInt("PayID"));
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
    
    /*******************
     * expirationGlue is a method used to string together information from multiple
        data fields.
    ********************/
    public void selectByOrderID(int OrderID){
        
        try{
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            
            String query = "SELECT * from payments where orderid='"+OrderID+"'";
            Statement stmt = Customer.connectDB();
            ResultSet rs = stmt.executeQuery(query);
            
            while(rs.next()){
                
                payments nPay = new payments();
                nPay.setCurrency(rs.getDouble("PaymentTotal"));
//                nPay.display();
                payArr.add(nPay);
  
            }
            
         }
         catch(SQLException ex){
            System.out.println(ex.toString());
        }
        catch(ClassNotFoundException cnfe){
            System.out.println(cnfe.toString());
        }
        
    }
    
    public void fillPayArray(String custID){
        CustOrder c = new CustOrder();
        c.selectCustDB(custID);
        
        System.out.println("*Start*fillPayArray******");
        c.displayArr();
        System.out.println("**end**fillPayArray******");
        ArrayList<CustOrder> custArr = c.getArr();
        
        for(CustOrder i : custArr){
            
            this.selectByOrderID(i.getOrderID());
            
        }
        
        
    }
    
    public ArrayList<payments> reverseArrayList() 
    { 
        // Arraylist for storing reversed elements 
        ArrayList<payments> revArrayList = new ArrayList<payments>(); 
        
        for (int i = payArr.size() - 1; i >= 0; i--) { 
  
            // Append the elements in reverse order 
            revArrayList.add(payArr.get(i)); 
        } 
  
        // Return the reversed arraylist 
        return revArrayList; 
    } 
    
    
    public ArrayList getPayArr(){
        return payArr;
    }
    
    public void DisplayArr(){
        for(payments i : payArr){
            System.out.println(""+i.getCurrency());
        }
    }
    
    public String expirationGlue(String month, String year){
        String expirationStr = month + "," + year;
        
        return expirationStr;
    }
    
    
    
    
    /**********************
     * 
     * displays all variables to test class
     * 
     ************************/
    public void display(){
        System.out.println("Pay Id: " + payId );
        System.out.println("Currency: "+ currency);
        System.out.println("Card #: "+ cardNumber);
        System.out.println("Exp: "+ exp);
        System.out.println("CVC #: "+ cvc);
                
    }
    
    public static void main(String[] args){
       payments p = new payments();
//       p.selectByOrderID(50);
       p.fillPayArray("2");
       p.DisplayArr();
    }


}
