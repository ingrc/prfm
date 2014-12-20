<%@ include file="/includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value="/user/list.html" />"
		method="POST">

		<div id="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default panel-no-padding">
						<div class="panel-heading">
							<h3 class="panel-title">
								Upload to Database
							</h3>
							<div class="panel-toolbar">
								<a href="<c:url value="/accesscontrol/form.html" />"
									class="btn btn-success"><i class="fa fa-plus"></i> <spring:message
										code="accesscontrol.list.topbutton" /></a>
								<a href="<c:url value="/accesscontrol/list.html" />"
									class="btn btn-success"><i class="fa fa-refresh"></i> Refresh</a>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="col-xs-12">

								<hr>

								<table class="table table-bordered">
									<thead>
										<tr>
											<th><spring:message code="accesscontrol.list.tablename" />
											</th>
											<th><spring:message code="accesscontrol.list.label" />
											</th>
											<th><spring:message code="accesscontrol.list.filename" />
											</th>
											<th><div align="right"><spring:message code="accesscontrol.list.record" /></div> 
											</th>
											<th><div align="center" >Upload Date</div> </th>
											<th>Status
											</th>
											<!--  <th></th>-->
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listModel}" var="model">
											<tr>
												<td>${model.tablename}</td>
												<td>${model.label}</td>
												<td>${model.filename}</td>
												<td align="right">${model.totalrecord}</td>
												<td align="center">${model.uploadDate }</td>
												<td>${model.stat}</td>
												
												<!--<td><a
													href="<c:url value="/user/form.html?username=" />"
													class="btn btn-info"><i class="fa fa-pencil"></i> <spring:message
															code="form.edit" /> </a></td>
											</tr>-->
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