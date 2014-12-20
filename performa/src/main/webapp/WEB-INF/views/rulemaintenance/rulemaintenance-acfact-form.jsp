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
							<spring:message code="rulemaintenance.acfact.list.title" />
						</h3>
						<div class="panel-toolbar">
							<a href="<c:url value="/rulemaintenance-acfact/list.html" />"
								class="btn btn-success"><i class="fa fa-chevron-left"></i> <spring:message
									code="form.back" /></a>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="col-xs-12">
							<c:url value="/rulemaintenance-acfact/form.html"
								var="formActionUrl" />
							<form:form commandName="formModel" action="${formActionUrl}"
								cssClass="form-horizontal" method="POST" enctype="multipart/form-data">
								<input type="hidden" name="formStat" id="formStat"
									value="${formStat}">
								<br />

								<div class="panel panel-default">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-sm-3 control-label" for="fid"><spring:message
													code="rulemaintenance.acfact.form.fid.text" /> </label>
											<div class="col-sm-9">
											<c:if test="${formStat == 'update' }">
												<form:select path="fid" cssClass="form-control" id="fid" >
													<form:option value="${null}" disabled="true">
														<spring:message code="rulemaintenance.acfact.form.dropdown" />
													</form:option>
													<form:options items="${acFuncList}" itemLabel="text"
														itemValue="fid" disabled="true"/>
												</form:select>
												<form:hidden path="fid"/>
											</c:if>	
											<c:if test="${formStat == 'addnew' }">
												<form:select path="fid" cssClass="form-control" id="fid" >
													<form:option value="${null}">
														<spring:message code="rulemaintenance.acfact.form.dropdown" />
													</form:option>
													<form:options items="${acFuncList}" itemLabel="text"
														itemValue="fid" />
												</form:select>
											</c:if>
												<form:errors path="fid" cssClass="help-block" />
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-3 control-label" for="tcode"><spring:message
													code="rulemaintenance.acfact.tcode" /> </label>
											<div class="col-sm-9">
												<form:input path="tcode" cssClass="form-control" />
												<form:errors path="tcode" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="stat"><spring:message
													code="rulemaintenance.acfact.stat" /> </label>
											<div class="col-sm-9">
												<form:select path="stat" cssClass="form-control" id="stat">
													<form:option value="0">0</form:option>
													<form:option value="1">1</form:option>
												</form:select>
												<form:errors path="stat" cssClass="help-block" />
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
</body>
</html>