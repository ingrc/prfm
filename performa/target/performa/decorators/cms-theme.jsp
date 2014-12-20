<%@ include file="/includes/taglibs.jsp" %>    
<%@page session="true"%>
<!DOCTYPE html>
<html>

    <head >
        <meta charset="utf-8"></meta>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
        <meta name="description" content=""></meta>
        <meta name="author" content="BootstrapStyler"></meta>

        <title>Dashboard - Intersect</title>

        <!-- Fonts -->
        <!-- 
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,400,300,700"></link>
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic"></link>
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"></link>
         -->
         
        <!-- Bootstrap core CSS -->
        <link href='<c:url value="/bootstrap/css/bootstrap.min.css"></c:url>' rel="stylesheet"></link>

        <!-- Font Awesome CSS -->
        <link href='<c:url value="/fonts/font-awesome/css/font-awesome.min.css"></c:url>' rel="stylesheet"></link>

        <!-- Bootstrap Switch -->
        <link href='<c:url value="/css/libs/bootstrap-switch.min.css"></c:url>' rel="stylesheet"></link>

        <!-- Bootstrap Select -->
        <link href='<c:url value="/css/libs/bootstrap-select.min.css"></c:url>' rel="stylesheet"></link>

        <!-- IcoMoon CSS -->
        <link href='<c:url value="/fonts/icomoon/style.css"></c:url>' rel="stylesheet"></link>

        <!-- morris.js -->
        <link href='<c:url value="/css/libs/morris.css"></c:url>' rel="stylesheet"></link>

        <!-- Summernote -->
        <link href='<c:url value="/css/libs/summernote.css"></c:url>' rel="stylesheet"></link>
        <link href='<c:url value="/css/libs/summernote-bs3.css"></c:url>' rel="stylesheet"></link>

        <!-- Custom styles for this template -->
        <link href='<c:url value="/css/styler/style.css"></c:url>' rel="stylesheet" type="text/css"></link>

        
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        
        <!-- jQuery -->
        <script src='<c:url value="/js/libs/jquery-1.11.0.min.js"></c:url>'></script>

        <!-- Bootstrap core JavaScript -->
        <script src='<c:url value="/bootstrap/js/bootstrap.min.js"></c:url>'></script>

        <!-- Sparkline -->
        <script src='<c:url value="/js/libs/jquery.sparkline.min.js"></c:url>'></script>

        <!-- Bootstrap Switch -->
        <script src='<c:url value="/js/libs/bootstrap-switch.min.js"></c:url>'></script>

        <!-- Bootstrap Select -->
        <script src='<c:url value="/js/libs/bootstrap-select.min.js"></c:url>'></script>

        <!-- Bootstrap File -->
        <script src='<c:url value="/js/libs/bootstrap-filestyle.js"></c:url>'></script>

        <!-- Raphael JS -->
        <script src='<c:url value="/js/libs/raphael-min.js"></c:url>'></script>

        <!-- morris.js -->
        <script src='<c:url value="/js/libs/morris.min.js"></c:url>'></script>

        <!-- Summernote -->
        <script src='<c:url value="/js/libs/summernote.min.js"></c:url>'></script>

        <script src='<c:url value="/js/styler/script.js"></c:url>'></script>
    </head>

    <body>                        
        <nav class="navbar navbar-fixed-top" role="navigation" id="mainnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#top-nav">
                    <span class="sr-only">Toggle navigation</span>
                    <i class="fa fa-list"></i>
                </button>
                <a class="navbar-brand" href="<c:url value="/home.html" />">
                    <b class="icon-cover"></b>
                    <span><img src='<c:url value="/img/logo-small.png"/>'></img> Intersect</span>
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="top-nav">
            	<div id="menumasterid"></div>
                <ul class="nav navbar-nav navbar-right">
                	<li>
                		<a href='<c:url value="?lang=en"></c:url>' title="" data-placement="bottom" data-toggle="tooltip" data-original-title="English">
                			<img src='<c:url value="/img/en.png"></c:url>' alt="English" />
                		</a>
                	</li>
                	<li>
                		<a href='<c:url value="?lang=id_ID"></c:url>' title="" data-placement="bottom" data-toggle="tooltip" data-original-title="Bahasa Indonesia">
                			<img src='<c:url value="/img/id_ID.png"></c:url>' alt="Bahasa Indonesia" />
                		</a>
                	</li>
                	<li>
                		<c:url value="/logout" var="logoutUrl" />
						<form action="${logoutUrl}" method="post" id="logoutForm">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
						<script>
							function formLogoutSubmit() {
								document.getElementById("logoutForm").submit();
							}
						</script>
                		<a href='javascript:formLogoutSubmit()' title="" data-placement="bottom" data-toggle="tooltip" data-original-title="Sign Out">
                			<img src='<c:url value="/img/logout.png"></c:url>' alt="Sign Out" />
                		</a>
                	</li>
                </ul>

                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        
                    </div>
                </form>
            </div><!-- /.navbar-collapse -->
        </nav>
        <div class="container">
             <div class="row">

                <div class="col-md-10 col-md-push-2 col-sm-9 col-sm-push-3 col-no-left-padding">
                    <section id="middle">
                    
                     
                        <decorator:body></decorator:body>
                     
                        

                    </section>
                </div><!-- /.col-md-10 -->

                <aside class="col-md-2 col-md-pull-10 col-sm-3 col-sm-pull-9">

                    <div id="sidebar">
                        <div class="panel panel-default panel-user panel-no-padding hidden-sm hidden-xs">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <div class="media">
                                        <div class="media-body">
                                            <h4 class="media-heading"><span class="welcome">Hello</span> 
                                           		<%= request.getAttribute("loggedDisplayName") %>
                                           	</h4>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.panel-heading -->

                        </div><!-- /.panel -->

                        <div class="panel-group" id="app-menu">
                        
                            <div class="panel panel-default panel-no-padding">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#app-menu" href="#menu-app">
                                            Application
                                        </a>
                                    </h4>
                                    <div class="panel-toolbar">
                                        <a data-toggle="collapse" data-parent="#app-menu" href="#menu-app">
                                            <i class="fa fa-angle-down pull-right collapse-trigger"></i>
                                        </a>
                                    </div>
                                </div><!-- /.panel-heading -->
                                <div id="menu-app" class="panel-collapse collapse in">
                                    <div class="panel-body" id="menuleftpanelid">
                                        
                                    </div><!-- /.panel-body -->
                                </div><!-- /.panel-collapse -->
                            </div><!-- /.panel -->

                        </div><!-- /.panel-group -->
                    </div><!-- /#sidebar -->  

                </aside>
                
            </div><!-- /.row -->
        </div><!-- /.container -->



                <script>
	$(document).ready( function() {
		
			$.get('<c:url value="/res/menumaster" />', function(data) {
			    $('#top-nav').prepend(data);
			});
			
			<%
				String mntopQstring="";
				if (request.getParameter("mntop") != null){
					mntopQstring = "?mntop=" + request.getParameter("mntop");
				}
			%>
			
			$('#app-menu').hide();
			$.get('<c:url value="/res/menumasterleft" /><%= mntopQstring %>', function(data){
				$('#menuleftpanelid').html(data);
				$('#app-menu').show();
			});
/*
            $('#sparkline-graph1').sparkline('html', {
                type: 'bar',
                height: '80',
                barWidth: 5,
                barColor: '#ff7f00',
                negBarColor: '#bf0000'
            });

            $('#sparkline-graph2').sparkline('html', {
                type: 'bar',
                height: '80',
                barWidth: 5,
                barColor: '#00bfbf',
                negBarColor: '#bf0000'
            });

            $('.wysiwyg').summernote({
                height: 100
            });

            // Morris chart sample 
            Morris.Line({
                element: 'chart-1',
                data: [
                    { y: '2013-10', a: 170, b: 143, c: 140, d: 227, e: 58 },
                    { y: '2013-11', a: 199, b: 87, c: 75, d: 92, e: 169 },
                    { y: '2013-12', a: 165, b: 92, c: 174, d: 100, e: 126 },
                    { y: '2014-01', a: 163, b: 126, c: 246, d: 196, e: 260 },
                    { y: '2014-02', a: 275, b: 148, c: 195, d: 156, e: 175 }
                ],
                xkey: 'y',
                xLabels: 'month',
                hideHover: 'auto',
                smooth: false,
                ykeys: ['a', 'b', 'c', 'd', 'e'],
                lineColors: ['#10a6de','#0ebce8','#fbb05e','#f35958','#84a903'],
                labels: ['Web Design', 'Company Branding', 'Web Application', 'iOS Application', 'Android Application']
            });

        
            // Morris chart sample 
            Morris.Bar({
                element: 'chart-2',
                data: [
                    { y: '2011', a: 229, b: 125, c: 123, d: 162, e: 197 },
                    { y: '2012', a: 226, b: 237, c: 135, d: 163, e: 223 },
                    { y: '2013', a: 146, b: 129, c: 237, d: 151, e: 146 }
                ],
                xkey: 'y',
                xLabels: 'year',
                hideHover: 'auto',
                ykeys: ['a', 'b', 'c', 'd', 'e'],
                barColors: ['#10a6de','#0ebce8','#fbb05e','#f35958','#84a903'],
                labels: ['Web Design', 'Company Branding', 'Web Application', 'iOS Application', 'Android Application']
            });

            $('.inlinebar').sparkline('html', {
                type: 'bar', 
                barColor: '#468847',
                lineWidth: 1,
                height: '20px',
            });
            $('.inlinebar2').sparkline('html', {
                type: 'bar', 
                barColor: '#ea4519',
                lineWidth: 1,
                height: '20px',
            });
            $('.inlineline').sparkline('html', {
                type: 'line', 
                barColor: '#468847',
                lineWidth: 1,
                height: '20px',
                lineColor: '#82b721',
                fillColor: '#fff',
                width:'30px',
            });
            $('.inlineline2').sparkline('html', {
                type: 'line', 
                barColor: '#1386f2',
                lineWidth: 1,
                height: '20px',
                lineColor: '#1386f2',
                fillColor: '#b5d8f8',
                width:'50px',
            });
            */
	});
	</script>
    </body>
</html>