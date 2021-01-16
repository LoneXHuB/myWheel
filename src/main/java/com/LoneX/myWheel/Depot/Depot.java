package com.LoneX.myWheel.Depot;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Depot {
	
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
private int idDepot;

private String name;
private String address;
private int capacity;



public int getIdDepot() {
	return idDepot;
}
public void setIdDepot(int idDepot) {
	this.idDepot = idDepot;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public int getCapacity() {
	return capacity;
}
public void setCapacity(int capacity) {
	this.capacity = capacity;
}
public String getName() {
	return name;
}
public void setName(String nom) {
	this.name = nom;
}




}
