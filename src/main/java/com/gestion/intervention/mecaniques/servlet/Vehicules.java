package com.gestion.intervention.mecaniques.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gestion.intervention.mecaniques.beans.Client;
import com.gestion.intervention.mecaniques.beans.Employe;
import com.gestion.intervention.mecaniques.beans.Modele;
import com.gestion.intervention.mecaniques.beans.Vehicule;
import com.gestion.intervention.mecaniques.dao.ClientsDAO;
import com.gestion.intervention.mecaniques.dao.EmployesDAO;
import com.gestion.intervention.mecaniques.dao.VehiculesDAO;

/**
 * Servlet implementation class Vehicule
 */
@WebServlet(name = "vehicules", urlPatterns = { "/vehicules" })
public class Vehicules extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private VehiculesDAO vehiculesDAO;
	private ClientsDAO clientsDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Vehicules() {
        super();
        clientsDAO = new ClientsDAO();
        vehiculesDAO = new VehiculesDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Client> clients = clientsDAO.recupererClients();
		List<Modele> modeles = vehiculesDAO.recupererLesModeles();
		List<Vehicule> vehicules = vehiculesDAO.recupererLesVehicules();
		request.setAttribute("modeles", modeles);
		request.setAttribute("clients", clients);
		request.setAttribute("vehicules", vehicules);
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/vehicules.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Vehicule vehicule = new Vehicule();
		vehicule.setImmatriculation(request.getParameter("immatriculation"));
		vehicule.setModele(request.getParameter("modele"));
		vehicule.setAnnee(request.getParameter("annee"));
		vehicule.setClient(request.getParameter("client"));
		vehiculesDAO.ajouterVehicule(vehicule);
		doGet(request, response);
	}

}
