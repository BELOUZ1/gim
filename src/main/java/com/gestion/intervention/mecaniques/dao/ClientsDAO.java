package com.gestion.intervention.mecaniques.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gestion.intervention.mecaniques.beans.Client;
import com.gestion.intervention.mecaniques.beans.Employe;
import com.gestion.intervention.mecaniques.factory.DBFactory;

public class ClientsDAO {
	
	public void ajouterClient(Client client) {
        try {
			PreparedStatement preparedStatement = DBFactory.getConnection().prepareStatement("INSERT INTO clients(nom, prenom, civilite, telephone, fix, fax, datenaissance, adresse) VALUES(?, ?, ?, ?, ?, ?, ?, ?);");
            preparedStatement.setString(1, client.getNom());
            preparedStatement.setString(2, client.getPrenom());
            preparedStatement.setString(3, client.getCivilite());
            preparedStatement.setString(4, client.getTelephone());
            preparedStatement.setString(5, client.getFix());
            preparedStatement.setString(6, client.getFax());
            preparedStatement.setString(7, client.getDateNaissance());
            preparedStatement.setString(8, client.getAdresse());
            preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e);
		}
	}
	
public List<Client> recupererClients() {
		
        Statement statement = null;
        ResultSet resultat = null;
        List<Client> clients = new ArrayList();
        
        try {
            statement = DBFactory.getConnection().createStatement();
            resultat = statement.executeQuery("SELECT * FROM clients;");
            
            while (resultat.next()) {
                
                Client client = new Client();
                client.setNom(resultat.getString("nom"));
                client.setPrenom(resultat.getString("prenom"));
                client.setCivilite(resultat.getString("civilite"));
                client.setFix(resultat.getString("fix"));
                client.setAdresse(resultat.getString("adresse"));
                client.setFax(resultat.getString("fax"));
                client.setDateNaissance(resultat.getString("datenaissance"));
                client.setTelephone(resultat.getString("telephone"));
                client.setNumero(resultat.getInt("numero"));
                
                clients.add(client);
            }
            
        }catch (SQLException e) {
			System.err.println(e.getMessage());
		}
        
        return clients;
	}


}
