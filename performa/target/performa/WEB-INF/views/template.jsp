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
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,400,300,700"></link>
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic"></link>
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"></link>
        
        <!-- Bootstrap core CSS -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"></link>

        <!-- Font Awesome CSS -->
        <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet"></link>

        <!-- Bootstrap Switch -->
        <link href="css/libs/bootstrap-switch.min.css" rel="stylesheet"></link>

        <!-- Bootstrap Select -->
        <link href="css/libs/bootstrap-select.min.css" rel="stylesheet"></link>

        <!-- IcoMoon CSS -->
        <link href="fonts/icomoon/style.css" rel="stylesheet"></link>

        <!-- morris.js -->
        <link href="css/libs/morris.css" rel="stylesheet"></link>

        <!-- Summernote -->
        <link href="css/libs/summernote.css" rel="stylesheet"></link>
        <link href="css/libs/summernote-bs3.css" rel="stylesheet"></link>

        <!-- Custom styles for this template -->
        <link href="css/styler/style.css" rel="stylesheet" type="text/css"></link>

        
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>                        
        <nav class="navbar navbar-fixed-top" role="navigation" id="mainnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#top-nav">
                    <span class="sr-only">Toggle navigation</span>
                    <i class="fa fa-list"></i>
                </button>
                <a class="navbar-brand" href="index.html">
                    <b class="icon-cover"></b>
                    <span><img src="img/logo-small.png"></img> Intersect</span>
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="top-nav">

                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="index.html"><i class="imoon imoon-dashboard fa-fw"></i><span class="text">Dashboard</span></a></li>
                    <li class=""><a href="projects.html"><i class="imoon imoon-folder fa-fw"></i><span class="text">Projects</span></a></li>
                    <li class=""><a href="clients.html"><i class="imoon imoon-users fa-fw"></i><span class="text">Clients</span></a></li>
                    <li class=""><a href="invoices.html"><i class="imoon imoon-drawer3 fa-fw"></i><span class="text">Invoices</span></a></li>
                    <li class=""><a href="tasks.html"><i class="imoon imoon-list fa-fw"></i><span class="text">Task Lists</span><span class="pull-right badge badge-danger">12</span></a></li>
                    <li class="dropdown ">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="imoon imoon-envelope fa-fw"></i><span class="text">Messages</span><span class="pull-right badge badge-warning">4</span> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="messages.html">All Messages</a></li>
                            <li><a href="compose.html">New Message</a></li>
                        </ul>
                    </li>
                    <li class=" visible-xs"><a href="signout.html"><i class="imoon imoon-key fa-fw"></i> <span class="text">Sign Out</span></a></li>
                </ul>

                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search ...">
                    </div>
                </form>
            </div><!-- /.navbar-collapse -->
        </nav>
        <div class="container">
            <div class="row">

                <div class="col-md-10 col-md-push-2 col-sm-9 col-sm-push-3 col-no-left-padding">
                    <section id="middle">
                    
                        <div class="page-header">
                            <h1>Dashboard</h1>
                        </div><!-- /.page-header -->
                        
                        <div id="content">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div class="stat-block stat-primary">
                                        <div class="icon">
                                            <b class="icon-cover"></b>
                                            <i class="imoon imoon-list"></i>
                                        </div>
                                        <div class="details">
                                            <a href="tasks.html">
                                                <div class="number">1349</div>
                                                <div class="description">Tasks</div>
                                            </a>
                                        </div>               
                                    </div>
                                </div><!-- /.col-xs-12 -->
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div class="stat-block stat-info">
                                        <div class="icon">
                                            <b class="icon-cover"></b>
                                            <i class="imoon imoon-folder-open"></i>
                                        </div>
                                        <div class="details">
                                            <a href="projects.html">
                                                <div class="number">12</div>
                                                <div class="description">Projects</div>
                                            </a>
                                        </div>               
                                    </div>
                                </div><!-- /.col-xs-12 -->
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div class="stat-block stat-danger">
                                        <div class="icon">
                                            <b class="icon-cover"></b>
                                            <i class="fa fa-bell"></i>
                                        </div>
                                        <div class="details">
                                            <div class="number">$213K</div>
                                            <div class="description">Monthly</div>
                                        </div>               
                                    </div>
                                </div><!-- /.col-xs-12 -->
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <div class="stat-block stat-warning">
                                        <div class="icon">
                                            <b class="icon-cover"></b>
                                            <i class="fa fa-bar-chart-o"></i>
                                        </div>
                                        <div class="details">
                                            <div class="number">$2.1M</div>
                                            <div class="description">Total Profit</div>
                                        </div>              
                                    </div>
                                </div><!-- /.col-xs-12 -->
                            </div><!-- /.row -->


                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div id="chart-1"></div>
                                        </div>
                                    </div>
                                </div><!-- /.col-sm-6 -->

                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div id="chart-2"></div>
                                        </div>
                                    </div>
                                </div><!-- /.col-sm-6 -->
                            </div><!-- /.row -->
                            

                            <div class="row">
                                <div class="col-md-2 col-sm-4">
                                    <div class="statistic-list-chart">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Inline Bar Statistics</h3>
                                            </div>
                                            <div class="panel-body">
                                                <ul class="listing list-unstyled">
                                                    <li>
                                                        <span class="inlinebar">12,10,6,13,16,21,15,8,15,8</span>
                                                        <h4>65</h4>
                                                        <p class="sub">Signups</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlinebar">13,14,19,10,7,9,5,7,9,15</span> 
                                                        <h4>34</h4> 
                                                        <p class="sub">Comments</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlinebar">13,20,12,16,10,18,19,12,17,8</span>
                                                        <h4>99</h4>
                                                        <p class="sub">Photos</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlinebar">14,7,14,16,16,7,14,8,11,7</span>
                                                        <h4>60</h4>
                                                        <p class="sub">Videos</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlinebar">11,19,17,8,7,19,12,7,21,17</span>
                                                        <h4>40</h4>
                                                        <p class="sub">Events</p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-2 col-sm-4">
                                    <div class="statistic-list-chart">
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Inline Line Statistics</h3>
                                            </div>
                                            <div class="panel-body">
                                                <ul class="listing list-unstyled">
                                                    <li>
                                                        <span class="inlineline">17,12,15,7,5,20,21,19,10,16</span>
                                                        <p class="sub">Website Design</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlineline">22,20,19,13,13,12,16,5,16,5</span> 
                                                        <p class="sub">iOS App</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlineline">8,5,20,20,9,22,17,16,6,16</span>
                                                        <p class="sub">Android App</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlineline">11,19,5,22,22,6,20,21,21,7</span>
                                                        <p class="sub">Helpdesk System</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlineline">14,21,22,11,12,13,18,6,14,12</span>
                                                        <p class="sub">Hotel Booking</p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-2 col-sm-4">
                                    <div class="statistic-list-chart">
                                        <div class="panel panel-warning">
                                            <div class="panel-heading">
                                                <h3 class="panel-title">Inline Bar Statistics</h3>
                                            </div>
                                            <div class="panel-body">
                                                <ul class="listing list-unstyled">
                                                    <li>
                                                        <span class="inlinebar2">6,17,12,21,15,16,20,10,10,22</span>
                                                        <h4>65</h4>
                                                        <p class="sub">Signups</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlinebar2">21,17,19,22,16,18,5,14,17,22</span> 
                                                        <h4>34</h4> 
                                                        <p class="sub">Comments</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlinebar2">16,8,20,16,15,9,7,11,10,17</span>
                                                        <h4>99</h4>
                                                        <p class="sub">Photos</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlinebar2">18,12,11,8,10,22,20,8,9,7</span>
                                                        <h4>60</h4>
                                                        <p class="sub">Videos</p>
                                                    </li>
                                                    <li>
                                                        <span class="inlinebar2">7,7,20,22,6,14,18,7,5,12</span>
                                                        <h4>40</h4>
                                                        <p class="sub">Events</p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-3 col-sm-6">
                                    <div class="panel panel-success">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Project Progress</h3>
                                        </div><!-- /.panel-heading -->
                                        <div class="panel-body">
                                            <ul class="list-unstyled progress-list">
                                                                                                <li>
                                                                                                        Website Design                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="24" aria-valuemin="0" aria-valuemax="100" style="width: 24%">
                                                            <span>24%</span>
                                                        </div>
                                                    </div>
                                                </li>
                                                                                            <li>
                                                                                                        iOS App                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="76" aria-valuemin="0" aria-valuemax="100" style="width: 76%">
                                                            <span>76%</span>
                                                        </div>
                                                    </div>
                                                </li>
                                                                                            <li>
                                                                                                        Android App                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                            <span>35%</span>
                                                        </div>
                                                    </div>
                                                </li>
                                                                                        </ul>
                                        </div><!-- /.panel-body -->
                                    </div><!-- /.panel -->
                                </div>

                                <div class="col-md-3 col-sm-6">
                                    <div class="panel panel-inverse">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Online Users</h3>
                                        </div><!-- /.panel-heading -->
                                        <div class="panel-body">
                                            <ul class="list-unstyled friend-list">
                                                                                                <li>
                                                                                                        <a href="profile.html">
                                                        <span class="label label-success">online</span>
                                                        <img src="img/samples/avatar-1.jpg"></img>Jimmy White                                                    </a>
                                                </li>
                                                                                            <li>
                                                                                                        <a href="profile.html">
                                                        <span class="label label-success">online</span>
                                                        <img src="img/samples/avatar-8.jpg">Sophie Evans                                                    </a>
                                                </li>
                                                                                            <li>
                                                                                                        <a href="profile.html">
                                                        <span class="label label-success">online</span>
                                                        <img src="img/samples/avatar-7.jpg">Anthony Weber                                                    </a>
                                                </li>
                                                                                            <li>
                                                                                                        <a href="profile.html">
                                                        <span class="label label-success">online</span>
                                                        <img src="img/samples/avatar-10.jpg">Jemery Romero                                                    </a>
                                                </li>
                                                                                            <li>
                                                                                                        <a href="profile.html">
                                                        <span class="label label-success">online</span>
                                                        <img src="img/samples/avatar-4.jpg">Bryan Porter                                                    </a>
                                                </li>
                                                                                        </ul>
                                        </div><!-- /.panel-body -->
                                    </div><!-- /.panel -->
                                </div>
                            </div><!-- /.row -->

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-default panel-no-padding">
                                        <div class="panel-heading">
                                            <h3 class="panel-title"><i class="fa fa-list"></i> Recent Tasks</h3>
                                        </div><!-- /.panel-heading -->
                                        <div class="panel-body">
                                            <div class="task-list" id="tasks">
                                                <ul class="list-group tasks">
                                                                                                                                                                                                                <li class="list-group-item completed">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Vincent Dominic</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Condimentum Malesuada Justo</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item item-danger">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Julie Parker</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Ipsum Cras Mattis</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item item-info">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Sarah Cole</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Condimentum Malesuada Justo</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item completed">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <span class="user pull-right text-muted small">You</span>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Condimentum Malesuada Justo</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item ">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Sarah Cole</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Egestas Justo Ligula</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item item-danger">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <span class="user pull-right text-muted small">You</span>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Justo Purus Mattis</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item item-danger">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Bryan Porter</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Product released</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item completed">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Aaron Lim</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Ipsum Cras Mattis</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item item-danger">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Aaron Lim</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Ipsum Cras Mattis</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item completed">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Julie Parker</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Ipsum Cras Mattis</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item ">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Jemery Romero</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Condimentum Malesuada Justo</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item item-info">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <span class="user pull-right text-muted small">You</span>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Justo Purus Mattis</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item completed">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Anthony Weber</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Justo Purus Mattis</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item item-danger">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Vincent Dominic</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Ipsum Cras Mattis</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item item-info">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <a href="profile.html" class="user pull-right small">Anthony Weber</a>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Sollicitudin Inceptos Vulputate</span>
                                                    </li>
                                                                                                                                                                                                                <li class="list-group-item ">
                                                        <a href="#" class="pull-right" data-dismiss="alert"> <i class="fa fa-times icon-muted"></i></a>
                                                        
                                                        <span class="user pull-right text-muted small">You</span>
                                                                                                                
                                                        <span class="switch"><input type="checkbox" checked></span>
                                                        <span class="title">Product released</span>
                                                    </li>
                                                                                                    </ul><!-- /.list-group -->
                                            </div><!-- /.task-list -->
                                        </div><!-- /.panel-body -->
                                    </div><!-- /.panel -->
                                </div><!-- /.col-sm-6 -->
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title"><i class="fa fa-comments"></i> Recent discussion</h3>
                                        </div><!-- /.panel-heading -->
                                        <div class="panel-body">
                                            <div id="discuss">

                                                <div class="message">

                                                                                                        
                                                    <div class="media message-detail">
                                                        <div class="pull-left">
                                                            <img src="img/samples/avatar-5.jpg" class="media-object">
                                                        </div>
                                                        
                                                        <div class="bubble alt">
                                                            <div class="media-body">
                                                                <div class="media-heading">
                                                                    <h4><a href="profile.html">You</a> <span class="small muted pull-right">1 second ago</span></h4>
                                                                </div><!-- /.media-heading -->

                                                                <p>Fusce dapibus, tellus ac cursus commodo tortor</p>

                                                            </div><!-- /.media-body -->
                                                        </div><!-- /.bubble -->
                                                    </div><!-- /.media -->
                                                                                                        
                                                    <div class="media message-detail">
                                                        <div class="pull-left">
                                                            <img src="img/samples/avatar-7.jpg" class="media-object">
                                                        </div>
                                                        
                                                        <div class="bubble ">
                                                            <div class="media-body">
                                                                <div class="media-heading">
                                                                    <h4><a href="profile.html">Anthony Weber</a> <span class="small muted pull-right">1 minute ago</span></h4>
                                                                </div><!-- /.media-heading -->

                                                                <p>Nullam id dolor id nibh ultricies vehicula ut</p>

                                                            </div><!-- /.media-body -->
                                                        </div><!-- /.bubble -->
                                                    </div><!-- /.media -->
                                                                                                        
                                                    <div class="media message-detail">
                                                        <div class="pull-left">
                                                            <img src="img/samples/avatar-6.jpg" class="media-object">
                                                        </div>
                                                        
                                                        <div class="bubble ">
                                                            <div class="media-body">
                                                                <div class="media-heading">
                                                                    <h4><a href="profile.html">Julie Parker</a> <span class="small muted pull-right">2 minutes ago</span></h4>
                                                                </div><!-- /.media-heading -->

                                                                <p>Fusce dapibus, tellus ac cursus commodo tortor</p>

                                                            </div><!-- /.media-body -->
                                                        </div><!-- /.bubble -->
                                                    </div><!-- /.media -->
                                                    
                                                    <hr>

                                                    <div class="media message-detail">
                                                        <div class="pull-left">
                                                            <img src="img/samples/avatar-5.jpg" class="media-object">
                                                        </div>
                                                        
                                                        <div class="bubble alt">
                                                            <div class="media-body">
                                                                <div class="media-heading">
                                                                    <h4><a href="profile.html">You</a> <span class="small muted pull-right">1 second ago</span></h4>
                                                                </div><!-- /.media-heading -->

                                                                <form role="form">

                                                                <div class="form-group">
                                                                    <textarea class="form-control wysiwyg" placeholder="Your message ..."></textarea>
                                                                </div><!-- /.form-group -->

                                                                <div class="form-group">
                                                                    <button type="submit" class="btn btn-primary">Send Message</button>
                                                                </div>
                                                                
                                                                </form>

                                                            </div><!-- /.media-body -->
                                                        </div><!-- /.bubble -->
                                                    </div><!-- /.media -->

                                                </div><!-- /.message -->
                                                
                                            </div><!-- /.tab-pane -->
                                        </div><!-- /.panel-body -->
                                    </div><!-- /.panel -->
                                </div><!-- /.col-sm-6 -->
                            </div><!-- /.row -->
                            
                        </div><!-- /#content -->

                    </section>
                </div><!-- /.col-md-10 -->

                <aside class="col-md-2 col-md-pull-10 col-sm-3 col-sm-pull-9">

                    <div id="sidebar">
                        <div class="panel panel-default panel-user panel-no-padding hidden-sm hidden-xs">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <div class="media">
                                        <a class="pull-left">
                                            <img src="img/samples/avatar-5.jpg" class="media-object">
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><span class="welcome">Hello</span> <span>Jose Duncan</span></h4>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.panel-heading -->


                            <div class="panel-body align-center">
                                <ul class="list-unstyled list-inline list-user-app">
                                    <li><a title="Task List" data-placement="bottom" data-toggle="tooltip" href="tasks.html"><i class="imoon imoon-list"></i><span class="text">Task List</span><span class="pull-right badge badge-danger">12</span></a></li>
                                    <li><a title="Messages" data-placement="bottom" data-toggle="tooltip" href="messages.html"><i class="imoon imoon-envelope"></i><span class="text">Messages</span><span class="pull-right badge badge-warning">4</span></a></li>
                                    <li><a title="Preferences" data-placement="bottom" data-toggle="tooltip" href="settings.html"><i class="imoon imoon-settings"></i><span class="text">Preferences</span></a></li>
                                    <li><a title="Profile" data-placement="bottom" data-toggle="tooltip" href="profile.html"><i class="imoon imoon-profile"></i><span class="text">Profile</span></a></li>
                                    <li><a title="Sign Out" data-placement="bottom" data-toggle="tooltip" href="signout.html"><i class="imoon imoon-exit"></i><span class="text">Sign Out</span></a></li>
                                </ul>
                            </div><!-- /.panel-body -->

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
                                    <div class="panel-body">
                                        <ul class="nav nav-pills nav-stacked" id="pages-app">
                                            <li class="active"><a href="index.html"><b class="icon-cover"></b><i class="imoon imoon-dashboard fa-fw"></i> Dashboard</a></li>
                                            <li class=""><a href="projects.html"><b class="icon-cover"></b><i class="imoon imoon-folder fa-fw"></i> Projects</a></li>
                                            <li class=""><a href="clients.html"><b class="icon-cover"></b><i class="imoon imoon-users fa-fw"></i> Clients</a></li>
                                            <li class=""><a href="invoices.html"><b class="icon-cover"></b><i class="imoon imoon-drawer3 fa-fw"></i> Invoices</a></li>
                                            <li class=""><a href="tasks.html"><b class="icon-cover"></b><i class="imoon imoon-list fa-fw"></i> Task Lists</a></li>
                                            <li class=""><a href="messages.html"><b class="icon-cover"></b><i class="imoon imoon-envelope fa-fw"></i> Messages</a></li>
                                            <li class="divider"></li>
                                            <li class="">
                                                <a href="#supports" class="collapse" data-toggle="collapse" data-parent="pages-app">
                                                    <b class="icon-cover"></b><i class="imoon imoon-user2 fa-fw"></i> Help &amp; Support
                                                    <i class="fa fa-angle-down pull-right"></i>
                                                </a>
                                                <ul class="panel-collapse collapse  list-unstyled" role="menu" id="supports">
                                                    <li class=""><a href="tickets.html"><span class="badge badge-primary">1</span> Support Tickets</a></li>
                                                    <li class=""><a href="knowledgebase.html"><span class="badge badge-primary">2</span> Knowledgebase</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div><!-- /.panel-body -->
                                </div><!-- /.panel-collapse -->
                            </div><!-- /.panel -->

                            <div class="panel panel-default panel-no-padding">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#app-menu" href="#menu-admin">
                                            Components
                                        </a>
                                    </h4>
                                    <div class="panel-toolbar">
                                        <a data-toggle="collapse" data-parent="#app-menu" href="#menu-admin">
                                            <i class="fa fa-angle-down pull-right collapse-trigger"></i>
                                        </a>
                                    </div>
                                </div><!-- /.panel-heading -->
                                <div id="menu-admin" class="panel-collapse collapse ">
                                    <div class="panel-body">
                                        <ul class="nav nav-pills nav-stacked">
                                            <li class=""><a href="buttons.html"><b class="icon-cover"></b><i class="imoon imoon-play fa-fw"></i> Buttons</a></li>
                                            <li class=""><a href="calendar.html"><b class="icon-cover"></b><i class="imoon imoon-calendar fa-fw"></i> Calendars</a></li>
                                            <li class=""><a href="carousel.html"><b class="icon-cover"></b><i class="imoon imoon-play3 fa-fw"></i> Carousel</a></li>
                                            <li class=""><a href="chart.html"><b class="icon-cover"></b><i class="imoon imoon-bars fa-fw"></i> Charts</a></li>
                                            <li class=""><a href="collapse.html"><b class="icon-cover"></b><i class="imoon imoon-menu2 fa-fw"></i> Collapse</a></li>
                                            <li class=""><a href="form.html"><b class="icon-cover"></b><i class="imoon imoon-signup fa-fw"></i> Forms</a></li>
                                            <li class=""><a href="icons.html"><b class="icon-cover"></b><i class="imoon imoon-image fa-fw"></i> Icons</a></li>
                                            <li class=""><a href="navbar.html"><b class="icon-cover"></b><i class="imoon imoon-list fa-fw"></i> Navbars</a></li>
                                            <li class=""><a href="panels.html"><b class="icon-cover"></b><i class="imoon imoon-checkbox-unchecked fa-fw"></i> Panels</a></li>
                                            <li class=""><a href="tables.html"><b class="icon-cover"></b><i class="imoon imoon-table2 fa-fw"></i> Tables</a></li>
                                            <li class=""><a href="nav.html"><b class="icon-cover"></b><i class="imoon imoon-new-tab fa-fw"></i> Tabs and Pills</a></li>
                                            <li class=""><a href="thumbnails.html"><b class="icon-cover"></b><i class="imoon imoon-images fa-fw"></i> Thumbnails</a></li>
                                            <li class=""><a href="timeline.html"><b class="icon-cover"></b><i class="imoon imoon-stats fa-fw"></i> Timelines</a></li>
                                            <li class=""><a href="typography.html"><b class="icon-cover"></b><i class="imoon imoon-font fa-fw"></i> Typographies</a></li>
                                        </ul>
                                    </div><!-- /.panel-body -->
                                </div><!-- /.panel-collapse -->
                            </div><!-- /.panel -->
                        
                            <div class="panel panel-default panel-no-padding">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#app-menu" href="#menu-samples">
                                            Pages
                                        </a>
                                    </h4>
                                    <div class="panel-toolbar">
                                        <a data-toggle="collapse" data-parent="#app-menu" href="#menu-samples">
                                            <i class="fa fa-angle-down pull-right collapse-trigger"></i>
                                        </a>
                                    </div>
                                </div><!-- /.panel-heading -->
                                <div id="menu-samples" class="panel-collapse collapse ">
                                    <div class="panel-body">
                                        <ul class="nav nav-pills nav-stacked" id="pages-samples">
                                            <li class="">
                                                <a href="#profiles" class="collapse" data-toggle="collapse" data-parent="pages-samples">
                                                    <b class="icon-cover"></b><i class="imoon imoon-user2 fa-fw"></i> Profiles
                                                    <i class="fa fa-angle-down pull-right"></i>
                                                </a>
                                                <ul class="panel-collapse collapse  list-unstyled" role="menu" id="profiles">
                                                    <li class=""><a href="profile-1.html"><span class="badge badge-primary">1</span> Profile 1</a></li>
                                                    <li class=""><a href="profile-2.html"><span class="badge badge-primary">2</span> Profile 2</a></li>
                                                </ul>
                                            </li>
                                            <li class="">
                                                <a href="signin.html">
                                                    <b class="icon-cover"></b><i class="imoon imoon-switch fa-fw"></i> Sign In
                                                </a>
                                            </li>
                                            <li class="">
                                                <a href="#article" class="collapse" data-toggle="collapse" data-parent="pages-samples">
                                                    <b class="icon-cover"></b><i class="imoon imoon-newspaper fa-fw"></i> Articles
                                                    <i class="fa fa-angle-down pull-right"></i>
                                                </a>
                                                <ul class="panel-collapse collapse  list-unstyled" role="menu" id="article">
                                                    <li class=""><a href="article.html"><span class="badge badge-primary">1</span> Article 1</a></li>
                                                    <li class=""><a href="article-2.html"><span class="badge badge-primary">2</span> Article 2</a></li>
                                                </ul>
                                            </li>
                                            <li class="">
                                                <a href="#errors" class="collapse" data-toggle="collapse" data-parent="pages-samples">
                                                    <b class="icon-cover"></b><i class="imoon imoon-user2 fa-fw"></i> Errors
                                                    <i class="fa fa-angle-down pull-right"></i>
                                                </a>
                                                <ul class="panel-collapse collapse list-unstyled" role="menu" id="errors">
                                                    <li class=""><a href="400.html"><span class="badge badge-primary">1</span> Error 400</a></li>
                                                    <li class=""><a href="401.html"><span class="badge badge-primary">2</span> Error 401</a></li>
                                                    <li class=""><a href="403.html"><span class="badge badge-primary">3</span> Error 403</a></li>
                                                    <li class=""><a href="404.html"><span class="badge badge-primary">4</span> Error 404</a></li>
                                                    <li class=""><a href="500.html"><span class="badge badge-primary">5</span> Error 500</a></li>
                                                    <li class=""><a href="503.html"><span class="badge badge-primary">6</span> Error 503</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div><!-- /.panel-body -->
                                </div><!-- /.panel-collapse -->
                            </div><!-- /.panel -->
                        </div><!-- /.panel-group -->


                        <div class="panel panel-outline panel-no-padding hidden-xs">
                            <div class="panel-body">
                                <ul class="list-unstyled progress-list">
                                    <li>
                                        Web space
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100" style="width: 35%">
                                                <span>35%</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        Private message
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width: 65%">
                                                <span>65%</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        Password expiration
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
                                                <span>85%</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="statistic-list-chart">
                                        <hr>
                                        <ul class="list-unstyled listing">
                                           <li>
                                                <span class="task-graph">14,18,9,6,20,14,14,7,13,8</span>
                                                <h4>65</h4>
                                                <p class="sub">Tasks</p>
                                            </li>
                                            <li>
                                                <span class="discuss-graph">7,11,13,16,16,19,14,16,19,20</span> 
                                                <h4>44</h4> 
                                                <p class="sub">Discussions</p>
                                            </li>
                                            <li>
                                                <span class="contrib-graph">9,17,19,11,5,16,15,6,15,19</span> 
                                                <h4>55</h4> 
                                                <p class="sub">Contributions</p>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div><!-- /.panel-body -->
                        </div><!-- /.panel -->
                        
                    </div><!-- /#sidebar -->  

                </aside>
                
            </div><!-- /.row -->
        </div><!-- /.container -->



        <footer id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-xs-6">
                        <ul class="list-inline">
                            <li>&copy; <a href="index.html">Intersect</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-6">
                        <ul class="list-inline social-network">
                            <li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter-square"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin-square"></i></a></li>
                            <li><a href="#"><i class="fa fa-github-square"></i></a></li>
                        </ul>
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container -->
        </footer>

        <!-- jQuery -->
        <script src="js/libs/jquery-1.11.0.min.js"></script>

        <!-- Bootstrap core JavaScript -->
        <script src="bootstrap/js/bootstrap.min.js"></script>

        <!-- Sparkline -->
        <script src="js/libs/jquery.sparkline.min.js"></script>

        <!-- Bootstrap Switch -->
        <script src="js/libs/bootstrap-switch.min.js"></script>

        <!-- Bootstrap Select -->
        <script src="js/libs/bootstrap-select.min.js"></script>

        <!-- Bootstrap File -->
        <script src="js/libs/bootstrap-filestyle.js"></script>

        <!-- Raphael JS -->
        <script src="js/libs/raphael-min.js"></script>

        <!-- morris.js -->
        <script src="js/libs/morris.min.js"></script>

        <!-- Summernote -->
        <script src="js/libs/summernote.min.js"></script>

        <!-- Theme script -->
        <script src="js/styler/script.js"></script>

        <script>
	$(document).ready( function() {

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
	});
	</script>
        
    </body>
</html>