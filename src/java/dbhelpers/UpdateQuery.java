
package dbhelpers;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customers;

public class UpdateQuery {
    
    private Connection conn;
    
    public UpdateQuery() {
        
        Properties props = new Properties(); //MWC
        InputStream instr = getClass().getResourceAsStream("dbConn.properties");
        try {
            props.load(instr);
        } catch (IOException ex) {
            Logger.getLogger(UpdateQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            instr.close();
        } catch (IOException ex) {
            Logger.getLogger(UpdateQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String driver = props.getProperty("driver.name");
        String url = props.getProperty("server.name");
        String username = props.getProperty("user.name");
        String passwd = props.getProperty("user.password");
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UpdateQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            conn = DriverManager.getConnection(url, username, passwd);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void doUpdate(Customers server)
    {
        try {
            String query = "UPDATE customers SET firstName = ?, lastName = ?, addr1 = ?, addr2 = ?, city = ?, state = ?, zip = ?, emailAddr = ?, age = ? WHERE custID = ?";
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, server.getFirstName());
            ps.setString(2, server.getLastName());
            ps.setString(3, server.getAddr1());
            ps.setString(4, server.getAddr2());
            ps.setString(5, server.getCity());
            ps.setString(6, server.getState());
            ps.setInt(7, server.getZip());
            ps.setString(8, server.getEmailAddr());
            ps.setInt(9, server.getAge());
            ps.setInt(10, server.getCustID());
            
            ps.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(UpdateQuery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
