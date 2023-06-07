package com.ofd.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserLoginDao {

		public static Connection getConnection() {
			Connection con = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zomato?characterEncoding=latin1", "root","root");
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("Connection Error: " + e.getLocalizedMessage());
			}
			return con;
		}

		public static int UserLogin(String uNam, String pass) {
			Connection con = getConnection();
			int i = 0;
			try {
				PreparedStatement ps = con.prepareStatement("SELECT * FROM User where Userid=? and Password=?;");
				ps.setString(1, uNam);
				ps.setString(2, pass);

				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					i = rs.getInt("Sno");
				} else {
					i = 0;
				}
			} catch (Exception ex) {
				System.out.println("Login Ex: " + ex.getLocalizedMessage());
			}
			return i;

		}

	}

