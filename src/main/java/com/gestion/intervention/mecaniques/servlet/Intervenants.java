package com.gestion.intervention.mecaniques.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gestion.intervention.mecaniques.beans.Intervenant;
import com.gestion.intervention.mecaniques.dao.IntervenantsDAO;

/**
 * Servlet implementation class Intervenants
 */
@WebServlet(name = "intervenants", urlPatterns = { "/intervenants" })
public class Intervenants extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IntervenantsDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Intervenants() {
        super();
        dao = new IntervenantsDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Intervenant> intervenants = dao.recupererIntervenants();
		request.setAttribute("intervenants", intervenants);
		this.getServletContext().getRequestDispatcher("/WEB-INF/jsp/intervenants.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
