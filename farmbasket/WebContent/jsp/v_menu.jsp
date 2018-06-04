<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<head>
    <!-- Bootstrap Core CSS -->
    <link href="./../css/bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./../css/shop-homepage.css" rel="stylesheet">
    <link href="./../css/farmer_market.css" rel="stylesheet">
    <link href="./../css/shop-item.css" rel="stylesheet">
    
    <style type="text/css">
    .navbar-inverse {
	  background-color: #74AFAD;
	  border-color: #556B2F;
	  height:10%;
	}
	
    </style>
</head>
<% 
String cust_id=(String)session.getAttribute("custid");
String customer_first_name=(String)session.getAttribute("custname");
%>
<body>
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
                <a class="navbar-brand" href="v_home.jsp">Farmer's Basket
                <br><p class ="fm_user_name" >Hi, <%=customer_first_name%></p>
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style=" float: right;">
                <ul class="nav navbar-nav">
		            <li><a href="logout.jsp">Logout</a></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
</body>
</html>