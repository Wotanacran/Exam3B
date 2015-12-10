
package dbhelpers;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customers;

public class SearchQuery {
    
    private Connection conn;
    private ResultSet results;
    
    public SearchQuery() 
    {
        
        Properties props = new Properties(); //MWC
        InputStream instr = getClass().getResourceAsStream("dbConn.properties");
        try {
            props.load(instr);
        } catch (IOException ex) {
            Logger.getLogger(SearchQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            instr.close();
        } catch (IOException ex) {
            Logger.getLogger(SearchQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String driver = props.getProperty("driver.name");
        String url = props.getProperty("server.name");
        String username = props.getProperty("user.name");
        String passwd = props.getProperty("user.password");
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            conn = DriverManager.getConnection(url, username, passwd);
        } catch (SQLException ex) {
            Logger.getLogger(SearchQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void doSearch(String Name)
    {
        try {
            String query = "SELECT * FROM Customers WHERE UPPER(FirstName) LIKE ? OR UPPER(lastName) LIKE ?";
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, "%" + Name.toUpperCase() + "%");
            ps.setString(2, "%" + Name.toUpperCase() + "%");
            this.results = ps.executeQuery();
            
        } catch (SQLException ex) {
            Logger.getLogger(SearchQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String getHTMLtable()
    {
        String table = "";
        
        table += "<table>";
        table += "<tr>";
        table += "<th>Customer ID</th>";
        table += "<th>First Name</th>";
        table += "<th>Last Name</th>";
        table += "<th>Address1</th>";
        table += "<th>Address2</th>";
        table += "<th>City</th>";
        table += "<th>State</th>";
        table += "<th>Zip</th>";
        table += "<th>Email Address</th>";
        table += "<th>Age</th>";
        table += "<th></th>";
        table += "</tr>";
        
        try {
            while (this.results.next())
            {
                Customers cust = new Customers();
                cust.setCustID(this.results.getInt("custID"));
                cust.setFirstName(this.results.getString("firstName"));
                cust.setLastName(this.results.getString("lastName"));
                cust.setAddr1(this.results.getString("addr1"));
                cust.setAddr2(this.results.getString("addr2"));
                cust.setCity(this.results.getString("city"));
                cust.setState(this.results.getString("state"));
                cust.setZip(this.results.getInt("zip"));
                cust.setEmailAddr(this.results.getString("emailAddr"));
                cust.setAge(this.results.getInt("age"));
                
                table += "<tr>";
                table += "<td>";
                table += cust.getCustID();
                table += "</td>";
                
                table += "<td>";
                table += cust.getFirstName();
                table += "</td>";
                
                table += "<td>";
                table += cust.getLastName();
                table += "</td>";

                table += "<td>";
                table += cust.getAddr1();
                table += "</td>";

                table += "<td>";
                table += cust.getAddr2();
                table += "</td>";
                
                table += "<td>";
                table += cust.getCity();
                table += "</td>";
                
                table += "<td>";
                table += cust.getState();
                table += "</td>";
                
                table += "<td>";
                table += cust.getZip();
                table += "</td>";
                
                table += "<td>";
                table += cust.getEmailAddr();
                table += "</td>";
                
                table += "<td>";
                table += cust.getAge();
                table += "</td>";
                
                table += "<td id=\"delete\">";
                table += "<a class=\"update\"href=update?custID=" + cust.getCustID() + "> Update </a>" + "<a class=\"delete\"href=delete?custID=" + cust.getCustID() + "> Delete </a>";
                table += "</td>";
                table += "</tr>";
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReadQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        table += "</table";
        
        return table;
        
    }
}
