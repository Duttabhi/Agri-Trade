<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Farmer's Market</title>

    <!-- Bootstrap Core CSS -->
    <link href="./../css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./../css/shop-homepage.css" rel="stylesheet">
    <link href="./../css/farmer_market.css" rel="stylesheet">
    
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
    <%@ include file= "customer_menu.jsp" %>

    <!-- Page Content -->
    <div class="container" style="margin-top:2%">
        <div class="row">

            <div class="col-md-3">
                <div class="list-group">
                    <a href="fruit.jsp" class="list-group-item">Fruits</a>
                    <a href="veg.jsp" class="list-group-item">Vegetables</a>
                    <a href="dairy.jsp" class="list-group-item">Dairy Products</a>
                </div>
            </div>

            <div class="col-md-9">

                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="./../img/12.jpg" alt="" style="height:300px; wdth:400px;" >
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="./../img/13.jpg" alt=""  style="height:300px; wdth:400px;">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="./../img/14.jpg" alt="" style="height:300px; wdth:400px;" >
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="icon-prev"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="icon-next"></span>
                            </a>
                        </div>
                    </div>

                </div>
			<div class="row"><!-- product my list starts here -->
			<%
			con = dbcon.createConnection();
			query1 = "select * from Product";
			st1 = con.createStatement();
			rs1=st1.executeQuery(query1);	
			while (rs1.next()) {
				String pid=rs1.getString("Product_id");
				String pname=rs1.getString("Product_Name");
				String pdesc=rs1.getString("Product_Desc");
				Double un_price=rs1.getDouble("Unit_Price");
				String unit=rs1.getString("Unit");
				String img = rs1.getString("Product_Image");
				String imgurl = null;
				if(img == null)
				{
					imgurl = "http://placehold.it/320x150";
				}
				else
				{
					imgurl = "./../"+img;
				}
			%>
				<div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail" >
                            <div>
                            <img src= <%=imgurl %>  height="200" width="150">
                            </div>
                            <div class="caption">
                                <h4 class="pull-right"><%=un_price %> /<%=unit %></h4>
                                <a href=<%= "\"product.jsp?pid="+pid+"\"" %> ><%=pname%></a>
                                <p><%=pdesc %></p>
                            </div>
                        </div>
                </div>
			
			<%
			}
			%>
			</div><!-- product my list ends here -->
            </div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>


    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="./../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./../js/bootstrap.min.js"></script>

</body>

</html>
