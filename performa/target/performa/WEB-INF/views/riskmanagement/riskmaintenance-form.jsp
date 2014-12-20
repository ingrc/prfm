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
							<spring:message code="riskmaintenance.form.title" />
						</h3>
						<div class="panel-toolbar">
							<a href="<c:url value="/riskmaintenance/list.html" />"
								class="btn btn-success"><i class="fa fa-chevron-left"></i> <spring:message
									code="form.back" /></a>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="col-xs-12">
							<c:url value="/riskmaintenance/form.html" var="formActionUrl" />
							<form:form commandName="formModel" action="${formActionUrl}"
								cssClass="form-horizontal" method="POST">
								<input type="hidden" name="formStat" id="formStat"
									value="${formStat}">
								<br />


								<div class="panel panel-default">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-sm-3 control-label" for="active"><spring:message
													code="riskmaintenance.form.active" /> </label>
											<div class="col-sm-9">
												<!-- <input type="checkbox" class="form-control" id="active" /> -->
												<form:checkbox path="active" 
													value="1" />
												<form:errors path="active" cssClass="help-block" />

											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label" for="riskid"><spring:message
													code="riskmaintenance.form.riskid" /> </label>
											<div class="col-sm-9">
												<!-- <input type="text" id="riskid" class="form-control"> -->
												<form:input path="riskId" cssClass="form-control" />
												<form:errors path="riskId" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="risktype"><spring:message
													code="riskmaintenance.form.risktype" /> </label>
											<div class="col-sm-9">
												<!-- <input type="text" id="riskid" class="form-control"> -->
												<form:select path="riskType" cssClass="form-control">
													<form:option value="">Select Risk Type</form:option>
													<form:options items="${risktypeList }" itemLabel="text"
														itemValue="rtype" />
												</form:select>
												<form:errors path="riskType" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="risklevel"><spring:message
													code="riskmaintenance.form.risklevel" /> </label>
											<div class="col-sm-9">
												<!-- <input type="text" id="risklevel" class="form-control"> -->
												<form:select path="riskLevel" cssClass="form-control">
													<form:option value="">Select Risk Level</form:option>
													<form:options items="${risklevelList }" itemLabel="text"
														itemValue="level" />
												</form:select>
												<form:errors path="riskLevel" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label"
												for="financialassertions"><spring:message
													code="riskmaintenance.form.financialassertions" /> </label>
											<div class="col-sm-9">
												<form:checkboxes items="${financialList }"
													path="financialAssertions"
													itemLabel="text" itemValue="assr" element="span class='checkbox'"/>
												<form:errors path="financialAssertions"
													cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="businessprocess"><spring:message
													code="riskmaintenance.form.businessprocess" /> </label>
											<div class="col-sm-9">
												<!-- <input type="text" id="businessprocess"
															class="form-control"> -->
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
													code="riskmaintenance.form.subprocess" /> </label>
											<div class="col-sm-9">
												<!-- <input type="text" id="subprocess" class="form-control"> -->
												<form:select path="subProcess" id="subProcess"
													name="subProcess" class="form-control">
													<form:option value="${null }">Select Sub Process</form:option>
													<form:options items="${sprList }" itemLabel="text"
														itemValue="sbpr" />
												</form:select>
												<!-- 
														<select id="subProcess" name="subProcess" class="form-control">
															<option value="">Select Sub Process</option>
														</select> -->
												<%-- <form:select path="subProcess" cssClass="form-control" id="subProcess">
															<form:option value="">Select Sub Process</form:option>										
														</form:select> --%>
												<form:errors path="subProcess" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="riskdescription"><spring:message
													code="riskmaintenance.form.riskdescription" /> </label>
											<div class="col-sm-9">
												<!-- <textarea rows="3" cols="5" id="riskdescription"
															class="form-control"></textarea> -->
												<form:textarea path="riskDescription"
													cssClass="form-control" />
												<form:errors path="riskDescription" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="controlobjective"><spring:message
													code="riskmaintenance.form.controlobjective" /> </label>
											<div class="col-sm-9">
												<!-- <textarea rows="3" cols="5" id="controlobjective"
															class="form-control"></textarea> -->
												<form:textarea path="controlObjective"
													cssClass="form-control" />
												<form:errors path="controlObjective" cssClass="help-block" />
											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-3 control-label" for="fid1"><spring:message
													code="riskmaintenance.form.fid1" /> </label>
											<div class="col-sm-9">
												<form:select path="fid1" id="fid1" cssClass="form-control">
													<form:option value="${null}">--Select--</form:option>
													<form:options items="${acFuncList }" itemLabel="text"
														itemValue="fid" />
												</form:select>
												<form:errors path="fid1" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="fid2"><spring:message
													code="riskmaintenance.form.fid2" /> </label>
											<div class="col-sm-9">
												<form:select path="fid2" id="fid2" cssClass="form-control">
													<form:option value="${null}">--Select--</form:option>
													<form:options items="${acFuncList }" itemLabel="text"
														itemValue="fid" />
												</form:select>
												<form:errors path="fid2" cssClass="help-block" />
											</div>
										</div>										
										<div class="form-group">
											<label class="col-sm-3 control-label" for="fid3"><spring:message
													code="riskmaintenance.form.fid3" /> </label>
											<div class="col-sm-9">
												<form:select path="fid3" id="fid3" cssClass="form-control">
													<form:option value="${null}">--Select--</form:option>
													<form:options items="${acFuncList }" itemLabel="text"
														itemValue="fid" />
												</form:select>
												<form:errors path="fid3" cssClass="help-block" />
											</div>
										</div>	
										<div class="form-group">
											<label class="col-sm-3 control-label" for="fid4"><spring:message
													code="riskmaintenance.form.fid4" /> </label>
											<div class="col-sm-9">
												<form:select path="fid4" id="fid4" cssClass="form-control">
													<form:option value="${null}">--Select--</form:option>
													<form:options items="${acFuncList }" itemLabel="text"
														itemValue="fid" />
												</form:select>
												<form:errors path="fid4" cssClass="help-block" />
											</div>
										</div>	
										<div class="form-group">
											<label class="col-sm-3 control-label" for="fid5"><spring:message
													code="riskmaintenance.form.fid5" /> </label>
											<div class="col-sm-9">
												<form:select path="fid5" id="fid5" cssClass="form-control">
													<form:option value="${null}">--Select--</form:option>
													<form:options items="${acFuncList }" itemLabel="text"
														itemValue="fid" />
												</form:select>
												<form:errors path="fid5" cssClass="help-block" />
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
																url : '<c:url value="/riskmaintenance/sprlist/"/>'
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