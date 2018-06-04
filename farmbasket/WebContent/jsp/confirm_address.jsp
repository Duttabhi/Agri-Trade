<%@ page import="farm.Customer" %>
<%@page import="databaseconnection.JDBCMySQLConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
   <title>Address</title>
   <script src="./../js/jquery.js"></script>
   <script src="./../js/bootstrap.min.js"></script>
   
    <link href="./../css/bootstrap.css" rel="stylesheet">
    <link href="./../css/cart.css" rel="stylesheet">
    
</head>
<% 
String cst=(String)session.getAttribute("custid");
int custid = Integer.parseInt(cst);

JDBCMySQLConnection dbcon = new JDBCMySQLConnection();
Connection con = null;
PreparedStatement st=null,st1 = null;
ResultSet rs=null,rs1 = null;
String address = null;
try
{
con = dbcon.createConnection();
st1 = con.prepareStatement("Select * from Registration where Registration_ID = ?");
st1.setInt(1,custid);
rs1=st1.executeQuery();
while(rs1.next()){
	address = rs1.getString("address");
}

}
catch (SQLException e) {
	e.printStackTrace();
}
%>
<body>
<%@ include file= "customer_menu.jsp" %>
<div class="container">
	<h3>Registered delivery address is :</h3>
	<hr>
	<div class="row">
	
		<div class="form-group col-md-1"></div>
		
		<!-- Textarea -->
		<div class="form-group col-md-6">
		    <textarea class="form-control" id="address" name="address" disabled><%=address %></textarea>
		</div>
		<div class="form-group col-md-1" style="display:none;" id="update">
		<button type="button" class="btn btn-primary" onclick="update_addr()">
	       Update 
	    </button>
	    </div>
		
	</div>	
	<div class="row">	
		<div class="form-group col-md-1"></div>
		<div class="form-group col-md-4" >
		<button type="button" id="check" class="btn btn-success" onclick= "confirmorder();">
	       Deliver to this Address 
	    </button>
	    </div>
	    
	    
	    
	    <div class="form-group">
		<button type="button" id="change" class="btn btn-warning" onclick= "showTextArea();" data-toggle="tooltip" data-placement="bottom" title="Edit current address.">
	       Change Delivery Address
	    </button>
	    </div>
	</div>
</div>




<script type="text/javascript">
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

function showTextArea(){
	document.getElementById("address").disabled = false;
	document.getElementById("address").focus();
	
	document.getElementById("update").style.display = "block";
	document.getElementById("check").disabled = true;
	document.getElementById("change").disabled = true;
	
}

function update_addr(){
	var addr = document.getElementById("address").value;
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
				location.reload(); 
				document.getElementById("address").disabled = true;
				document.getElementById("check").disabled = false;
				document.getElementById("change").disabled = false;
			}
		};	
		xmlhttp.open("POST", "update_address.jsp?addr="+addr, true);
		xmlhttp.send();
}

</script>

</body>
</html>