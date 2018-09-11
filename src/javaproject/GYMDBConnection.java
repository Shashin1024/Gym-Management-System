/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaproject;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class GYMDBConnection {
    
    public static Connection con = null;
    
    public Connection connect(){
    
        try {
            Class.forName("com.mysql.jdbc.Driver");  
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/gymdbconnection","root","");
            return con;
        } catch (Exception ex) {
            Logger.getLogger(GYMDBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void closeConnection() throws SQLException{
    
        if (!con.isClosed()) {
            con.close();
        }
    
    }
    
    public ResultSet getData(String sql) throws SQLException{
    
        Statement state= con.createStatement();
        ResultSet rset=state.executeQuery(sql);
    
        return rset;
    }
    
    public void putData(String sql) throws SQLException{
    
        Statement state= con.createStatement();
        state.addBatch(sql);
        state.executeBatch();
    
    }
    
}
