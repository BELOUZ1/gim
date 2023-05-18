package com.gestion.intervention.mecaniques.beans;

public class Intervenant {
	
	private int numeroEmploye;
	private int numeroIntervention;
	private String vehicule;
	private String dateDebut;
	private String dateFin;
	private String nom;
	private String prenom;
	
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public int getNumeroIntervention() {
		return numeroIntervention;
	}
	public void setNumeroIntervention(int numeroIntervention) {
		this.numeroIntervention = numeroIntervention;
	}
	public String getVehicule() {
		return vehicule;
	}
	public void setVehicule(String vehicule) {
		this.vehicule = vehicule;
	}
	public String getDateDebut() {
		return dateDebut;
	}
	public void setDateDebut(String dateDebut) {
		this.dateDebut = dateDebut;
	}
	public String getDateFin() {
		return dateFin;
	}
	public void setDateFin(String dateFin) {
		this.dateFin = dateFin;
	}
	public int getNumeroEmploye() {
		return numeroEmploye;
	}
	public void setNumeroEmploye(int numeroEmploye) {
		this.numeroEmploye = numeroEmploye;
	}
}
