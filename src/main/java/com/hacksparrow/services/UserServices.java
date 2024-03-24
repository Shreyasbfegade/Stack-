package com.hacksparrow.services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserServices {

    private Connection con = null;
    private PreparedStatement pst = null; 
    private ResultSet rs = null;

    public UserServices() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackthon", "root", "Shreyas@28");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean isUser(String uname, String upwd) {
        try {
            pst = con.prepareStatement("SELECT * FROM userdetails WHERE uemail = ? AND upwd = ?");
            pst.setString(1, uname);
            pst.setString(2, upwd);
            rs = pst.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources in a finally block to ensure they are always closed
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}


