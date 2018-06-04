<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Cart</title>
<!-- Bootstrap Core CSS -->
    <link href="./../css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./../css/cart.css" rel="stylesheet">
    
</head>
<% 
String cst=(String)session.getAttribute("custid");
int custid = Integer.parseInt(cst);
JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
Statement st1,st2 = null;
ResultSet rs1,rs2 = null;
String query1, query2=null;
Double total= 0.00;
%>
<body>
<%@ include file= "customer_menu.jsp" %>
<div class="container">
	<div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
					<%
					con = dbcon.createConnection();
					query1 = "select * from Cart where cid = "+custid;
					st1 = con.createStatement();
					rs1=st1.executeQuery(query1);
					Double subt = 0.00;
					if (rs1.next()){
					%>
				<table class="table table-hover" style="background-color:#d6f4bd;">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
					<%
					rs1=st1.executeQuery(query1);
						while (rs1.next()) {
							int cartid = rs1.getInt("cart_id");
							int qty = rs1.getInt("p_qty");
							String pid = rs1.getString("pid");
							query2 = "select * from Product where Product_ID = '"+pid +"'";
							st2 = con.createStatement();
							rs2=st2.executeQuery(query2);
							while (rs2.next()) {
								String pname=rs2.getString("Product_Name");
								String pdesc=rs2.getString("Product_Desc");
								int avail_stock = rs2.getInt("Total_Stock");
								Double un_price=rs2.getDouble("Unit_Price");
								String unit=rs2.getString("Unit");
								total = un_price * qty;
								String img = rs2.getString("Product_Image");
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
							<tr >
	                        <td class="col-sm-8 col-md-6">
		                        <div class="media">
		                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src= <%=imgurl %> style="width: 72px; height: 72px;"> </a>
		                            <div class="media-body">
		                                <h4 class="media-heading"><a href="#"><%=pname %></a></h4>
		                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
		                            </div>
		                        </div>
	                        </td>
	                        
	                        <td class="col-sm-1 col-md-1" style="text-align: center">
		                        <input type="email" class="form-control" id = "<%=cartid %>" value=<%=qty%> onchange="updateqty('<%=cartid %>','<%=pid%>')">
		                        <div id="stock_alert">
		                        	
		                        </div>
	                        </td>
	                        
	                        <td class="col-sm-1 col-md-1 text-center"><strong><%=un_price %> <%=unit %></strong></td>
	                        
	                        <td class="col-sm-1 col-md-1 text-center"><strong><%=total %></strong></td>
	                        
	                        <td class="col-sm-1 col-md-1">
		                        <button type="button" class="btn btn-danger" onclick="removecart('<%=cartid %>');">
		                            <span class="fa fa-trash-o"></span> Remove
		                        </button>
	                        </td>
	                    </tr>
						</tbody>
						<% }
							subt+=total;
						} 
						//cart query ends here%>
						<tfoot>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Subtotal</h3></td>
                        <td class="text-right"><h3><strong><%=subt %></strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="home.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
                        <td>
                        <a class="btn btn-success" href="confirm_address.jsp">Checkout</a>
                        </td>
                    </tr>
                </tfoot>
            </table>
					<%}//if ends here
					else {
					%>
					<h3>NO ITEM ADDED IN CART !</h3>
					<a href="home.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a>
					<%
					}
					%>
					
					
        </div>
    </div>
</div>

<script type="text/javascript">
function removecart(cartid){
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
				alert("success" +msg);
				location.reload(); 
			}
		};	
		xmlhttp.open("GET", "removecart.jsp?cartid="+cartid, true);
		xmlhttp.send();
}

function updateqty(cartid,pid){
	var qty = document.getElementById(cartid).value;
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
					var response = xmlhttp.responseText;
					window.location = "cart.jsp";
					document.getElementById("stock_alert").innerHTML = response;
					
				}
			};	
			xmlhttp.open("GET", "updateqty.jsp?cartid="+cartid+"&qty="+qty+"&pid="+pid, true);
			xmlhttp.send();
	
	
}

function confirmorder() {
    var txt;
    var r = confirm("Products will be deliverd to registerd address.Proceed with checkout ?");
    if (r == true) {
        txt = "You pressed OK!";
        //create arraylist of products
        window.location = "order.jsp";
    } else {
    	location.reload();
    }
}

</script>

</body>
</html>