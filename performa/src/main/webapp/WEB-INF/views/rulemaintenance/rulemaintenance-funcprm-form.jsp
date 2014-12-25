<%@ include file="/includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
	<div id="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default panel-no-padding">
					<div class="panel-heading">
						<h3 class="panel-title">
							<spring:message code="rulemaintenance.funcprm.list.title" />
						</h3>
						<div class="panel-toolbar">
							<a href="<c:url value="/rulemaintenance-funcprm/list.html" />"
								class="btn btn-success"><i class="fa fa-chevron-left"></i> <spring:message
									code="form.back" /></a>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="col-xs-12">
							<c:url value="/rulemaintenance-funcprm/form.html"
								var="formActionUrl" />
							<form:form commandName="formModel" action="${formActionUrl}"
								cssClass="form-horizontal" method="POST"
								enctype="multipart/form-data">
								<input type="hidden" name="formStat" id="formStat"
									value="${formStat}">
								<br />
								<div class="panel panel-default">
									<div class="panel-body">
										<c:if test="${formStat == 'update' }">
											<div class="form-group">
												<label class="col-sm-3 control-label" for="from_val"><spring:message
														code="rulemaintenance.funcprm.bprc" /></label>
												<div class="col-sm-9">
													<form:select path="bprc" cssClass="form-control" id="businessProcessSelect" disabled="true">
														<option value=${null } >Select Business Process</option>
														<c:forEach items="${businessProcessList}" var="row">
															<c:choose>
																<c:when test="${row.bprc == selectedBprc }">
																	<option value="${row.bprc }" selected="selected" >${row.text }</option>
																</c:when>
																<c:otherwise>
																	<option value="${row.bprc }" >${row.bprc }-
																		${row.text }</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</form:select>
													<form:hidden path="bprc"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label" for="from_val"><spring:message
														code="rulemaintenance.funcprm.func" /></label>
												<div class="col-sm-9">
													<form:select path="fid" cssClass="form-control"
														id="functionSelect" disabled="true">
														<option value=${null }>Select Function</option>
														<c:forEach items="${functionList}" var="row">
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
													</form:select>
													<form:hidden path="fid"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label" for="from_val"><spring:message
														code="rulemaintenance.funcprm.act" /></label>
												<div class="col-sm-9">
													<form:select path="tcode" cssClass="form-control"
														id="actionSelect" disabled="true">
														<option value=${null }>Select Action</option>
														<c:forEach items="${actionList}" var="row">
															<c:choose>
																<c:when test="${row.tcode == selectedAction }">
																	<option value="${row.tcode}" selected="selected">${row.ttext }</option>
																</c:when>
																<c:otherwise>
																	<option value="${row.tcode}">${row.tcode}-
																		${row.ttext}</option>
																</c:otherwise>
															</c:choose>

														</c:forEach>
													</form:select>
													<form:hidden path="tcode"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label" for="object"><spring:message
														code="rulemaintenance.funcprm.object" /></label>
												<div class="col-sm-9">
													<form:select path="object" cssClass="form-control" id="objectSelect" disabled="true">
														<option value=${null }>Select Function</option>
														<c:forEach items="${objetcTList}" var="row">
															<c:choose>
																<c:when test="${row.object == selectedObject }">
																	<option value="${row.object }" selected="selected">${row.ttext }</option>
																</c:when>
																<c:otherwise>
																	<option value="${row.object }">${row.object }-
																		${row.ttext }</option>
																</c:otherwise>
															</c:choose>

														</c:forEach>
													</form:select>
													<form:hidden path="object"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label" for="field"><spring:message
														code="rulemaintenance.funcprm.field" /></label>
												<div class="col-sm-9">
													<form:select path="field" cssClass="form-control" id="fieldSelect" disabled="true">
														<option value=${null }>Select Action</option>
														<c:forEach items="${fieldList }" var="row">
															<c:choose>
																<c:when test="${row.key == selectedField }">
																	<option value="${row.key}" selected="selected">${row.text }</option>
																</c:when>
																<c:otherwise>
																	<option value="${row.key}">${row.key}-
																		${row.text}</option>
																</c:otherwise>
															</c:choose>

														</c:forEach>
													</form:select>
													<form:hidden path="field"/>
												</div>
											</div>
										</c:if>
										<c:if test="${formStat == 'addnew' }">
											<div class="form-group">
												<label class="col-sm-3 control-label" for="from_val"><spring:message
														code="rulemaintenance.funcprm.bprc" /></label>
												<div class="col-sm-9">
													<form:select path="bprc" cssClass="form-control"
														id="businessProcessSelect">
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
													</form:select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label" for="from_val"><spring:message
														code="rulemaintenance.funcprm.func" /></label>
												<div class="col-sm-9">
													<form:select path="fid" cssClass="form-control"
														id="functionSelect">
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
													</form:select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label" for="from_val"><spring:message
														code="rulemaintenance.funcprm.act" /></label>
												<div class="col-sm-9">
													<form:select path="tcode" cssClass="form-control"
														id="actionSelect">
														<option value=${null }>Select Action</option>
														<c:forEach items="${actionList }" var="row">
															<c:choose>
																<c:when test="${row.tcode == selectedAction }">
																	<option value="${row.tcode}" selected="selected">${row.ttext }</option>
																</c:when>
																<c:otherwise>
																	<option value="${row.tcode}">${row.tcode}-
																		${row.ttext}</option>
																</c:otherwise>
															</c:choose>

														</c:forEach>
													</form:select>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-3 control-label" for="object"><spring:message
														code="rulemaintenance.funcprm.object" /></label>
												<div class="col-sm-9">
													<form:select path="object" cssClass="form-control" id="objectSelect">
														<option value=${null }>Select Function</option>
														<c:forEach items="${objetcTList}" var="row">
															<c:choose>
																<c:when test="${row.object == selectedObject }">
																	<option value="${row.object }" selected="selected">${row.ttext }</option>
																</c:when>
																<c:otherwise>
																	<option value="${row.object }">${row.object }-
																		${row.ttext }</option>
																</c:otherwise>
															</c:choose>

														</c:forEach>
													</form:select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-3 control-label" for="field"><spring:message
														code="rulemaintenance.funcprm.field" /></label>
												<div class="col-sm-9">
													<form:select path="field" cssClass="form-control" id="fieldSelect">
														<option value=${null }>Select Action</option>
														<c:forEach items="${fieldList }" var="row">
															<c:choose>
																<c:when test="${row.key == selectedField }">
																	<option value="${row.key}" selected="selected">${row.text }</option>
																</c:when>
																<c:otherwise>
																	<option value="${row.key}">${row.key}-
																		${row.text}</option>
																</c:otherwise>
															</c:choose>

														</c:forEach>
													</form:select>
												</div>
											</div>
										</c:if>


										<div class="form-group">
											<label class="col-sm-3 control-label" for="from_val"><spring:message
													code="rulemaintenance.funcprm.from_value" /> </label>
											<div class="col-sm-9">
												<form:input path="from_val" cssClass="form-control" />
												<form:errors path="from_val" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="to_val"><spring:message
													code="rulemaintenance.funcprm.to_value" /> </label>
											<div class="col-sm-9">
												<form:input path="to_val" cssClass="form-control" />
												<form:errors path="to_val" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="search_type"><spring:message
													code="rulemaintenance.funcprm.search_type" /> </label>
											<div class="col-sm-9">
												<form:select path="search_type" cssClass="form-control"
													id="search_type">
													<form:option value="or">OR</form:option>
													<form:option value="and">AND</form:option>
												</form:select>
												<form:errors path="search_type" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="status"><spring:message
													code="rulemaintenance.funcprm.status" /> </label>
											<div class="col-sm-9">
												<form:select path="status" cssClass="form-control"
													id="status">
													<form:option value="0">0 : Enable</form:option>
													<form:option value="1">1 : Disable</form:option>
												</form:select>
												<form:errors path="status" cssClass="help-block" />
											</div>
										</div>

										<div class="form-group form-actions">
											<div class="col-sm-9 col-sm-offset-3">
												<button type="submit" class="btn btn-primary">
													<i class="fa fa-angle-right"></i>
													<spring:message code="form.submit" />
												</button>
												<button type="reset" class="btn btn-warning">
													<i class="fa fa-repeat"></i>
													<spring:message code="form.reset" />
												</button>
											</div>
										</div>
									</div>
									<!-- /.panel-body -->
								</div>

							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
																sel
																		.append('<option>Select Function</option>');
																for (var i = 0; i < data.length; i++) {
																	sel
																			.append('<option value="' + data[i].fid + '">'
																					+ data[i].fid
																					+ " - "
																					+ data[i].text
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
																sel
																		.append('<option>Select Action</option>');
																for (var i = 0; i < data.length; i++) {
																	sel
																			.append('<option value="' + data[i].tcode + '">'
																					+ data[i].tcode
																					+ " - "
																					+ data[i].ttext
																					+ '</option>');
																}
																sel
																		.selectpicker('refresh');
															}
														});
											});

							$("select[id='objectSelect']")
									.change(
											function() {
												var object = $(this).val();

												$
														.ajax({
															type : "GET",
															url : '<c:url value="/rulemaintenance-funcprm/functionobjectlist/"/>'
																	+ object,
															success : function(
																	data) {
																var sel = $("select[id='fieldSelect']");
																sel.empty();
																sel
																		.append('<option>Select Field</option>');
																for (var i = 0; i < data.length; i++) {
																	sel
																			.append('<option value="' + data[i].key + '">'
																					+ data[i].key
																					+ " - "
																					+ data[i].text
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