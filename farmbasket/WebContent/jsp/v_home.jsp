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

    <title>farmer's Market</title>

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
    
    </style>
</head>
<% 
String custid=(String)session.getAttribute("custid");
JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
Statement st1 = null;
ResultSet rs1 = null;
String query1=null;
%>
<body>
    <!-- Navigation -->
    <%@ include file= "v_menu.jsp" %>

    <!-- Page Content -->
    <div class="container" style="margin-top:2%">
    <h3>Welcome Vendor,</h3><hr>
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> ORDERS</h4>
                    </div>
                    <div class="panel-body">
                        <a href="order_list.jsp" class="btn btn-default">View pending orders</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> PRODUCTS</h4>
                    </div>
                    <div class="panel-body">
                        <a href="product_form.jsp" class="btn btn-default">Add New Products</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> EDIT PRODUCTS</h4>
                    </div>
                    <div class="panel-body">
                        <a href="v_product_list.jsp" class="btn btn-default">Edit Existing Product</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i> ADD FARMER</h4>
                    </div>
                    <div class="panel-body">
                        <a href="v_add_farmer.jsp" class="btn btn-default">Add Farmer</a>
                    </div>
                </div>
            </div>


        </div>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="./../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./../js/bootstrap.min.js"></script>

</body>

</html>
