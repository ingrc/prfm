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
							<spring:message code="mitigationcontrol.form.title" />
						</h3>
						<div class="panel-toolbar">
							<a href="<c:url value="/mitigationcontrol/list.html" />"
								class="btn btn-success"><i class="fa fa-chevron-left"></i> <spring:message
									code="form.back" /></a>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="col-xs-12">
							<c:url value="/mitigationcontrol/form.html" var="formActionUrl" />
							<form:form commandName="formModel" action="${formActionUrl}"
								cssClass="form-horizontal" method="POST">
								<input type="hidden" name="formStat" id="formStat"
									value="${formStat}">
								<br />


								<div class="panel panel-default">
									<div class="panel-body">
										
										<div class="form-group">
											<label class="col-sm-3 control-label" for="mitigationControlId"><spring:message
													code="mitigationcontrol.form.mitigationcontrolid" /> </label>
											<div class="col-sm-9">
												<form:input path="mitigationControlId" cssClass="form-control" />
												<form:errors path="mitigationControlId" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="reference"><spring:message
													code="mitigationcontrol.form.reference" /> </label>
											<div class="col-sm-9">
												<form:input path="reference" cssClass="form-control"/>
												<form:errors path="reference" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="name"><spring:message
													code="mitigationcontrol.form.name" /> </label>
											<div class="col-sm-9">
												<form:input path="name" cssClass="form-control"/>
												<form:errors path="name" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label"
												for="mitigationtype"><spring:message
													code="mitigationcontrol.form.mitigationtype" /> </label>
											<div class="col-sm-9">
												<form:select path="mitigationType" cssClass="form-control">
													<form:option value="${null}"><spring:message code="mitigationcontrol.form.mitigationtype.select" /> </form:option>
													<form:options items="${mitigationTypeList }" itemLabel="text" itemValue="ctype"/>
												</form:select>
												<form:errors path="mitigationType"
													cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="frequency"><spring:message
													code="mitigationcontrol.form.frequency" /> </label>
											<div class="col-sm-9">
												<form:input path="frequency" cssClass="form-control"/>
												<form:errors path="frequency" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="organization"><spring:message
													code="mitigationcontrol.form.organization" /> </label>
											<div class="col-sm-9">
												<form:select path="organization" cssClass="form-control">
													<form:option value="${null}">Select Organization</form:option>
													<form:options items="${organizationList }" itemLabel="name"
														itemValue="orgc" />
												</form:select>
												<form:errors path="organization" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="businessprocess"><spring:message
													code="mitigationcontrol.form.businessprocess" /> </label>
											<div class="col-sm-9">
												<form:select path="businessProcess" cssClass="form-control"
													id="businessProcess">
													<form:option value="${null}">Select Business Process</form:option>
													<form:options items="${bprList }" itemLabel="text"
														itemValue="bprc" />
												</form:select>
												<form:errors path="businessProcess" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="subprocess"><spring:message
													code="mitigationcontrol.form.subprocess" /> </label>
											<div class="col-sm-9">
												<!-- <input type="text" id="subprocess" class="form-control"> -->
												<form:select path="subProcess" id="subProcess"
													name="subProcess" class="form-control">
													<form:option value="${null }">Select Sub Process</form:option>
													<form:options items="${sprList }" itemLabel="text"
														itemValue="sbpr" />
												</form:select>
												<form:errors path="subProcess" cssClass="help-block" />
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


		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								$("select[id='businessProcess']")
										.change(
												function() {
													var bprc = $(this).val();

													$
															.ajax({
																type : "GET",
																url : '<c:url value="/mitigationcontrol/sprlist/"/>'
																		+ bprc,
																success : function(
																		data) {
																	var sel = $("select[id='subProcess']");
																	sel.empty();
																	for (var i = 0; i < data.length; i++) {
																		sel
																				.append('<option value="' + data[i].sbpr + '">'
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