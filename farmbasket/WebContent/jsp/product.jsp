<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<head>
    <title>Product</title>
    <!-- Bootstrap Core CSS -->
    <link href="./../css/bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="./../css/shop-item.css" rel="stylesheet">
    
     <!-- jQuery -->
    <script src="./../js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="./../js/bootstrap.min.js"></script>
    
    <style type="text/css">
    .thumbnail img {
		    width: 100%;
		    height: 70%;
		}
    </style>
    
</head>
<% 
//String custid=(String)session.getAttribute("custid");
String pid = request.getParameter("pid");
JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
Statement st1,st2, st3, st4 = null;
ResultSet rs1, rs2, rs3, rs4 = null;
String query1, query2, query3=null;
%>
<body>
<%@ include file= "customer_menu.jsp" %>


    <!-- Page Content -->
    <div class="container">
        <div class="row">
             <div class="col-md-3">
                <div class="list-group">
                    <a href="fruit.jsp" class="list-group-item">Fruits</a>
                    <a href="veg.jsp" class="list-group-item">Vegetables</a>
                    <a href="dairy.jsp" class="list-group-item">Dairy Products</a>
                </div>
            </div>
			<div class="col-md-9">
				<%
				con = dbcon.createConnection();
				query1 = "select * from Product where Product_ID = '"+pid +"'";
				st1 = con.createStatement();
				rs1=st1.executeQuery(query1);
				while (rs1.next()) {
					String pname=rs1.getString("Product_Name");
					String pdesc=rs1.getString("Product_Desc");
					int avail_stock = rs1.getInt("Total_Stock");
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
				
                <div class="thumbnail">
                    <div>
                    	<img class="img-responsive"  src= <%=imgurl %> >
                    </div>
                    <div class="caption-full">
                        <h4 class="pull-right"><%=un_price %>/<%=unit %></h4>
                        <h4><a href="#"><%=pname %></a>
                        </h4>
                        <p><%=pdesc %></p>
                    </div>
                    <div class="ratings">
                     <%
                     	query2 = "select * from Cart where pid = '"+pid +"'";
	     				st2 = con.createStatement();
	     				rs2=st2.executeQuery(query2);
	     				if (rs2.next()){
	     			 %>
	     			 
	     			<div class="text-right">
                     <button type="button" class="btn btn-warning" >
                         Added in Cart 
                     </button>
                 	</div>
                 	 <%
	     				}
	     				else if(avail_stock == 0){
	     			%>
	     			<div class="text-right">
                     <button type="button" class="btn btn-danger" >
                         Not Available
                     </button>
                 	</div>
	     			<%	
	     				}
	     				else{
                     %>
                     <div class="text-right">
                     <a href="home.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a>
                        <button type="button" class="btn btn-success" id="addcart" onclick="addtocart('<%=pid %>');">
                            Add to Cart 
                        </button>
                    </div>
                    <%} 
                    
                    %>
                    </div>
                </div>

                <div class="well">
                    <div class="text-right">
                        <a class="btn btn-success" onclick="showTextArea();" >Leave a Review</a>
                    </div>
                     
                    <hr>
                    <div class="form-group" id="review_div"  style="display:none;">
						<div >                     
							<textarea class="form-control" id="review" name="review" ></textarea>
						</div>
						<div class="text-right">
                        	<a class="btn btn-success" onclick="addReview('<%=pid %>');">Submit</a>
                    	</div>
					</div>
					<hr>
					<%
					query3 = "select * from Reviews where pid = '"+pid +"'";
    				st3 = con.createStatement();
    				rs3=st3.executeQuery(query3);
					while (rs3.next()) {
						String review=rs3.getString("review");
    					String date = rs3.getString("date");
    					int regid = rs3.getInt("regid");
    					
    					query3 = "select Registration_first_name from Registration where Registration_ID ="+regid;
    					st4 = con.createStatement();
    					rs4=st4.executeQuery(query3);
    					while (rs4.next()) {
    						String cust_name=rs4.getString("Registration_first_name");
    					
					%>
                    <div class="row">
                        <div class="col-md-12">
                            <%=cust_name %>
                            <!--  <a href="">delete</a>-->
                            <br><span class="pull-right"><%=date %></span>
                            <p><%=review %></p>
                        </div>
                    </div>

                    <hr>
					<%}
					}	%>

                </div>

            </div>
           <%
            }
           %> 
        </div>

    </div>
    <!-- /.container -->
	<input type	="hidden" id="pid" name="pid" value="<%=pid%>"/>
   
<script type="text/javascript">
function addtocart(pid){
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5 
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  };
	  xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				var msg = xmlhttp.responseText;
				document.getElementById("addcart").disabled  = true;
				alert("success" +msg);
				
			}
		};	
		xmlhttp.open("GET", "addcart.jsp?pid="+pid, true);
		xmlhttp.send();
}
function showTextArea(){
	$("#review_div").css("display","block");
}

function addReview(pid){
	var xmlhttp;
	var reviewtext = "";
	if (document.getElementById("review").value != ""){
		reviewtext = document.getElementById("review").value;
	}
	
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5 
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  };
	  xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				var msg = xmlhttp.responseText;
				alert(msg);
				location.reload();
			}
		};	
		xmlhttp.open("GET", "addreview.jsp?pid="+pid+"&review="+reviewtext, true);
		xmlhttp.send();
}

</script>
</body>

</html>