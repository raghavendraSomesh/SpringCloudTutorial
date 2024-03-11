package com.entity;
import jakarta.persistence.*;
@Entity
@Inheritance(strategy=InheritanceType.JOINED) 
public class Product{
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private int pId;
private String pName;
private String pDesc;
private String pPhoto;
private int pPrice;
private int pDiscount;
private int pQuantity;
@ManyToOne
private Category category;
public Category getCategory() {
	return category;
}
public void setCategory(Category category) {
	this.category = category;
}
public int getpId() {
	return pId;
}
public void setpId(int pId) {
	this.pId = pId;
}
public String getpName() {
	return pName;
}
public void setpName(String pName) {
	this.pName = pName;
}
public String getpDesc() {
	return pDesc;
}
public void setpDesc(String pDesc) {
	this.pDesc = pDesc;
}


public String getpPhoto() {
	return pPhoto;
}
public void setpPhoto(String pPhoto) {
	this.pPhoto = pPhoto;
}
public int getpPrice() {
	return pPrice;
}
public void setpPrice(int pPrice) {
	this.pPrice = pPrice;
}
public int getpDiscount() {
	return pDiscount;
}
public void setpDiscount(int pDiscount) {
	this.pDiscount = pDiscount;
}
public int getpQuantity() {
	return pQuantity;
}
public void setpQuantity(int pQuantity) {
	this.pQuantity = pQuantity;
}
public Product(int pId, String pName, String pDesc, String pPhoto, int pPrice, int pDiscount,
		int pQuantity,Category category) {
	super();
	this.pId = pId;
	this.pName = pName;
	this.pDesc = pDesc;
	this.pPhoto = pPhoto;
	this.pPrice = pPrice;
	this.pDiscount = pDiscount;
	this.pQuantity = pQuantity;
	this.category = category;
}

public Product(String pName, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity, Category category) {
	super();
	this.pName = pName;
	this.pDesc = pDesc;
	this.pPhoto = pPhoto;
	this.pPrice = pPrice;
	this.pDiscount = pDiscount;
	this.pQuantity = pQuantity;
	this.category = category;
}
public Product() {
	super();
	// TODO Auto-generated constructor stub
}
public int getPriceAfterDiscount() {
	int d=(int)((getpDiscount()/100.0)*getpPrice());
	return this.getpPrice()-d;
	
}
}
