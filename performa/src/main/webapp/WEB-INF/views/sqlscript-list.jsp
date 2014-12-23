<%@ include file="/includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value="/sqlscript/list.html" />"
		method="POST">

		<div id="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default panel-no-padding">
						<div class="panel-heading">
							<h3 class="panel-title">
								<spring:message code="sqlscript.list.title" />
							</h3>
							<div class="panel-toolbar">
								<input type="submit" class="btn btn-danger"
									value="<spring:message code="form.delete"/>" name="delete"
									id="delete"
									onclick="return confirm('<spring:message code="form.delete.confirm"/>')" />
								<a href="<c:url value="/sqlscript/form.html" />"
									class="btn btn-success"><i class="fa fa-plus"></i> <spring:message
										code="form.add" /></a>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="col-xs-12">
								<p>
									<c:if test="${not empty deletedItem || not empty deleteFailedItem }">
									
									<div class="well">
										<p>
										
										<span class="label label-info">Info</span><br/>
										<c:if test="${not empty deletedItem}">
											<spring:message code="form.delete.result" arguments="${deletedItem}" argumentSeparator=";"/><br/>
										</c:if>
										<c:if test="${not empty deleteFailedItem}">
											<spring:message code="form.delete.result.failed" arguments="${deleteFailedItem}" argumentSeparator=";"/>
										</c:if>
										</p>
									</div>
									
								</c:if>
								</p>
								<hr>

								<table class="table table-bordered">
									<thead>
										<tr>
											<th width="10"></th>
											<th><spring:message code="sqlscript.list.id" />
											</th>
											<th><spring:message code="sqlscript.list.name" />
											</th>
											<th><spring:message code="sqlscript.list.sqlscript" />
											</th>
											<th><spring:message
													code="sqlscript.list.ordo" /></th>
											<th  align="center"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listModel}" var="row">
											<tr>
												<td>
													<div class="checkbox">
														<input type="checkbox" id="left-${row.id}"
															name="rowid" value="${row.id}">
													</div>
												</td>
												<td>
													${row.id}
												</td>
												<td>${row.name}</td>
												<td>${row.sqlScript}</td>
												<td>${row.ordo}</td>
												<td align="center"><a
													href="<c:url value="/sqlscript/form.html?id=${row.id}" />"
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