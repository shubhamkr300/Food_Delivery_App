package com.ofd.model;

public class Cart {

	private int Cartid,Productid,Quantity,UserId,Amount;
   
    
	public int getCartid() {
		return Cartid;
	}
	public void setCartid(int cartid) {
		Cartid = cartid;
	}
	public int getProductid() {
		return Productid;
	}
	public void setProductid(int productid) {
		Productid = productid;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public Integer getUserId() {
		return UserId;
	}
	public void setUserId(Integer userId) {
		UserId = userId;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
    
}
