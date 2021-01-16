package com.LoneX.myWheel.Vehicule;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.LoneX.myWheel.Depot.Depot;

@Entity
public class Vehicule {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idVehicule;
	
	private String model;
	private String marque;
	private String matricule;
	private String energie;
	private int puissance;
	private String couleur;
	private String categorie;
	private double plj;
	private double plh;
	private double km;
	private String etat;
	private String boite;
	
	@ManyToOne	
	@JoinColumn(name="depot_id_depot")
	private Depot depot;



	private String imagePath;
	
	
	public Vehicule() {}
	
	
	public Vehicule(int idVehicule, String model, String marque, String matricule, String energie, int puissance,
			String couleur, String categorie, double plj, double km, String etat ,String imagePath) {
		
		this.idVehicule = idVehicule;
		this.model = model;
		this.marque = marque;
		this.matricule = matricule;
		this.energie = energie;
		this.puissance = puissance;
		this.couleur = couleur;
		this.categorie = categorie;
		this.plj = plj;
		this.km = km;
		this.etat = etat;
		this.imagePath = imagePath;
	}
	
	
	
	
	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}


	public int getIdVehicule() {
		return idVehicule;
	}
	public void setIdVehicule(int idVehicule) {
		this.idVehicule = idVehicule;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getMarque() {
		return marque;
	}
	public void setMarque(String marque) {
		this.marque = marque;
	}
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	public String getEnergie() {
		return energie;
	}
	public void setEnergie(String energie) {
		this.energie = energie;
	}
	public int getPuissance() {
		return puissance;
	}
	public void setPuissance(int puissance) {
		this.puissance = puissance;
	}
	public String getCouleur() {
		return couleur;
	}
	public void setCouleur(String couleur) {
		this.couleur = couleur;
	}
	public String getCategorie() {
		return categorie;
	}
	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	public double getPlj() {
		return plj;
	}
	public void setPlj(double plj) {
		this.plj = plj;
	}
	public double getKm() {
		return km;
	}
	public void setKm(double km) {
		this.km = km;
	}
	public String getEtat() {
		return etat;
	}
	public void setEtat(String etat) {
		this.etat = etat;
	}


	public double getPlh() {
		return plh;
	}


	public void setPlh(double plh) {
		this.plh = plh;
	}
	public String getBoite() {
		return boite;
	}


	public void setBoite(String boite) {
		this.boite = boite;
	}


	public Depot getDepot() {
		return depot;
	}


	public void setDepot(Depot depot) {
		this.depot = depot;
	}

	
	
}
