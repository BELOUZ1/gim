<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<title>Intervenants</title>
</head>
<body>
	<%@ include file="nav.html"%>
	<div class="container">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col">#</th>
					<th scope="col">Nom</th>
					<th scope="col">Prenom</th>
					<th scope="col">Intervention</th>
					<th scope="col">Vehicule</th>
					<th scope="col">Date du debut</th>
					<th scope="col">Date de fin</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${intervenants}" var="intervenant">
					<tr>
						<td>${intervenant.numeroEmploye}</td>
						<td>${intervenant.nom}</td>
						<td>${intervenant.prenom}</td>
						<td>${intervenant.numeroIntervention}</td>
						<td>${intervenant.vehicule}</td>
						<td>${intervenant.dateDebut}</td>
						<td>${intervenant.dateFin}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>