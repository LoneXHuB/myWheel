package com.LoneX.myWheel.User;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Value;

import com.LoneX.myWheel.Depot.Depot;

@Entity
@Table(name="myUsers")
public class MyUser {
	
	
	private String name;
	private String lastName;
	private String numPermit;
	private String rol;
	private String pass;	
	private String email;
	private String mobile;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	private Depot depot;
	
	@NotNull
	@Value("${some.key:true}")
	private boolean enabled=true;


	
	public MyUser() {
		
	}
	
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public void setId(int id) {
		this.id = id;
	}

	public MyUser(String name, String lastName, String numPermit, String email, String role, String pass) {
		this.name = name;
		this.lastName = lastName;
		this.numPermit = numPermit;
		this.email = email;
		this.rol = role;
		this.pass= pass;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getNumPermit() {
		return numPermit;
	}
	public void setNumPermit(String numPermit) {
		this.numPermit = numPermit;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String role) {
		this.rol = role;
	}

	public int getId() {
		// TODO Auto-generated method stub
		return this.id;
	}
	public void serId(int id) {
		this.id=id;
	}
	
	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Depot getDepot() {
		return depot;
	}

	public void setDepot(Depot depot) {
		this.depot = depot;
	}

	
	
	
	
}
