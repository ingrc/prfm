<%@ include file="/includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value="/rulemaintenance-acfunc/list.html" />"
		method="POST">
		<div id="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default panel-no-padding">
						<div class="panel-heading">
							<h3 class="panel-title">
								<spring:message code="rulemaintenance.acfunc.list.title" />
							</h3>
							<div class="panel-toolbar">
								<input type="submit" class="btn btn-danger"
									value="<spring:message code="form.delete"/>" name="delete"
									id="delete"
									onclick="return confirm('<spring:message code="form.delete.confirm"/>')" />

								<a
									href="<c:url value="/rulemaintenance-acfunc/form.html" />"
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

								<table class="table table-bordered">
									<thead>
										<tr>
											<th width="10"></th>
											<th><spring:message code="rulemaintenance.acfunc.list.fid" /></th>
											<th><spring:message code="rulemaintenance.acfunc.list.text" /></th>
											<th><spring:message code="rulemaintenance.acfunc.list.scope" /></th>
											<th><spring:message code="rulemaintenance.acfunc.bpr.list.text" /></th>
											<th></th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listModel}" var="model">
											<tr>
												<td>
													<div class="checkbox">
														<input type="checkbox" id="left-${model.fid}"
															name="rowid"
															value="${model.fid}">
													</div>
												</td>
												<td>${model.fid}</td>
												<td>${model.text }</td>
												<td>${model.scope }</td>
												<td>${model.bprtext }</td>
												<td align="center"><a
													href="<c:url value="/rulemaintenance-acfunc/form.html?fid=${model.fid}" />"
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
</body>
</html>