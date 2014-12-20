<%@ include file="/includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value="/mitigationcontrol-attch/list.html" />"
		method="POST">
		<input type="hidden" name="controlId" id="controlId" value="${controlId }">
		<div id="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default panel-no-padding">
						<div class="panel-heading">
							<h3 class="panel-title">
								<spring:message code="mitigationcontrol.attch.list.title" />
							</h3>
							<div class="panel-toolbar">
								<a href="<c:url value="/mitigationcontrol/list.html" />"
								class="btn btn-success"><i class="fa fa-chevron-left"></i> <spring:message
									code="form.back" /></a>
								<input type="submit" class="btn btn-danger"
									value="<spring:message code="form.delete"/>" name="delete"
									id="delete"
									onclick="return confirm('<spring:message code="form.delete.confirm"/>')" />

								<a
									href="<c:url value="/mitigationcontrol-attch/form.html?controlId=${controlId }" />"
									class="btn btn-success"><i class="fa fa-plus"></i> <spring:message
										code="form.add" /></a>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="col-xs-12">
								<h4><b>Control Id:</b> ${controlId }</h4>
								<p>
									
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
								<hr>


								<table class="table table-bordered">
									<thead>
										<tr>
											<th width="10"></th>
											<th><spring:message code="mitigationcontrol.attch.list.filename" /></th>
											<th><spring:message code="mitigationcontrol.attch.list.extension" /></th>
											<th><spring:message code="mitigationcontrol.attch.list.filesize" /></th>
											<th><spring:message code="mitigationcontrol.attch.list.url" /></th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listModel}" var="row">
											<tr>
												<td>
													<div class="checkbox">
														<input type="checkbox" id="left-${row.attchId}"
															name="rowid"
															value="${row.attchId}">
													</div>
												</td>
												<td>${row.filename}</td>
												<td>${row.fileext}</td>
												<td>${row.filesize }</td>
												<td><a href="<c:url value="/mitigationcontrol-attch/attach.html?path=${row.filepath}&type=${row.fileext }" />" target="_blank" >[open file]</a> </td>
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