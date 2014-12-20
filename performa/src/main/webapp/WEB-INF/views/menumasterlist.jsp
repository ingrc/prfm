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
						<h3>Menu Placement Page</h3>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="col-xs-12">
							<p>
								<code>menu-placement-description</code>
							</p>
							<hr>
							<form>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>Category</th>
											<th>Display Name</th>
											<th>Url</th>
											<th>Left</th>
											<th>Top</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="menu">
											<tr>
												<td>${menu.type}</td>
												<td>${menu.displayname}</td>
												<td>${menu.url}</td>
												<td>
													<div class="checkbox">
														<input type="checkbox" id="left-${menu.id}"
															name="position-left" value="1"
															${menu.left == 1 ? 'checked' : ''}>
													</div>
												</td>
												<td>
													<div class="checkbox">
														<input type="checkbox" id="left-${menu.id}"
															name="position-left" value="1"
															${menu.top == 1 ? 'checked' : ''}>
													</div>
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</form>
							<!-- /.list-group -->

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