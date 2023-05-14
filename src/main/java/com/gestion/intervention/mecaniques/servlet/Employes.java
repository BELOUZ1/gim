package com.gestion.intervention.mecaniques.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.gestion.intervention.mecaniques.beans.Employe;
import com.gestion.intervention.mecaniques.dao.EmployesDAO;
import java.util.List;
import java.util.ArrayList;
/**
 * Servlet implementation class Employes
 */
@WebServlet(name = "employes", urlPatterns = { "/employes" })
public class Employes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployesDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Employes() {
        super();
        dao = new EmployesDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Employe> employes = dao.recupererEmployes();
		request.setAttribute("employes", employes);
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/employes.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Employe employe = new Employe();
		employe.setNom(request.getParameter("nom"));
		employe.setPrenom(request.getParameter("prenom"));
		employe.setCategorie(request.getParameter("categorie"));
		dao.ajouterEmploye(employe);
		doGet(request, response);
	}

}
