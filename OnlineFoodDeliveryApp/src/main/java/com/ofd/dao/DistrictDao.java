package com.ofd.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ofd.model.District;

public class DistrictDao {


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
		
		public static int SaveDistrict(District d)
		{
			Connection con = getConnection();
			int i=0;
			try {
				PreparedStatement ps =con.prepareStatement("Insert into District(name) values(?)");
				ps.setString(1,d.getDistrict());
				
				i=ps.executeUpdate();
			}catch(Exception e) {
				System.out.println("Error"+e.getLocalizedMessage());
			}
			return i;
		} 
		
		public static List<District> getDistrictList()
		{
			Connection con = getConnection();
			
			List<District> dlist = new ArrayList<District>();
			try {
				PreparedStatement ps = con.prepareStatement("Select * from District");
				ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				District dl = new District();
				dl.setSno(rs.getInt("Sno"));
				dl.setDistrict(rs.getString("name"));
				dlist.add(dl);
			}
			}catch(Exception e) {
				System.out.println("Read error"+e.getLocalizedMessage());
			}
			return dlist;	
		}
		
		public static int DeleteDistrict(int n)
		{
			Connection con = getConnection();
			int status=0;
			try {
				PreparedStatement ps = con.prepareStatement("Delete from District where Sno=?");
				ps.setInt(1,n);
			status = 	ps.executeUpdate();
				
			}catch(Exception e) {
				System.out.println("Delete error"+e.getLocalizedMessage());
			}
			return status;	
		}
		
		public static District getDistrictbyId(int no) 
		{
			Connection con = getConnection();
			District di = null;
			try {
				PreparedStatement ps = con.prepareStatement("Select * from District where Sno=?");
				ps.setInt(1,no);
				
				ResultSet r = ps.executeQuery();
				while(r.next()) {
					di = new District();
					di.setDistrict(r.getString("name"));
					di.setSno(r.getInt("Sno"));
				}
				
			}catch(Exception e) {
				System.out.println("Edit error"+e.getLocalizedMessage());
			}
			return di;
		}
		
		public static int UpdateDistrict(District dt)
		{
			System.out.println("Data: "+dt.getDistrict()+", "+dt.getSno());
			Connection con = getConnection();
			int st=0;
			try {
				PreparedStatement ps = con.prepareStatement("Update District set name=? where Sno=?");
				ps.setString(1,dt.getDistrict());
				ps.setInt(2,dt.getSno());
				
				st=ps.executeUpdate();
			}catch(Exception e) {
				System.out.println("Edit error"+e.getLocalizedMessage());
			}
			return st;
			
		}
}
