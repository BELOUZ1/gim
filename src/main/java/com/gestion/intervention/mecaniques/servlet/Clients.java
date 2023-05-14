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
import com.gestion.intervention.mecaniques.dao.ClientsDAO;

/**
 * Servlet implementation class Clients
 */
@WebServlet(name = "clients", urlPatterns = { "/clients" })
public class Clients extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClientsDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Clients() {
        super();
        dao = new ClientsDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Client> clients = dao.recupererClients();
		request.setAttribute("clients", clients);
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/clients.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Client client = new Client();
        client.setNom(request.getParameter("nom"));
        client.setPrenom(request.getParameter("prenom"));
        client.setCivilite(request.getParameter("civilite"));
        client.setFix(request.getParameter("fix"));
        client.setFax(request.getParameter("fax"));
        client.setDateNaissance(request.getParameter("datenaissance"));
        client.setTelephone(request.getParameter("telephone"));
        client.setAdresse(request.getParameter("adresse"));
        dao.ajouterClient(client);
		doGet(request, response);
	}

}
