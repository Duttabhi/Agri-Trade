<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Contact Us</title>

    <!-- Bootstrap Core CSS -->
    <link href="./../css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./../css/shop-homepage.css" rel="stylesheet">
    <link href="./../css/farmer_market.css" rel="stylesheet">
    
    <style type="text/css">
    body { 
			background-image: url('./../img/v_home.jpg') ;
			background-position: center center;
			background-repeat:  no-repeat;
			background-attachment: fixed;
			background-size:  cover;
			background-color: #999;
  
}
.hide-bullets {
    list-style:none;
    margin-left: -40px;
    margin-top:20px;
}

.thumbnail {
    padding: 0;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
    width: 100%;
}
.well{
background-color:#E4F8D2;
}
    
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="./../index.html">Farmer's Basket</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="about.jsp">About</a>
                    </li>
                    <li>
		               <a href="login.jsp">LOGIN</a>
		            </li>
		            <li>
		               <a >|</a>
		            </li>
		            <li>
		               <a href="register.jsp">REGISTER</a>
		           </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    
<div class="container">

<div class="row">
<div class="col-md-3"></div>
    <div class="col-md-6">
                <div class="panel panel-default" style="text-align:center;">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Store Address :</h4>
                    </div>
                    <div class="panel-body" >
                        <p>111, Store Name<br>
                        Market Road, Area name,<br>
                        Location, Station name,<br>
                        City name, City Code
                        </p>
                        
                    </div>
                </div>
            </div>
<div class="col-md-3"></div>
</div>

<div class="row">
<div class="col-md-3"></div>
    <div class="col-md-6">
                <div class="panel panel-default" style="text-align:center;"	>
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i>Contact Details:</h4>
                    </div>
                    <div class="panel-body">
                        <p>
                        Email Us at "farmers[dot]market[@]gmail.com"<br>
                        Phone Number : 022-1234567
                        </p>
                        
                    </div>
                </div>
            </div>
<div class="col-md-3"></div>
</div>

</div>
    <!-- jQuery -->
    <script src="./../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./../js/bootstrap.min.js"></script>
</body>

</html>
