<%@ include file="/includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>User</title>
</head>
<body>
    <div class="page-header">
        <h1>User</h1>
    </div>
	<div id="content">
	<c:url value="/user/form.html" var="formActionUrl"/>
	<form:form method="POST" action="${formActionUrl}" class="form-horizontal form-bordered" commandName="formModel">
		<input type="hidden" name="formStat" id="formStat" value="${formStat}">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default panel-no-padding">
					<div class="panel-heading">
						<h3 class="panel-title">Login</h3>
						<div class="panel-toolbar">
							<a href="<c:url value="/user/list.html" />"
								class="btn btn-success"><i class="fa fa-chevron-left"></i> <spring:message
									code="form.back" /></a>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="col-xs-12">
							<div class="panel panel-default">
							  <div class="panel-body">
							  	<div class="form-group">
									<label class="col-md-3 control-label" for="function"><spring:message code="user.form.password"/></label>
									<div class="col-md-9">
										<form:input path="password" id="password" class="form-control"/>
										<form:errors path="password" cssClass="help-block"/>
									</div>
								</div>
							  	<div class="form-group">
									<label class="col-sm-3 control-label" for="orgc"><spring:message
											code="user.form.org" /> </label>
									<div class="col-sm-9">
										<form:select path="orgc" cssClass="form-control"
											id="orgc">
											<form:option value="${null}"><spring:message code="user.form.dropdown"/></form:option>
											<form:options items="${ugrpMenuList }" itemLabel="name"
												itemValue="vclass" />
										</form:select>
										<form:errors path="vclass" cssClass="help-block" />
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
						</div>
						</div>
					</div> <!--end panel-body -->
					
				</div>
			</div>
		</div>
		
		</form:form>
	</div><!-- end contend -->
</body>
</html>