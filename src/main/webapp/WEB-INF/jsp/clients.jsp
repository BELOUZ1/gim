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
<script type="text/javascript">
	$(function() {
		$('#datepicker').datepicker();
	});
</script>
<title>Clients</title>
</head>
<body>
	<%@ include file="nav.html"%>
	<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div class="col-md-3">
				<form method="post" action="/gim/clients">
					<div class="input-group" style="margin-top: 10px;">
						<select class="form-select" name="civilite">
							<option value="M." selected>M.</option>
							<option value="Mle.">Mle.</option>
							<option value="Mme.">Mme.</option>
						</select>
					</div>
					<div class="input-group" style="margin-top: 10px;">
						<input type="text" class="form-control" placeholder="Nom"
							name="nom" required="required">
					</div>
					<div class="input-group" style="margin-top: 10px;">
						<input type="text" class="form-control" placeholder="Prénom"
							name="prenom" required="required">
					</div>

					<div class="input-group date" id="datepicker"
						style="margin-top: 10px;">
						<input type="text" class="form-control" name="datenaissance"
							required="required" placeholder="Date de naissance"> <span class="input-group-append">
							<span class="input-group-text bg-white d-block"> <i
								class="fa fa-calendar"></i>
						</span>
						</span>
					</div>

					<div class="input-group" style="margin-top: 10px;">
						<input type="text" class="form-control" placeholder="Adresse"
							name="adresse" required="required">
					</div>

					<div class="input-group" style="margin-top: 10px;">
						<input type="text" class="form-control"
							placeholder="Téléphone Portable" name="telephone"
							required="required">
					</div>

					<div class="input-group" style="margin-top: 10px;">
						<input type="text" class="form-control" placeholder="Fix"
							name="fix">
					</div>

					<div class="input-group" style="margin-top: 10px;">
						<input type="text" class="form-control" placeholder="Fax"
							name="fax">
					</div>


					<button type="submit" class="btn btn-primary"
						style="margin-top: 10px;">Ajouter</button>
				</form>
			</div>
			<div class="col-md-9">
			<table class="table">
					<thead class="thead-light">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Civilité</th>
							<th scope="col">Nom</th>
							<th scope="col">Prénom</th>
							<th scope="col">Date de naissance</th>
							<th scope="col">Adresse</th>
							<th scope="col">Tél</th>
							<th scope="col">Tél Fix</th>
							<th scope="col">Fax</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${clients}" var="client">
							<tr>
								<td>${client.numero}</td>
								<td>${client.civilite}</td>
								<td>${client.nom}</td>
								<td>${client.prenom}</td>
								<td>${client.dateNaissance}</td>
								<td>${client.adresse}</td>
								<td>${client.telephone}</td>
								<td>${client.fix}</td>
								<td>${client.fax}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>