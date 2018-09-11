/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaproject;
import java.awt.Component;
import javax.swing.*;
import java.sql.*;
import javax.swing.JOptionPane;


/**
 *
 * @author ASUS
 */
public class cls_addMember {
    
    
    public String addMember(JTextField NIC, JTextField Fname,JTextField Lname,JTextField Age,JTextField Height,JTextField Weight,JTextField Cont,JTextArea Address,JTextField Email,JComboBox Pack,JTextField SID){
        
         try { //>>>Execption handling
            
             
             
             
            GYMDBConnection con=new GYMDBConnection();
            con.connect();
            con.putData("INSERT INTO `client` (NIC,First_Name,Last_Name,Height,Weight,Age,Contact_Number,Address,Email,Package_Type,S_ID) VALUES('"+NIC.getText()+"','"+Fname.getText()+"','"+Lname.getText()+"','"+Age.getText()+"','"+Height.getText()+"','"+Weight.getText()+"','"+Cont.getText()+"','"+Address.getText()+"','"+Email.getText()+"','"+Pack.getSelectedItem()+"','"+SID.getText()+"')");
             Component rootPanel;
            
            JOptionPane.showMessageDialog(null, "Member added Successfully!");
             
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return "DONE";
    }
    
    
}
