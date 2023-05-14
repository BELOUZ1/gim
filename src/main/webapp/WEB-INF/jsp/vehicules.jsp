<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Véhicules</title>
</head>
<body>
	<%@ include file="nav.html"%>
	<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div class="col-md-3">
				<form method="post" action="/gim/vehicules">
					<div class="input-group">
						<select class="form-select" name="modele">
							<c:forEach items="${modeles}" var="modele">
								<option value="${modele.nom} - ${modele.marque}">${modele.nom}
									- ${modele.marque}</option>
							</c:forEach>
						</select>
					</div>
					<div class="input-group" style="margin-top: 10px;">
						<input type="text" class="form-control"
							placeholder="Immatriculation" name="immatriculation"
							required="required">
					</div>

					<div class="input-group" style="margin-top: 10px;">
						<input type="text" class="form-control"
							placeholder="Annee Immatriculation" name="annee"
							required="required">
					</div>

					<div class="input-group" style="margin-top: 10px;">
						<select class="form-select" name="client">
							<c:forEach items="${clients}" var="client">
								<option value="${client.numero}">${client.numero}-
									${client.nom} ${client.prenom}</option>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-primary"
						style="margin-top: 10px;">Ajouter</button>
				</form>
			</div>
			<div class="col-md-7">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th scope="col">Modele</th>
							<th scope="col">Immatriculation</th>
							<th scope="col">Annee Immatriculation</th>
							<th scope="col">Client</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${vehicules}" var="vehicule">
							<tr>
								<td>${vehicule.modele}</td>
								<td>${vehicule.immatriculation}</td>
								<td>${vehicule.annee}</td>
								<td>${vehicule.client}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>