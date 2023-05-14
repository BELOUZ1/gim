package com.gestion.intervention.mecaniques.dao;

import com.gestion.intervention.mecaniques.beans.Employe;
import com.gestion.intervention.mecaniques.factory.DBFactory;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.ArrayList;

public class EmployesDAO {
	
	public void ajouterEmploye(Employe employe) {
        try {
			PreparedStatement preparedStatement = DBFactory.getConnection().prepareStatement("INSERT INTO Employes(nom, prenom, categorie) VALUES(?, ?, ?);");
            preparedStatement.setString(1, employe.getNom());
            preparedStatement.setString(2, employe.getPrenom());
            preparedStatement.setString(3, employe.getCategorie());
            preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}
	
	public List<Employe> recupererEmployes() {
		
        Statement statement = null;
        ResultSet resultat = null;
        List<Employe> employes = new ArrayList();
        
        try {
            statement = DBFactory.getConnection().createStatement();
            resultat = statement.executeQuery("SELECT * FROM employes;");
            
            while (resultat.next()) {
                
                Employe employe = new Employe();
                employe.setNom(resultat.getString("nom"));
                employe.setPrenom(resultat.getString("prenom"));
                employe.setCategorie(resultat.getString("categorie"));
                employe.setNumero(resultat.getInt("numero"));
                
                employes.add(employe);
            }
            
        }catch (SQLException e) {
			System.err.println(e.getMessage());
		}
        
        return employes;
	}

}
