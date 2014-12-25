<%@ include file="/includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value="/rulemaintenance-funcprm/list.html" />"
		method="POST">
		<div id="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default panel-no-padding">
						<div class="panel-heading">
							<h3 class="panel-title">
								<spring:message code="rulemaintenance.funcprm.list.title" />
							</h3>
							<div class="panel-toolbar">
								<input type="submit" class="btn btn-danger"
									value="<spring:message code="form.delete"/>" name="delete"
									id="delete"
									onclick="return confirm('<spring:message code="form.delete.confirm"/>')" />

								<a
									href="<c:url value="/rulemaintenance-funcprm/form.html" />"
									class="btn btn-success"><i class="fa fa-plus"></i> <spring:message
										code="form.add" /></a>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="col-xs-12">
								<c:if test="${not empty deletedItem || not empty deleteFailedItem }">
									
									<div class="well">
										<p>										
										<span class="label label-info">Info</span><br/>
										<c:if test="${not empty deletedItem}">
											<spring:message code="form.delete.result" arguments="${deletedItem }" htmlEscape="false" argumentSeparator=";"/><br/>
										</c:if>
										<c:if test="${not empty deleteFailedItem}">
											<spring:message code="form.delete.result.failed" arguments="${ deleteFailedItem}" htmlEscape="false" argumentSeparator=";"/>
										</c:if>
										</p>
									</div>
									
								</c:if> 
								</p>
								
								<div class="form-group">
												<label class="col-md-3 control-label" for="from_val"><spring:message
														code="rulemaintenance.funcprm.bprc" /></label>
												<div class="col-sm-9">
													<select cssClass="form-control" id="businessProcessSelect">
														<option value=${null }>Select Business Process</option>
														<c:forEach items="${businessProcessList }" var="row">
															<c:choose>
																<c:when test="${row.bprc == selectedBprc }">
																	<option value="${row.bprc }" selected="selected">${row.text }</option>
																</c:when>
																<c:otherwise>
																	<option value="${row.bprc }">${row.bprc }-
																		${row.text }</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label" for="from_val"><spring:message
														code="rulemaintenance.funcprm.func" /></label>
												<div class="col-sm-9">
													<select cssClass="form-control" id="functionSelect">
														<option value=${null }>Select Function</option>
														<c:forEach items="${functionList }" var="row">
															<c:choose>
																<c:when test="${row.fid == selectedFunction }">
																	<option value="${row.fid }" selected="selected">${row.text }</option>
																</c:when>
																<c:otherwise>
																	<option value="${row.fid }">${row.fid }-
																		${row.text }</option>
																</c:otherwise>
															</c:choose>

														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label" for="from_val"><spring:message
														code="rulemaintenance.funcprm.act" /></label>
												<div class="col-sm-9">
													<select id="actionSelect"
														onchange="location='?bprc='+businessProcessSelect.options[businessProcessSelect.selectedIndex].value+'&fid='+functionSelect.options[functionSelect.selectedIndex].value+'&tcode='+this.options[this.selectedIndex].value;">
														<option value=${null }>Select Action</option>
														<c:forEach items="${actionList }" var="row">
															<c:choose>
																<c:when test="${row.tcode == selectedAction }">
																	<option value="${row.tcode}" selected="selected">${row.tcode} - ${row.ttext}</option>
																</c:when>
																<c:otherwise>
																	<option value="${row.tcode}">${row.tcode}-
																		${row.ttext}</option>
																</c:otherwise>
															</c:choose>

														</c:forEach>
													</select>
												</div>
											</div>

								<table class="table table-bordered">
									<thead>
										<tr>
											<th width="10"></th>
											<th><spring:message code="rulemaintenance.funcprm.object" /></th>
											<th><spring:message code="rulemaintenance.funcprm.field" /></th>
											<th><spring:message code="rulemaintenance.funcprm.from_value" /></th>
											<th><spring:message code="rulemaintenance.funcprm.to_value" /></th>
											<th><spring:message code="rulemaintenance.funcprm.search_type" /></th>
											<th><spring:message code="rulemaintenance.funcprm.status" /></th>
											<th></th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listModel}" var="model">
											<tr>
												<td>
													<div class="checkbox">
														<input type="checkbox" id="left-${model.bprc}-${model.fid}-${model.tcode}-${model.object}-${model.field}"
															name="rowid"
															value="${model.bprc}-${model.fid}-${model.tcode}-${model.object}-${model.field}">
													</div>
												</td>
												<td>${model.object}</td>
												<td>${model.field}</td>
												<td>${model.from_val}</td>
												<td>${model.to_val}</td>
												<td>${model.search_type}</td>
												<td>${model.status}</td>
												<td align="center"><a
													href="<c:url value="/rulemaintenance-funcprm/form.html?bprc=${model.bprc}&fid=${model.fid}&tcode=${model.tcode}&object=${model.object}&field=${model.field}" />"
													class="btn btn-info"><i class="fa fa-pencil"></i> <spring:message
															code="form.edit" /> </a>
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>




								<!-- /.list-group -->
								<br />
							</div>
							<p class="navbar-text navbar-right">
							0 = Active</br>
							1 = Inactive
							</p>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->

				</div>
				<!-- /.col-xs-12 -->
			</div>
			<!-- /.row -->
		</div>
	</form>
	<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$("select[id='businessProcessSelect']")
										.change(
												function() {
													var bprc = $(this).val();

													$
															.ajax({
																type : "GET",
																url : '<c:url value="/rulemaintenance-funcprm/functionlist/"/>'
																		+ bprc,
																success : function(
																		data) {
																	var sel = $("select[id='functionSelect']");
																	sel.empty();
																	sel.append('<option>Select Function</option>');
																	for (var i = 0; i < data.length; i++) {
																		sel
																				.append('<option value="' + data[i].fid + '">' +
																						data[i].fid + " - " + data[i].text
																						+ '</option>');
																	}
																	sel
																			.selectpicker('refresh');
																}
															});
												});
								
								$("select[id='functionSelect']")
								.change(
										function() {
											var fid = $(this).val();

											$
													.ajax({
														type : "GET",
														url : '<c:url value="/rulemaintenance-funcprm/functionactionlist/"/>'
																+ fid,
														success : function(
																data) {
															var sel = $("select[id='actionSelect']");
															sel.empty();
															sel.append('<option>Select Action</option>');
															for (var i = 0; i < data.length; i++) {
																sel
																		.append('<option value="' + data[i].tcode + '">' +
																				data[i].tcode + " - " + data[i].ttext
																				+ '</option>');
															}
															sel
																	.selectpicker('refresh');
														}
													});
										});
							});
		</script>
</body>
</html>