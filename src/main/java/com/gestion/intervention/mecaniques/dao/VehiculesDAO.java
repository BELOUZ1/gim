package com.gestion.intervention.mecaniques.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gestion.intervention.mecaniques.beans.Modele;
import com.gestion.intervention.mecaniques.beans.Vehicule;
import com.gestion.intervention.mecaniques.factory.DBFactory;

public class VehiculesDAO {
	
	public List<Modele> recupererLesModeles(){
		
		String requeste = "SELECT MODELE.numero AS numero, MODELE.nom AS nom, marque.nom AS marque, marque.pays AS pays FROM MODELE LEFT JOIN marque ON MODELE.numeromarque = marque.numero";
        Statement statement = null;
        ResultSet resultat = null;
        List<Modele> modeles = new ArrayList();
        
        try {
            statement = DBFactory.getConnection().createStatement();
            resultat = statement.executeQuery(requeste);
            
            while (resultat.next()) {
                
            	Modele modele = new Modele();
            	modele.setNom(resultat.getString("nom"));
            	modele.setMarque(resultat.getString("marque"));
            	modele.setPays(resultat.getString("pays"));
                modele.setNumero(resultat.getInt("numero"));
                
                modeles.add(modele);
            }
            
        }catch (SQLException e) {
			System.err.println(e.getMessage());
		}
        
        return modeles;
	}
	
	public List<Vehicule> recupererLesVehicules(){
		
		String requeste = "SELECT vehicule.*, clients.nom AS client_nom, clients.prenom AS client_prenom FROM vehicule LEFT JOIN clients ON vehicule.client = clients.numero";
        Statement statement = null;
        ResultSet resultat = null;
        List<Vehicule> vehicules = new ArrayList();
        
        try {
            statement = DBFactory.getConnection().createStatement();
            resultat = statement.executeQuery(requeste);
            
            while (resultat.next()) {
                
            	Vehicule vehicule = new Vehicule();
            	vehicule.setNumero(resultat.getInt("numero"));
            	vehicule.setImmatriculation(resultat.getString("immatriculation"));
            	vehicule.setModele(resultat.getString("modele"));
            	vehicule.setAnnee(resultat.getString("annee"));
            	vehicule.setClient(resultat.getString("client_prenom") + " " + resultat.getString("client_nom"));
                
                vehicules.add(vehicule);
            }
            
        }catch (SQLException e) {
			System.err.println(e.getMessage());
		}
        
        return vehicules;
	}
	
	public void ajouterVehicule(Vehicule vehicule) {
        try {
			PreparedStatement preparedStatement = DBFactory.getConnection().prepareStatement("INSERT INTO vehicule(immatriculation, modele, annee, client) VALUES(?, ?, ?, ?);");
            preparedStatement.setString(1, vehicule.getImmatriculation());
            preparedStatement.setString(2, vehicule.getModele());
            preparedStatement.setString(3, vehicule.getAnnee());
            preparedStatement.setString(4, vehicule.getClient());
            preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}

}
