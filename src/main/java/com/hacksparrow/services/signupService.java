package com.hacksparrow.services;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class signupService {
	Connection con = null;
    Statement st = null; 
    ResultSet rs = null;
	public signupService() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackthon", "root", "Shreyas@28");
            st = con.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
public boolean enterUSer(String uname, String upwd, String uemail,String ugender) {
	try {
		PreparedStatement pstmt = con.prepareStatement("INSERT INTO userdetails (uname, upwd, uemail, gender) VALUES (?, ?, ?, ?)");
	    pstmt.setString(1, uname);
	    pstmt.setString(2, upwd);
	    pstmt.setString(3, uemail);
	    pstmt.setString(4, ugender);
	    int rowsInserted = pstmt.executeUpdate();
	    if (rowsInserted > 0) {
	        return true;
	    } 
	} catch (Exception e) {
		e.printStackTrace();
	}
	return false;
}
}