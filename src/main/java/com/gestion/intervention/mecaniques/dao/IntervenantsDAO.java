package com.gestion.intervention.mecaniques.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gestion.intervention.mecaniques.beans.Intervenant;
import com.gestion.intervention.mecaniques.factory.DBFactory;

public class IntervenantsDAO {
	
	
	public List<Intervenant> recupererIntervenants() {
		String query = "SELECT i.numero AS numero_intervention, i.date_debut, i.date_fin, e.nom, e.prenom, e.numero AS numero_intervenant, v.modele FROM interventions i LEFT JOIN employes e ON e.numero = i.numero_employe LEFT JOIN vehicule v ON v.numero = i.numero_vehicule";
        
		Statement statement = null;
        ResultSet resultat = null;
        List<Intervenant> intervenants = new ArrayList();
        
        try {
            statement = DBFactory.getConnection().createStatement();
            resultat = statement.executeQuery(query.toString());
            
            while (resultat.next()) {
            	Intervenant intervenant = new Intervenant();
            	intervenant.setNumeroEmploye(resultat.getInt("numero_intervenant"));
            	intervenant.setNumeroIntervention(resultat.getInt("numero_intervention"));
            	intervenant.setDateDebut(resultat.getString("date_debut"));
            	intervenant.setDateFin(resultat.getString("date_fin"));
            	intervenant.setVehicule(resultat.getString("modele"));
            	intervenant.setNom(resultat.getString("nom"));
            	intervenant.setPrenom(resultat.getString("prenom"));
            	intervenants.add(intervenant);
            }
            
        }catch (SQLException e) {
			System.err.println(e.getMessage());
		}
        
        return intervenants;
	}

}
