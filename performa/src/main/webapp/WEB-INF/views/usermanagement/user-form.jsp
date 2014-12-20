<%@ include file="/includes/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>User</title>
</head>
<body>
	<div id="content">
		<c:url value="/user/form.html" var="formActionUrl" />
		<form:form method="POST" action="${formActionUrl}"
			class="form-horizontal form-bordered" commandName="formModel">
			<input type="hidden" name="formStat" id="formStat"
				value="${formStat}">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">User</h3>
							<div class="panel-toolbar">
								<a href="<c:url value="/user/list.html" />"
									class="btn btn-success"><i class="fa fa-chevron-left"></i>
									<spring:message code="form.back" /></a>
							</div>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs">
								<li class="active"><a href="#detail" data-toggle="tab">Detail</a></li>
								<li class=""><a href="#owner" data-toggle="tab">Owner</a></li>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<div class="tab-pane active" id="detail">
									<div class="well" style="margin: 20px 0;">
										<div class="row">
											<div class="col-md-12">
												<div class="panel panel-default panel-no-padding">
													<div class="panel-heading">
														<h3 class="panel-title">Personal</h3>
													</div>
													<!-- /.panel-heading -->
													<div class="panel-body">
														<div class="col-xs-12">
															<br />
															<div class="panel panel-default">
																<div class="panel-body">
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="username"><spring:message
																				code="user.form.username" /></label>
																		<div class="col-md-9">
																			<form:input path="username" id="username"
																				class="form-control" />
																			<form:errors path="username" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="firstname"><spring:message
																				code="user.form.firstname" /></label>
																		<div class="col-md-9">
																			<form:input path="firstname" id="firstname"
																				class="form-control" />
																			<form:errors path="firstname" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="lastname"><spring:message
																				code="user.form.lastname" /></label>
																		<div class="col-md-9">
																			<form:input path="lastname" id="lastname"
																				class="form-control" />
																			<form:errors path="lastname" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="phone"><spring:message
																				code="user.form.phone" /></label>
																		<div class="col-md-9">
																			<form:input path="phone" id="phone"
																				class="form-control" />
																			<form:errors path="phone" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="mobile"><spring:message
																				code="user.form.mobile" /></label>
																		<div class="col-md-9">
																			<form:input path="mobile" id="mobile"
																				class="form-control" />
																			<form:errors path="mobile" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="email"><spring:message
																				code="user.form.email" /></label>
																		<div class="col-md-9">
																			<form:input path="email" id="email"
																				class="form-control" />
																			<form:errors path="email" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="ext"><spring:message
																				code="user.form.ext" /></label>
																		<div class="col-md-9">
																			<form:input path="ext" id="vclass"
																				class="form-control" />
																			<form:errors path="ext" cssClass="help-block" />
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<!--end panel-body -->

												</div>
											</div>
										</div>
										<!-- end row -->
										<div class="row">
											<div class="col-md-12">
												<div class="panel panel-default panel-no-padding">
													<div class="panel-heading">
														<h3 class="panel-title">Location</h3>
													</div>
													<!-- /.panel-heading -->
													<div class="panel-body">
														<div class="col-xs-12">
															<div class="panel panel-default">
																<div class="panel-body">
																	<div class="form-group">
																		<label class="col-sm-3 control-label" for="orgc"><spring:message
																				code="user.form.org" /> </label>
																		<div class="col-sm-9">
																			<form:select path="orgc" cssClass="form-control"
																				id="orgc">
																				<form:option value="${null}">
																					<spring:message code="user.form.dropdown" />
																				</form:option>
																				<form:options items="${orgMenuList }"
																					itemLabel="name" itemValue="orgc" />
																			</form:select>
																			<form:errors path="orgc" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-sm-3 control-label" for="vclass"><spring:message
																				code="user.form.group" /> </label>
																		<div class="col-sm-9">
																			<form:select path="vclass" cssClass="form-control"
																				id="vclass">
																				<form:option value="${null}">
																					<spring:message code="user.form.dropdown" />
																				</form:option>
																				<form:options items="${ugrpMenuList }"
																					itemLabel="text" itemValue="vclass" />
																			</form:select>
																			<form:errors path="vclass" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="function"><spring:message
																				code="user.form.function" /></label>
																		<div class="col-md-9">
																			<form:input path="function" id="function"
																				class="form-control" />
																			<form:errors path="function" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="department"><spring:message
																				code="user.form.department" /></label>
																		<div class="col-md-9">
																			<form:input path="department" id="department"
																				class="form-control" />
																			<form:errors path="department" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="building"><spring:message
																				code="user.form.building" /></label>
																		<div class="col-md-9">
																			<form:input path="building" id="building"
																				class="form-control" />
																			<form:errors path="building" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="room"><spring:message
																				code="user.form.room" /></label>
																		<div class="col-md-9">
																			<form:input path="room" id="room"
																				class="form-control" />
																			<form:errors path="room" cssClass="help-block" />
																		</div>
																	</div>
																	<div class="form-group">
																		<label class="col-md-3 control-label" for="floor"><spring:message
																				code="user.form.floor" /></label>
																		<div class="col-md-9">
																			<form:input path="floor" id="floor"
																				class="form-control" />
																			<form:errors path="floor" cssClass="help-block" />
																		</div>
																	</div>

																</div>
															</div>
														</div>
													</div>
													<!--end panel-body -->

												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="tab-pane" id="owner">
									<div class="well" style="margin: 20px 0;">
										<div class="row">
											<div class="col-xs-12">
												<div class="panel panel-default panel-no-padding">
													<div class="panel-heading">
														<h3 class="panel-title">
															<spring:message code="user.form.panel.owner" />
														</h3>
													</div>
													<!-- /.panel-heading -->
													<div class="panel-body">
														<div class="col-xs-12">

															<br />
															<table class="table table-bordered">
																<thead>
																	<tr>
																		<th><spring:message code="user.list.ownertype" /></th>
																		<th><spring:message code="user.list.ownername" /></th>
																		<th><spring:message code="user.list.description" /></th>
																		<th><spring:message code="user.list.select" /></th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${towntModel}" var="towntModelVar">
																		<tr>
																			<td>${towntModelVar.ownty}</td>
																			<td>${towntModelVar.ownn}</td>
																			<td>${towntModelVar.text}</td>
																			<td>
											  								<div class="checkbox">
											  									<c:set var="lower" value="${fn:toLowerCase(towntModelVar.ownty)}" ></c:set>							
																				<form:checkbox path="towndto.${lower}ner" value="1"
																					cssClass="form-control" />
																				<form:errors path="email"
																					cssClass="help-block" />
																			</div>
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
									</div>
								</div>

							</div>
						</div>
						<!-- /.panel-body -->
						<div class="form-group form-actions">
							<div class="col-sm-10 col-sm-offset-9">
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
					<!-- /.panel -->

				</div>
			</div>
			<!-- LOGIN AREA -->

			<!-- END LOGIN AREA -->
			<!-- ROW OTHERS -->

			<!-- /.row -->
			<!-- END ROW OTHERS -->

		</form:form>
	</div>
	<!-- end contend -->
</body>
</html>