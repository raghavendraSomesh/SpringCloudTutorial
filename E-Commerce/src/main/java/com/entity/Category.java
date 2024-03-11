package com.entity;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.annotations.ValueGenerationType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.*;
@Entity
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
private int categoryId;
private String categoryTitle;
private String categoryDescription;
@OneToMany(mappedBy ="category")
private List<Product> products=new ArrayList<>();

public List<Product> getProducts() {
	return products;
}
public void setProducts(List<Product> products) {
	this.products = products;
}
public int getCategoryId() {
	return categoryId;
}
public void setCategoryId(int categoryId) {
	this.categoryId = categoryId;
}
public String getCategoryTitle() {
	return categoryTitle;
}
public void setCategoryTitle(String categoryTitle) {
	this.categoryTitle = categoryTitle;
}
public String getCategoryDescription() {
	return categoryDescription;
}
public void setCategoryDescription(String categoryDescription) {
	this.categoryDescription = categoryDescription;
}
public Category() {
	super();
	// TODO Auto-generated constructor stub
}

public Category(int categoryId, String categoryTitle, String categoryDescription, List<Product> products) {
	super();
	this.categoryId = categoryId;
	this.categoryTitle = categoryTitle;
	this.categoryDescription = categoryDescription;
	this.products = products;
}
public Category(String categoryTitle, String categoryDescription, List<Product> products) {
	super();
	this.categoryTitle = categoryTitle;
	this.categoryDescription = categoryDescription;
	this.products = products;
}
}
