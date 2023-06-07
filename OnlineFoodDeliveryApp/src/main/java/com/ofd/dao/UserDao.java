package com.ofd.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.ofd.model.User;

public class UserDao {

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
		
		public static int SaveUser(User u)
		{
			Connection con = getConnection();
			int i=0;
			try {
				PreparedStatement ps =con.prepareStatement("Insert into User(Name,Gender,Userid,Email,Phone,Password) "
						+ "values(?,?,?,?,?,?)");
				ps.setString(1,u.getName());
				ps.setString(2,u.getGender());
				ps.setString(3,u.getUserid());
				ps.setString(4,u.getEmail());
				ps.setString(5,u.getPhone());
				ps.setString(6,u.getPassword());
				
				i=ps.executeUpdate();
			}catch(Exception e) {
				System.out.println("Error"+e.getLocalizedMessage());
			}
			return i;
		} 
}
