package com.LoneX.myWheel.Reservation;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.LoneX.myWheel.User.MyUser;
import com.LoneX.myWheel.Vehicule.Vehicule;

@Entity
public class Reservation {

	
	


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Temporal(TemporalType.DATE)
	private Date dateD;
	
	@Temporal(TemporalType.DATE)
	private Date dateR;
	
	@Temporal(TemporalType.TIME)
	private Date timeD;
	
	
	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	private Date dateReservation;
	
	
	@Temporal(TemporalType.TIME)
	private Date timeR;


	@ManyToOne
	private MyUser user;
	
	@ManyToOne
	private Vehicule vehicule;
	
	
	private String state="en Attente";
	private double kmD;
	private double kmR;
	private String type;
	
	
	public Reservation() { }
	
	
	public Reservation(int id, Date dateD, Date dateR, MyUser user , String etat, double kmD, double kmR ,int numDays , Vehicule vehicule) {
		this.id = id;
		this.dateD = dateD;
		this.dateR = dateR;
		this.user=user;
		this.state = etat;
		this.kmD = kmD;
		this.kmR = kmR;
		
		this.vehicule=vehicule;
	}
	
	
	


	public Date getTimeR() {
		return timeR;
	}
	

	public Date getTimeD() {
		return timeD;
	}


	public void setTimeD(Date timeD) {
		this.timeD = timeD;
	}
	
	public void setTimeR(Date timeR) {
		this.timeR = timeR;
	}



	public Vehicule getVehicule() {
		return vehicule;
	}


	public void setVehicule(Vehicule vehicule) {
		this.vehicule = vehicule;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Date getDateD() {
		return dateD;
	}


	public void setDateD(Date dateD) {
		this.dateD = dateD;
	}


	public Date getDateR() {
		return dateR;
	}


	public void setDateR(Date dateR) {
		this.dateR = dateR;
	}


	public MyUser getUser() {
		return user;
	}


	public void setUser(MyUser user) {
		this.user = user;
	}


	public String getEtat() {
		return state;
	}


	public void setEtat(String etat) {
		this.state = etat;
	}


	public double getKmD() {
		return kmD;
	}


	public void setKmD(double kmD) {
		this.kmD = kmD;
	}


	public double getKmR() {
		return kmR;
	}


	public void setKmR(double kmR) {
		this.kmR = kmR;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}
	public Date getDateReservation() {
		return dateReservation;
	}


	public void setDateReservation(Date dateReservation) {
		this.dateReservation = dateReservation;
	}
	
	
}