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
							User Admin Form
						</h3>
						<div class="panel-toolbar">
							<a href="<c:url value="/admin-user/list.html" />"
								class="btn btn-success"><i class="fa fa-chevron-left"></i> <spring:message
									code="form.back" /></a>
						</div>
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="col-xs-12">
							<c:url value="/admin-user/form.html" var="formActionUrl" />
							<form:form commandName="formModel" action="${formActionUrl}"
								cssClass="form-horizontal" method="POST">
								<input type="hidden" name="formStat" id="formStat"
									value="${formStat}">
								<br />


								<div class="panel panel-default">
									<div class="panel-body">
										
										<div class="form-group">
											<label class="col-sm-3 control-label" for="uname">Username</label>
											<div class="col-sm-9">
											<c:if test="${formStat == 'update' }">
													<form:input path="webUsername" cssClass="form-control" disabled="true" />
													<form:hidden path="webUsername"/>
											</c:if>
											<c:if test="${formStat == 'addnew' }">
													<form:input path="webUsername" cssClass="form-control" />
											</c:if>
											
												<form:errors path="webUsername" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="passwd">Password</label>
											<div class="col-sm-9">
												<form:password path="webPassword" id="webPassword" /><form:errors path="webPassword" /><br/>
												<input type="password" name="rewebPassword" id="rewebPassword" 
													onkeyup="checkPass(); return false;">
									            <span id="confirmMessage" class="confirmMessage"></span>
									        </div>
										</div>
										<div style="clear:both"></div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="uname">Display Name</label>
											<div class="col-sm-9">
												<form:input path="displayname" cssClass="form-control" />
												<form:errors path="displayname" cssClass="help-block" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="role">Role</label>
											<div class="col-sm-9">
												<c:if test="${formModel.role == null }">
													<p class="form-control-static">USER</p>
													<input type="hidden" name="role" id="role" value="USER"/>
												</c:if>
												<c:if test="${formModel.role != null }">
													<p class="form-control-static">${formModel.role}</p>
													<form:hidden path="role"/>
												</c:if>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label" for="enabled">Status</label>
											<div class="col-sm-9">
												<form:checkbox path="enabled" />
												<form:errors path="enabled" cssClass="help-block" />
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
									<!-- /.panel-body -->
								</div>

							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>


		<script type="text/javascript">
		function checkPass()
		{
		    //Store the password field objects into variables ...
		    var pass1 = document.getElementById('webPassword');
		    var pass2 = document.getElementById('rewebPassword');
		    //Store the Confimation Message Object ...
		    var message = document.getElementById('confirmMessage');
		    //Set the colors we will be using ...
		    var goodColor = "#66cc66";
		    var badColor = "#ff6666";
		    //Compare the values in the password field 
		    //and the confirmation field
		    if(pass1.value == pass2.value){
		        //The passwords match. 
		        //Set the color to the good color and inform
		        //the user that they have entered the correct password 
		        pass2.style.backgroundColor = goodColor;
		        message.style.color = goodColor;
		        message.innerHTML = "Passwords Match!"
		    }else{
		        //The passwords do not match.
		        //Set the color to the bad color and
		        //notify the user.
		        pass2.style.backgroundColor = badColor;
		        message.style.color = badColor;
		        message.innerHTML = "Passwords Do Not Match!"
		    }
		}  
		</script>
</body>
</html>