<%@ include file="/includes/taglibs.jsp" %>    

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="BootstrapStyler">

        <title>Error - Page Not Found - Intersect</title>

        <!-- Fonts -->
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,400,300,700">
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic">
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic">
        
        <!-- Bootstrap core CSS -->
        <link href='<c:url value="/bootstrap/css/bootstrap.min.css?v=3.1.0"></c:url>' rel="stylesheet">

        <!-- Font Awesome CSS -->
        <link href='<c:url value="/fonts/font-awesome/css/font-awesome.min.css?v=4.0.3"></c:url>' rel="stylesheet">

        <!-- IcoMoon CSS -->
        <link href='<c:url value="/fonts/icomoon/style.css?v=1.0"></c:url>' rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href='<c:url value="/css/styler/style.css"></c:url>' rel="stylesheet" type="text/css">
        <link href='<c:url value="/css/styler/error.css"></c:url>' rel="stylesheet" type="text/css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-push-3">
                    <div class="error-page">
                        <div class="code"><%=request.getAttribute("javax.servlet.error.status_code") %></div>
                        <p class="sub">
                        <spring:message code="error.page.404"></spring:message>
                        </p>
                        
                        <p class="align-center">
                            <a href='<c:url value="/home.html"></c:url>' class="back">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-chevron-left fa-stack-1x fa-inverse"></i>
                                </span>
                                Back to Dashboard
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        

        <!-- jQuery -->
        <script src='<c:url value="/js/libs/jquery-1.11.0.min.js"></c:url>'></script>

        <!-- Bootstrap core JavaScript -->
        <script src='<c:url value="/bootstrap/js/bootstrap.min.js?v=3.1.0"></c:url>'></script>
        
    </body>
</html>