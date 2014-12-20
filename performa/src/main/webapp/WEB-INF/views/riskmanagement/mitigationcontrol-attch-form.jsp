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
							<spring:message code="mitigationcontrol.attch.form.title" />
						</h3>
						<div class="panel-toolbar">
							<a href="<c:url value="/mitigationcontrol-attch/list.html?controlId=${controlId }" />"
								class="btn btn-success"><i class="fa fa-chevron-left"></i> <spring:message
									code="form.back" /></a>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="col-xs-12">
							<c:url value="/mitigationcontrol-attch/form.html"
								var="formActionUrl" />
							<form:form commandName="formModel" action="${formActionUrl}"
								cssClass="form-horizontal" method="POST" enctype="multipart/form-data">
								
								<br />

								<div class="panel panel-default">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-sm-3 control-label" for="controlId"><spring:message
													code="mitigationcontrol.attch.form.controlid" /> </label>
											<div class="col-sm-9">
												<p class="form-control-static">${formModel.controlId}</p>
												<form:hidden path="controlId" />
												<form:errors path="controlId" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="filename"><spring:message
													code="mitigationcontrol.attch.form.filename" /> </label>
											<div class="col-sm-9">
												<input type="file" name="uploadedFile">
												<form:errors path="uploadedFile"  cssClass="help-block" />
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
</body>
</html>