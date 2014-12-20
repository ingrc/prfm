<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ include file="/includes/taglibs.jsp" %>    

<html>
<head>
	<c:url value="/home.html" var="homeUrl"/>
	<script type="text/javascript">
		
	window.location.replace("${homeUrl}");
	</script>
</head>
<body>
<h2><%= StringUtils.reverse("Hello World!") %></h2>
</body>
</html>
