<%@ include file="/includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Menu Master Form</title>
</head>
<body>
	<div id="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default panel-no-padding">
					<div class="panel-heading">
						<h3 class="panel-title">
							<spring:message code="menumasterleft.form.title" arguments="${menumaster.displayname }" />
						</h3>
						<div class="panel-toolbar">
							<a href="<c:url value="/menumasterleft/list.html?menuMasterId=${menumaster.id }" />"
								class="btn btn-success"><i class="fa fa-chevron-left"></i> <spring:message
									code="form.back" /></a>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="col-xs-12">
							<br/>
							<c:url value="/menumasterleft/form.html" var="formActionUrl"/>
							<form:form method="POST" action="${formActionUrl}"
							class="form-horizontal form-bordered" commandName="modelForm">
								<form:hidden path="id"/>
								<form:hidden path="menuMasterId"/>
								<div class="form-group">
									<label class="col-md-3 control-label" for="displayname"><spring:message code="menumasterleft.form.displayname"/></label>
									<div class="col-md-9">
										<form:input path="displayname" id="displayname" class="form-control"/>
										<form:errors path="displayname" cssClass="help-block"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="url"><spring:message code="menumasterleft.form.url"/></label>
									<div class="col-md-9">
										<form:input path="url" id="url" class="form-control"/>
										<form:errors path="url" cssClass="help-block"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="description"><spring:message code="menumasterleft.form.description"/></label>
									<div class="col-md-9">
										<form:textarea path="description" id="description" class="form-control" cols="3"/>
										<form:errors path="description" cssClass="help-block"/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="parentId"><spring:message code="menumasterleft.form.parentmenu"/></label>
									<div class="col-md-9">
										<form:select path="parentId" id="parentId">											
											<form:option value="0">-- ROOT --</form:option>
											<c:forEach items="${parentMenuList}" var="parentMenu">
												<form:option value="${parentMenu.key }">${parentMenu.value }</form:option>
											</c:forEach>
										</form:select>
										<form:errors path="parentId" cssClass="help-block"/>
									</div>
								</div>
								<div class="form-group form-actions">
									<div class="col-md-9 col-md-offset-3">
										<form:button type="submit" class="btn btn-primary">
											<spring:message code="form.submit"/> <i class="fa fa-angle-right"></i>
										</form:button>
										<form:button type="reset" class="btn btn-warning">
											<spring:message code="form.reset"/> <i class="fa fa-repeat"></i>
										</form:button>
									</div>
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