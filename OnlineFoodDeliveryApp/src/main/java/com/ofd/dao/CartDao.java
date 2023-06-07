package com.ofd.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ofd.model.Cart;
import com.ofd.model.Cartpage;


public class CartDao {

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
			
			public static int AddToCart(Cart c)
			{
				Connection con = getConnection();
				int i=0;
				try {
					PreparedStatement ps =con.prepareStatement("Insert into Cart(Prodid,Userid,Quantity,Amount) values(?,?,?,?)");
					ps.setInt(1,c.getProductid());
					ps.setInt(2,c.getUserId());
					ps.setInt(3,c.getQuantity());
					ps.setInt(4,c.getAmount());
					
					i=ps.executeUpdate();
				}catch(Exception e) {
					System.out.println("Error"+e.getLocalizedMessage());
				}
				return i;
			} 
			
			public static List<Cartpage> getCartList(int userid)
			{
				Connection con = getConnection();
				
				List<Cartpage> clist = new ArrayList<Cartpage>();
				try {
					PreparedStatement ps = con.prepareStatement("Select Cart.CartId,Product.Pname,Product.SP,Cart.Quantity,Cart.Amount "
							+ "from Cart join Product on Cart.Prodid=Product.Sno where Cart.Userid=?");
					ps.setInt(1, userid);
					ResultSet rs =ps.executeQuery();
				while(rs.next())
				{
					Cartpage ct = new Cartpage();
					ct.setCartId(rs.getInt("CartId"));
					ct.setName(rs.getString("Pname"));
					ct.setPrice(rs.getInt("SP"));
					ct.setQuantity(rs.getInt("Quantity"));
					ct.setAmount(rs.getInt("Amount"));
					clist.add(ct);
				}
				}catch(Exception e) {
					System.out.println("Read error"+e.getLocalizedMessage());
				}
				return clist;	
			}
			
}
