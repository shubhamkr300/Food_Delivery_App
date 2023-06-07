package com.ofd.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ofd.model.City;

public class CityDao {
     

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
	
	public static int SaveCity(City c) {
		Connection con = getConnection();
		int i=0;
		try {
			PreparedStatement ps = con.prepareStatement("Insert into City(District,City) values(?,?)");
			ps.setInt(1,c.getSno());
			ps.setString(2,c.getCity());
			
			i=ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Insert error"+e.getLocalizedMessage());
		}
		return i;
	}
	
	public static List<City> getCityList(){
		Connection con = getConnection();
		List<City> clist = new ArrayList<City>();
		try {
			PreparedStatement ps = con.prepareStatement("Select City.Sno,District.name,City.City from District join City "
					+ "on District.Sno=City.District");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				City c = new City();
				c.setSno(rs.getInt("Sno"));
				c.setDistrict(rs.getString("name"));
				c.setCity(rs.getString("City"));
				clist.add(c);
			}
		}catch(Exception e) {
			System.out.println("Insert error"+e.getLocalizedMessage());
		}
		return clist;
	}
	
	public static int DeleteCity(int no) {
		Connection con = getConnection();
		int i=0;
		try {
			PreparedStatement ps = con.prepareStatement("Delete from City where Sno=?");
			ps.setInt(1,no);
			
			i=ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Insert error"+e.getLocalizedMessage());
		}
		return i;
	}
	
	public static City getCityById(int n) {
		Connection con = getConnection();
		City ct = null;
		try {
			PreparedStatement ps = con.prepareStatement("Select * from City where Sno=?");
			ps.setInt(1, n);
			ResultSet r = ps.executeQuery();
			
			while(r.next()) {
				ct = new City();
				ct.setSno(r.getInt("Sno"));
				ct.setDistrict(r.getString("District"));
				ct.setCity(r.getString("City"));
			}
		}catch(Exception e) {
			System.out.println("Insert error"+e.getLocalizedMessage());
		}
		return ct;
	}
	
	public static int UpdateCity(City ci) {
		Connection con = getConnection();
		int i = 0;
		try {
			PreparedStatement ps = con.prepareStatement("Update City set City=? where Sno=?");
			ps.setString(1,ci.getCity());
			ps.setInt(2,ci.getSno());
			
			i=ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("Insert error"+e.getLocalizedMessage());
		}
		return i;
	}
}
