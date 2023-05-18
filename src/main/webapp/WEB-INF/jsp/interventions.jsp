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
		$('#datepickerdebut').datepicker();
		$('#datepickerfin').datepicker();
	});
</script>
<title>Interventions</title>
</head>
<body>
	<%@ include file="nav.html"%>
	<div class="container">

		<div class="row" style="margin-top: 50px;">
			<div class="col-md-3">
				<form method="post" action="/gim/interventions">
					<div class="input-group">
						<select class="form-select" name="vehicule">
							<c:forEach items="${vehicules}" var="vehicule">
								<option value="${vehicule.numero}">${vehicule.modele}</option>
							</c:forEach>
						</select>
					</div>
					<div class="input-group" style="margin-top: 10px;">
						<select class="form-select" name="employe">
							<c:forEach items="${employes}" var="employe">
								<option value="${employe.numero}">${employe.nom}
									${employe.prenom}</option>
							</c:forEach>
						</select>
					</div>
					<div class="input-group date" id="datepickerdebut"
						style="margin-top: 10px;">
						<input type="text" class="form-control" name="datedebut"
							required="required" placeholder="Date du debut"> <span
							class="input-group-append"> <span
							class="input-group-text bg-white d-block"> <i
								class="fa fa-calendar"></i>
						</span>
						</span>
					</div>
					<div class="input-group date" id="datepickerfin"
						style="margin-top: 10px;">
						<input type="text" class="form-control" name="datefin"
							required="required" placeholder="Date de fin"> <span
							class="input-group-append"> <span
							class="input-group-text bg-white d-block"> <i
								class="fa fa-calendar"></i>
						</span>
						</span>
					</div>
					<div class="input-group" style="margin-top: 10px;">
						<input type="text" class="form-control" placeholder="Cout"
							name="cout" required="required">
					</div>
					<button type="submit" class="btn btn-primary"
						style="margin-top: 10px;">Ajouter</button>

					<c:if test="${errors.size() gt 0}">
						<div class="alert alert-danger" role="alert">
							<c:forEach items="${errors}" var="error">
								<li>${error}</li>
							</c:forEach>
						</div>
					</c:if>

				</form>
			</div>
			<div class="col-md-9">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Vehicule</th>
							<th scope="col">Intervenant</th>
							<th scope="col">Date du debut</th>
							<th scope="col">Date de fin</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${interventions}" var="intervention">
							<tr>
								<td>${intervention.numero}</td>
								<td>${intervention.vehicule}</td>
								<td>${intervention.intervenant}</td>
								<td>${intervention.dateDebut}</td>
								<td>${intervention.dateFin}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>

	</div>
</body>
</html>