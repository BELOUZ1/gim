package com.gestion.intervention.mecaniques.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gestion.intervention.mecaniques.beans.Intervention;
import com.gestion.intervention.mecaniques.factory.DBFactory;

public class InterventionsDAO {
	
	public void ajouterIntervention(Intervention intervention) {
        try {
			PreparedStatement preparedStatement = DBFactory.getConnection().prepareStatement("INSERT INTO Interventions (numero_employe, numero_vehicule, date_debut, date_fin, cout) VALUES(?, ?, ?, ?, ?);");
            preparedStatement.setInt(1, intervention.getNumeroIntervenant());
            preparedStatement.setInt(2, intervention.getNumeroVehicule());
            preparedStatement.setString(3, intervention.getDateDebut());
            preparedStatement.setString(4, intervention.getDateFin());
            preparedStatement.setInt(5, intervention.getCout());
            preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}
	
	
	public List<Intervention> recupererListeIntervention(){
		
		StringBuilder query = new StringBuilder("SELECT i.numero, i.date_debut, i.date_fin, i.cout, v.modele, e.nom, e.prenom FROM interventions i ");
		query.append("LEFT JOIN employes e ON e.numero = i.numero_employe ");
		query.append("LEFT JOIN vehicule v ON v.numero = i.numero_vehicule");
		
        Statement statement = null;
        ResultSet resultat = null;
        List<Intervention> interventions = new ArrayList();
        
        try {
            statement = DBFactory.getConnection().createStatement();
            resultat = statement.executeQuery(query.toString());
            
            while (resultat.next()) {
            	Intervention intervention = new Intervention();
            	intervention.setCout(resultat.getInt("cout"));
            	intervention.setNumero(resultat.getInt("numero"));
            	intervention.setVehicule(resultat.getString("modele"));
            	intervention.setDateDebut(resultat.getString("date_debut"));
            	intervention.setDateFin(resultat.getString("date_fin"));
            	intervention.setIntervenant(resultat.getString("prenom") + " " + resultat.getString("nom"));
                interventions.add(intervention);
            }
            
        }catch (SQLException e) {
			System.err.println(e.getMessage());
		}
        
        return interventions;
	}

}
