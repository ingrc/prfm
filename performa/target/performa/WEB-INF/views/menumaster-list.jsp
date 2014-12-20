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
							<spring:message code="menumaster.list.title" />
						</h3>
						<div class="panel-toolbar">
							<a href="<c:url value="/menumaster/form.html" />"
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
											<spring:message code="form.delete.result" arguments="${deletedItem}" /><br/>
										</c:if>
										<c:if test="${not empty deleteFailedItem}">
											<spring:message code="form.delete.result.failed" arguments="${deleteFailedItem}" />
										</c:if>
										</p>
									</div>
									
								</c:if>
							</p>
							<hr>

							<form action="<c:url value="/menumaster/list.html" />"
								method="POST">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th></th>
											<th>Id</th>
											<th>Display Name</th>
											<th>Url</th>
											<th>Menu Level</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="menu">
											<tr>
												<td>
													<div class="checkbox">
														<input type="checkbox" id="left-${menu.id}" name="id"
															value="${menu.id}">
													</div>
												</td>
												<td>${menu.id}</td>
												<td>${menu.displayname}</td>
												<td>${menu.url}</td>
												<td>${menu.menulevel}</td>
												<td><a
													href="<c:url value="/menumaster/form.html?id=${menu.id}" />"
													class="btn btn-info"><i class="fa fa-pencil"></i> <spring:message
															code="form.edit" />
													</a>&nbsp; 
												 	<a href="<c:url value="/menumasterleft/list.html?menuMasterId=${menu.id}" />"
													class="btn btn-info"><i class="imoon imoon-settings"></i>
														<spring:message code="menumaster.list.manageleftmenu" /></a>
													
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>

								<input type="submit" class="btn btn-danger"
									value="<spring:message code="form.delete"/>" name="delete"
									id="delete"
									onclick="return confirm('<spring:message code="form.delete.confirm"/>')" />

							</form>
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




</body>
</html>