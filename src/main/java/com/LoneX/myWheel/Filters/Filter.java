package com.LoneX.myWheel.Filters;

public class Filter {
	
	private String email;
	private String marque;
	private String category;
	private String model;
	private double priceRange;
	private String dateD;
	private String dateR;
	private String timeD;
	private String timeR;
	private String typeReservation;
	
	public Filter() {
		
	}
	
	public Filter(String category, String model, double priceRange) {
		super();
		this.category = category;
		this.model = model;
		this.priceRange = priceRange;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public double getPriceRange() {
		return priceRange;
	}
	public void setPriceRange(double priceRange) {
		this.priceRange = priceRange;
	}
	public void setDateD(String dateD) {
		this.dateD=dateD;
		
	}
	public String getDateD() {
		return dateD;
	}
	
	public void setDateR(String dateR) {
		this.dateR=dateR;
	}
	public String getDateR() {
		return dateR;
	}

	public String getMarque() {
		return marque;
	}

	public void setMarque(String marque) {
		this.marque = marque;
	}

	public String getTimeD() {
		return timeD;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setTimeD(String timeD) {
		this.timeD = timeD;
	}

	public String getTimeR() {
		return timeR;
	}

	public void setTimeR(String timeR) {
		this.timeR = timeR;
	}

	public String getTypeReservation() {
		return typeReservation;
	}

	public void setTypeReservation(String typeReservation) {
		this.typeReservation = typeReservation;
	}


	
}
