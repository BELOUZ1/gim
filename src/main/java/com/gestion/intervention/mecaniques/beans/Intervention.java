package com.gestion.intervention.mecaniques.beans;

public class Intervention {
	
	private int numero;
	private int numeroVehicule;
	private String vehicule;
	private int numeroIntervenant;
	private String intervenant;
	private String dateDebut;
	private String dateFin;
	private int cout;
	
	
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public int getNumeroVehicule() {
		return numeroVehicule;
	}
	public void setNumeroVehicule(int numeroVehicule) {
		this.numeroVehicule = numeroVehicule;
	}
	public String getVehicule() {
		return vehicule;
	}
	public void setVehicule(String vehicule) {
		this.vehicule = vehicule;
	}
	public int getNumeroIntervenant() {
		return numeroIntervenant;
	}
	public void setNumeroIntervenant(int numeroIntervenant) {
		this.numeroIntervenant = numeroIntervenant;
	}
	public String getIntervenant() {
		return intervenant;
	}
	public void setIntervenant(String intervenant) {
		this.intervenant = intervenant;
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
	public int getCout() {
		return cout;
	}
	public void setCout(int cout) {
		this.cout = cout;
	}
	
}
