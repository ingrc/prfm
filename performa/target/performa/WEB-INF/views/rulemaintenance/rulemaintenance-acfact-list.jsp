<%@ include file="/includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value="/rulemaintenance-acfact/list.html" />"
		method="POST">
		<div id="content">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default panel-no-padding">
						<div class="panel-heading">
							<h3 class="panel-title">
								<spring:message code="rulemaintenance.acfact.list.title" />
							</h3>
							<div class="panel-toolbar">
								<input type="submit" class="btn btn-danger"
									value="<spring:message code="form.delete"/>" name="delete"
									id="delete"
									onclick="return confirm('<spring:message code="form.delete.confirm"/>')" />

								<a
									href="<c:url value="/rulemaintenance-acfact/form.html?fid=${selectedFunction}" />"
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
								
								<div>
									<b>Select Function :</b>
									<select id="functionSelect"  onchange="location='?fid='+this.options[this.selectedIndex].value;">
										<option value=${null }>Select Function</option>
										<c:forEach items="${functionList }" var="row">
											<c:choose>
												<c:when test="${row.fid == selectedFunction }">
													<option value="${row.fid }" selected="selected">${row.text }</option>
												</c:when>
												<c:otherwise>
													<option value="${row.fid }" >${row.text }</option>
												</c:otherwise>
											</c:choose>
											
										</c:forEach>
									</select>
									
								</div>

								<table class="table table-bordered">
									<thead>
										<tr>
											<th width="10"></th>
											<th><spring:message code="rulemaintenance.acfact.list.fid.text" /></th>
											<th><spring:message code="rulemaintenance.acfact.list.tcode.text" /></th>
											<th><spring:message code="rulemaintenance.acfact.stat.text" /></th>
											<th></th>
											
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listModel}" var="model">
											<tr>
												<td>
													<div class="checkbox">
														<input type="checkbox" id="left-${model.fid}-${model.tcode}"
															name="rowid"
															value="${model.fid}-${model.tcode}">
													</div>
												</td>
												<td>${model.fidtext}</td>
												<td>${model.tcode} - ${model.tcodetext }</td>
												<td>${model.stat }</td>
												<td align="center"><a
													href="<c:url value="/rulemaintenance-acfact/form.html?fid=${model.fid}&tcode=${model.tcode}" />"
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