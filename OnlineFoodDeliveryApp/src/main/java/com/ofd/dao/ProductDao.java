package com.ofd.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ofd.model.Product;

public class ProductDao {

	public static Connection getConnection() {
		Connection con = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zomato?characterEncoding=latin1", "root",
					"root");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Connection Error: " + e.getLocalizedMessage());
		}

		return con;
	}
	
	public static int SaveProduct(Product p) {
		Connection con = getConnection();
		int i=0;
		try {
			PreparedStatement ps = con.prepareStatement("Insert into Product(Category,Pname,Description,Size,CP,MRP,SP) "
					+ "values(?,?,?,?,?,?,?)");
			ps.setString(1,p.getCategory());
			ps.setString(2,p.getProductname());
			ps.setString(3,p.getDescription());
			ps.setString(4,p.getSize());
			ps.setString(5,p.getCP());
			ps.setString(6,p.getMRP());
			ps.setString(7,p.getSP());
			
			i = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Insert Error: " + e.getLocalizedMessage());
		}
		return i;
	}
	
	public static Product getProductbyId(int id){
		Connection con = getConnection();
		Product prod = null;
		try {
			PreparedStatement ps = con.prepareStatement("Select * from Product where Sno=?");
			ps.setInt(1,id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				prod = new Product();
				prod.setCategory(rs.getString("Category"));
				prod.setProductname(rs.getString("Pname"));
				prod.setDescription(rs.getString("Description"));
				prod.setSize(rs.getString("Size"));
				prod.setMRP(rs.getString("CP"));
				prod.setCP(rs.getString("MRP"));
				prod.setSP(rs.getString("SP"));
				prod.setSno(rs.getInt("Sno"));
			}
		}catch(Exception e) {
			System.out.println("Insert Error: " + e.getLocalizedMessage());
		}
		return prod;
	}
}
