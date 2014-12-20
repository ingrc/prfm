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
						<h3 class="panel-title">Report List</h3>
						<div class="panel-toolbar">
								
								<a href="<c:url value="/report/list.html" />"
									class="btn btn-success"><i class="fa fa-refresh"></i> Refresh</a>
							</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="col-xs-12">
							<p></p>
							<hr>

							<table class="table table-bordered">
								<thead>
									<tr>
										<th>Report Name</th>
										<th><div align="center">Last Generate</div></th>
										<th>Status</th>
										<th width="150" align="center"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listModel}" var="row">
										<tr>
											<td>${row.reportName}</td>
											<td align="center">${row.lastGenerate}</td>
											<td>${row.status}</td>
											<td align="center"><a title="Generate Report"
												href="<c:url value="/report/list.html?reportType=${row.reportCode}" />"
												class="btn btn-info"><i class="fa fa-cogs"></i> </a> 
												<a href="<c:url value="/report/get?reportType=${row.reportCode}" />" 
													target="_blank"
													title="Download Report" class="btn btn-info"><i
													class="imoon imoon-settings"></i></a></td>
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

</body>
</html>