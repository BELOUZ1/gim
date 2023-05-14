package com.gestion.intervention.mecaniques.factory;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.http.HttpServlet;
public class DBFactory extends HttpServlet{

	private static Connection connexion;
	
    public void init()
    {
		if(connexion == null) {
	        try {
	        	Class.forName("com.mysql.jdbc.Driver");
	            connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/GIM?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "");
	            System.out.println("Connection ok");
	        } catch (Exception e) {
	        	System.err.println(e.getMessage());
	        }
		}
    }
	
	public static Connection getConnection() {
		return connexion;
	}
}
