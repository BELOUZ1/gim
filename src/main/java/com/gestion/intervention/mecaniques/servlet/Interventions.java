package com.gestion.intervention.mecaniques.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gestion.intervention.mecaniques.beans.Employe;
import com.gestion.intervention.mecaniques.beans.Intervention;
import com.gestion.intervention.mecaniques.beans.Vehicule;
import com.gestion.intervention.mecaniques.dao.EmployesDAO;
import com.gestion.intervention.mecaniques.dao.InterventionsDAO;
import com.gestion.intervention.mecaniques.dao.VehiculesDAO;

/**
 * Servlet implementation class Interventions
 */
@WebServlet(name = "interventions", urlPatterns = { "/interventions" })
public class Interventions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private EmployesDAO employeDAO;
	private VehiculesDAO vehiculeDAO;
	private InterventionsDAO interventionDAO;
	private SimpleDateFormat formatter;

	public Interventions() {
		super();
		employeDAO = new EmployesDAO();
		vehiculeDAO = new VehiculesDAO();
		interventionDAO = new InterventionsDAO();
		formatter = new SimpleDateFormat("MM/dd/yyyy");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Employe> employes = employeDAO.recupererEmployes();
		List<Vehicule> vehicules = vehiculeDAO.recupererLesVehicules();
		List<Intervention> interventions = interventionDAO.recupererListeIntervention();
		request.setAttribute("vehicules", vehicules);
		request.setAttribute("employes", employes);
		request.setAttribute("interventions", interventions);

		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/interventions.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Intervention intervention = new Intervention();
		intervention.setNumeroVehicule(Integer.parseInt(request.getParameter("vehicule")));
		intervention.setNumeroIntervenant(Integer.parseInt(request.getParameter("employe")));

		List<String> errors = new ArrayList();

		try {
			Date dateDebut = formatter.parse(request.getParameter("datedebut"));
			Date dateFin = formatter.parse(request.getParameter("datefin"));
			
			intervention.setDateDebut(request.getParameter("datedebut"));
			intervention.setDateFin(request.getParameter("datefin"));

			if (!dateDebut.before(dateFin)) {
				errors.add("La date du début doit etre avant la date de fin ");
			}
		} catch (ParseException e) {
			errors.add("Date du début ou date de fin non valide");
		}
		
		try {
			int cout = Integer.parseInt(request.getParameter("cout"));
			intervention.setCout(Integer.parseInt(request.getParameter("cout")));
			
			if(cout <= 0) {
				errors.add("Le cout d'intervention doit etre superieur à zéro");
			}
		}catch(Exception e) {
			errors.add("Le cout n'est pas valide");
		}
		

		if(errors.size() == 0) {
			interventionDAO.ajouterIntervention(intervention);
		}else {
			request.setAttribute("errors", errors);
		}
		
		doGet(request, response);
	}

}
