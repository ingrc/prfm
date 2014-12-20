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
							Upload to Database
						</h3>
						<div class="panel-toolbar">
						<a href="<c:url value="/accesscontrol/list.html" />"
							class="btn btn-success"><i class="fa fa-chevron-left"></i> <spring:message
								code="form.back" /></a>
					</div>
					</div>

					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="col-xs-12">
							<c:url value="/accesscontrol/form.html" var="formActionUrl" />
							<form:form commandName="formModel" action="${formActionUrl}"
								cssClass="form-horizontal" method="POST"
								enctype="multipart/form-data">

								<br />

								<div class="panel panel-default">
									<div class="panel-body">
										<div class="form-group">
											<label class="col-sm-3 control-label" for="table"><spring:message
													code="accesscontrol.form.table" /> </label>
											<div class="col-sm-9">
												<form:select path="tablename" cssClass="form-control"
													id="tablename">
													<form:option value="${null}">
														<spring:message code="user.form.dropdown" />
													</form:option>
													<form:options items="${tableMenuList }" itemLabel="label"
														itemValue="tablename" />
												</form:select>
												<form:errors path="tablename" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="filename"><spring:message
													code="accesscontrol.form.file" /> </label>
											<div class="col-sm-9">
												<form:select path="filename" cssClass="form-control"
													id="filename">
													<form:option value="${null}">
														<spring:message code="user.form.dropdown" />
													</form:option>
													<form:options items="${fileMenuList }"  />
												</form:select>
												<form:errors path="filename" cssClass="help-block" />
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
									<div class="panel-footer">
										<div class="row">
											<div class="col-sm-4">
												<span><spring:message
														code="accesscontrol.form.status" /> # </span> <span> Insert: ${formModel.actualrecord}
													of ${formModel.totalrecord }</span>
											</div>
											<!-- /.col-sm-4 -->
											<div class="col-sm-8">
												<span><spring:message code="accesscontrol.form.size" />
													: </span> <span>${formModel.filesize} Kb</span>

											</div>
											<!-- /.col-sm-8 -->
										</div>
										<!-- /.row -->

									</div>
								</div>

							</form:form>
						</div>
					</div>
					<!-- end panel-body -->
				</div>
			</div>
		</div>
	</div>

</body>
</html>