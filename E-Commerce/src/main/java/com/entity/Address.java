package com.entity;

import jakarta.persistence.*;

@Entity
@Table(name="Delivery_Details")
public class Address {
private int house_no;
private String Colony;
private String City;
private String State;
private int pincode;
private String phone;
@Id
private int o_id;
public int getHouse_no() {
	return house_no;
}
public void setHouse_no(int house_no) {
	this.house_no = house_no;
}
public String getColony() {
	return Colony;
}
public void setColony(String colony) {
	Colony = colony;
}
public String getCity() {
	return City;
}
public void setCity(String city) {
	City = city;
}
public String getState() {
	return State;
}
public void setState(String state) {
	State = state;
}
public int getPincode() {
	return pincode;
}
public void setPincode(int pincode) {
	this.pincode = pincode;
}
public int getO_id() {
	return o_id;
}
public void setO_id(int o_id) {
	this.o_id = o_id;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}

}
