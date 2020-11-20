package dao;

import dbcon.DatabaseConnection;
import java.sql.*;
import dto.Admin_dto;

public class Admin_dao {

    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    
    public Admin_dto checkAdmin(String mailId, String password){
        
        Admin_dto obj = new Admin_dto();
        
        try{
            
            con = DatabaseConnection.getConnection();
            
            pst = con.prepareStatement("select * from admin where admin_email_id = ? and password = ?");
            pst.setString(1, mailId);
            pst.setString(2, password);
            
            rs = pst.executeQuery();
            
            if(rs.isBeforeFirst()){
                rs.next();
                obj.setFirstName(rs.getString("first_name"));
                obj.setLastName(rs.getString("last_name"));
                obj.setEmailId(rs.getString("admin_email_id"));
                obj.setPassword(rs.getString("password"));
            }
            
            con.close();
        
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return obj;
    }
    
    public boolean changePassword(String mailId, String oldPassword, String newPassword){
        
        boolean b = false;
        
        try{
            
            con = DatabaseConnection.getConnection();
            
            pst= con.prepareStatement("update admin set password = ? where admin_email_id = ? and password = ?");
            pst.setString(1, newPassword);
            pst.setString(2, mailId);
            pst.setString(3, oldPassword);
            
            int x = pst.executeUpdate();
            
            if(x>0)
                b = true;
            
            con.close();
        
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return b;
    }
}
