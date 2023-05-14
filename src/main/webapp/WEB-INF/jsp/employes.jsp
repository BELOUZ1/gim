<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Employes</title>
</head>
<body>
	<%@ include file="nav.html"%>
	<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div class="col-md-3">
				<form method="post" action="/gim/employes">
					<div class="input-group" style="margin-top: 10px;">
						<input type="text" class="form-control" placeholder="Nom"
							name="nom" required="required">
					</div>
					<div class="input-group" style="margin-top: 10px;">
						<input type="text" class="form-control" placeholder="Prénom"
							name="prenom" required="required">
					</div>
					<div class="input-group" style="margin-top: 10px;">
						<select class="form-select" name="categorie">
							<option value="Mecanicien" selected>Mécanicien</option>
							<option value="Assistant">Assistant</option>
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
							<th scope="col">#</th>
							<th scope="col">Nom</th>
							<th scope="col">Prénom</th>
							<th scope="col">Catégorie</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${employes}" var="employe">
							<tr>
								<td>${employe.numero}</td>
								<td>${employe.nom}</td>
								<td>${employe.prenom}</td>
								<td>${employe.categorie}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>