<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:wrapper>

	<jsp:attribute name="imports">
		<script type="text/javascript"
			src="${baseUrl}/js/jquery-1.10.2.min.cache.js"></script>
		<script type="text/javascript"
			src="${baseUrl}/js/bootstrap.min.cache.js"></script>
		<script type="text/javascript"
			src="${baseUrl}/js/jquery.validate.min.cache.js"></script>
		<script type='text/javascript'
			src='${baseUrl}/js/knockout.min.cache.js'></script>
		
		<script type='text/javascript' src='${baseUrl}/admin/admin.js'></script>
		<script type='text/javascript' src='${baseUrl}/admin/dwr/engine.js'></script>
		<script type='text/javascript'
			src='${baseUrl}/admin/dwr/interface/ManagementService.js'></script>
	</jsp:attribute>

	<jsp:body>
		<div id="adminPage">
			<div class="panel-group" id="add-licence-accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#add-licence-accordion" href="#dist-collapse-one"><span
							class="glyphicon glyphicon-plus-sign"></span> Adicionar/Editar</a>
					</div>
					<div id="dist-collapse-one" class="panel-collapse collapse">
						<div class="panel-body">
							<form id="add-form" class="form-inline"
								data-bind="submit: saveLicence" role="form">
								<fieldset>
									<div class="form-group col-md-3">
										<input id="appId" name="appId" placeholder="appengine id"
											class="form-control" required type="text" minlength="6"
											maxlength="30">
									</div>
									<div class="form-group col-md-2">
										<input id="validUntil" name="validUntil"
											placeholder="validade" class="form-control" type="number"
											step="1" minlength="4" max="9999"
											data-bind="attr: {min: eRepDay}">
									</div>
										
									<div class="form-group col-md-2">
										<input id="userLimit" name="userLimit" placeholder="jogadores"
											class="form-control" type="number" step="1" minlength="1"
											min="1" max="9999">
									</div>
										
									<div class="form-group col-md-3">
										<input id="contactEmail" name="contactEmail"
											placeholder="email" class="form-control" type="email">
									</div>
					
									<div class="form-group col-md-1 col-md-offset-1">
										<button type="submit" class="btn btn-primary">Salvar</button>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class="form-group"></div>
	
			<table class="table table-striped table-hover" id="licences">
				<thead>
					<tr>
						<th onclick="AdminViewModel.loadLicences(sortById);">Application ID</th>
						<th>Pagamentos</th>
						<th onclick="AdminViewModel.loadLicences(sortByValidity);">Validade</th>
						<th onclick="AdminViewModel.loadLicences(sortByUserLimit);">Limite de Usuários</th>
						<th onclick="AdminViewModel.loadLicences(sortByEmail);">Email de Contato</th>
						<th onclick="AdminViewModel.loadLicences(sortByEdition);">Data da última
							alteração</th>
							<th onclick="AdminViewModel.loadLicences(sortByEditor);">Usuário</th>
					</tr>
				</thead>
				<tbody data-bind="foreach: licences">
					<tr
						data-bind="css: validUntilDay < $root.eRepDay() ? 'danger' 
									: validUntilDay < ($root.eRepDay + 14) ? 'warning' 
									: ''">
						<td data-bind="text: appId"></td>
						<td><a data-bind="click: $root.loadPayments">Listar <span
								class="glyphicon glyphicon-new-window"></span></a></td>
						<td data-bind="text: validUntilDay"></td>
						<td data-bind="text: userLimit"></td>
						<td data-bind="text: contactEmail"></td>
						<td data-bind="text: editedAt.toLocaleString()"></td>									
						<td data-bind="text: editedBy"></td>
					</tr>
				</tbody>
			</table>
			<div class="text-center" data-bind="if: licences().length === 0">
				<img id="loading" src="${baseUrl}/img/loader.cache.gif">
			</div>
		
			
			<div class="modal fade" id="paymentDetails" tabindex="-1"
				role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3>
								Pagamentos
							</h3>
						</div>
						<div class="modal-body">
							<div class="panel-group" id="add-payment-accordion">
								<div class="panel panel-default">
									<div class="panel-heading">
										<a class="accordion-toggle" data-toggle="collapse"
											data-parent="#add-payment-accordion"
											href="#dist-collapse-two"><span
											class="glyphicon glyphicon-plus-sign"></span> Adicionar/Editar</a>
									</div>
									<div id="dist-collapse-two" class="panel-collapse collapse">
										<div class="panel-body">
											<form id="add-form" class="form-inline"
												data-bind="submit: savePayment" role="form">
												<fieldset>
													<div class="form-group col-md-4">
														<input id="paymentDate" placeholder="data"
															class="form-control" type="number" step="1"
															data-bind="attr: {min: eRepDay}" max="9999">
													</div>
													<div class="form-group col-md-4">
														<input id="paymentValue" placeholder="valor"
															class="form-control" required type="number">
													</div>
													<div class="form-group col-md-4">
														<select id="paymentType">
															<option value="CC">CC</option>
															<option value="GOLD">Gold</option>
															<option value="WQ7">Armas Q7</option>
														</select>
													</div>
													<div class="form-group"></div>
													<div class="form-group col-md-4">
														<input id="paymentFromDay" placeholder="início"
															class="form-control" type="number" step="1"
															data-bind="attr: {min: eRepDay}" max="9999" required>
													</div>
													<div class="form-group col-md-4">
														<input id="paymentToDay" placeholder="final"
															class="form-control" type="number" step="1"
															data-bind="attr: {min: eRepDay}" max="9999" required>
													</div>
													<div class="form-group col-md-4">
														<textarea id="paymentNotes" placeholder="notas"
															class="form-control"></textarea>
													</div>
													<div class="form-group"></div>
													<div class="form-group col-md-1">
														<button type="submit" class="btn btn-primary">Salvar</button>
													</div>
												</fieldset>
											</form>
										</div>
									</div>
								</div>
							</div>
						
							<table class="table table-striped table-hover table-responsive"
								data-bind="if: payments().length > 0">
								<thead>
									<tr>
										<th>Dia</th>
										<th>Início</th>
										<th>Final</th>
										<th>Valor</th>
										<th>Tipo</th>
										<th>Usuário</th>
										<th>Notas</th>
									</tr>
								</thead>
			
								<tbody data-bind="foreach: payments">
									<tr>
										<td data-bind="text: paymentDate"></td>
										<td data-bind="text: fromDay"></td>
										<td data-bind="text: toDay"></td>
										<td data-bind="text: value"></td>
										<td data-bind="text: type"></td>
										<td data-bind="text: recordedBy"></td>
										<td data-bind="text: notes"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" data-dismiss="modal">
								Fechar
							</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	
	</jsp:body>
</t:wrapper>