package com.ofd.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class QuantityDao {

	public static Connection getConnection() {
		Connection con = null;

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zomato?characterEncoding=latin1", "root",
					"root");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Connection Error: " + e.getLocalizedMessage());
		}

		return con;
	}
	
	public static int IncreaseQuantity(int cid,int qt,int am) {
		
		Connection con = getConnection();
        int i=0;
		qt = qt+1;
		am = am * qt;
		try {
			PreparedStatement ps =con.prepareStatement("Update Cart set Quantity=?,Amount=? where CartId=?");
			ps.setInt(1,qt);
			ps.setInt(2,am);
			ps.setInt(3,cid);
			i = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Increase qty Error: " + e.getLocalizedMessage());
		}
		return i;
	}
    public static int DecreaseQuantity(int cid,int qt,int am) {
		
		Connection con = getConnection();
        int i=0;
		qt = qt-1;
		am = am * qt;
		try {
			PreparedStatement ps =con.prepareStatement("Update Cart set Quantity=?,Amount=? where CartId=?");
			ps.setInt(1,qt);
			ps.setInt(2,am);
			ps.setInt(3,cid);
			i = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Increase qty Error: " + e.getLocalizedMessage());
		}
		return i;
	}
}
