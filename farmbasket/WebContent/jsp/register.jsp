<html>
<head>
	<!--  App Title  -->
	<title>Register</title>
	<!--  App Description  -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="./../css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="./../css/main.css"/>

	<script src="./../js/jquery.js"></script>
	<style type="text/css">
    body { 
			background-image: url('./../img/10.jpg') ;
			background-position: center center;
			background-repeat:  no-repeat;
			background-attachment: fixed;
			background-size:  cover;
			background-color: #999;
  
}
    
    </style>
		
</head>
<%
String er = request.getParameter("error");
String errorvalue = "";
if(er != null){
	errorvalue = er;
	System.out.println(errorvalue);
}
%>
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
                        <a href="contact.jsp">Contact</a>
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

<input type="hidden" value="<%=errorvalue %>" id="errorhidden"/>
		<div class="container" >
				<div class="modal-dialog" style="margin-top:8%;">
				<!-- Modal content-->
				  <div class="modal-content">
					<div class="modal-header">
					 <h4 class="modal-title"><a href="login.jsp">LOGIN</a>  |  REGISTER</h4>
					</div>
					<div class="modal-body">
					<form class="form-horizontal" method="post" action="../register">
						<fieldset>
							<!-- Text input-->
							<div class="form-group " id="error" style="color:red; text-align:center;">
							</div>
						
							<!-- Text input-->
							<div class="form-group">
							  <label class="col-md-4 control-label" for="customer_fname">FIRST NAME *</label>  
							  <div class="col-md-7">
							  <input id="customer_fname" name="customer_fname" placeholder="First Name" class="form-control input-md" required type="text">
							  </div>
							</div>
							
							<!-- Text input-->
							<div class="form-group">
							  <label class="col-md-4 control-label" for="customer_lname">LAST NAME</label>  
							  <div class="col-md-7">
							  <input id="customer_lname" name="customer_lname" placeholder="Last Name" class="form-control input-md"  type="text">
							  </div>
							</div>
							
							<!-- Text input-->
							<div class="form-group">
							  <label class="col-md-4 control-label" for="customer_email">EMAIL ID *</label>  
							  <div class="col-md-7">
							  <input id="customer_email" name="customer_email" placeholder= "Email Id" class="form-control input-md" required type="text">
							  </div>
							</div>
							
							<!-- Text input-->
							<div class="form-group">
							  <label class="col-md-4 control-label" for="customer_phone" >PHONE NUMBER *</label>  
							  <div class="col-md-7" id="staticParent">
							  <input id="customer_phone" name="customer_phone" placeholder="Phone Number" class="form-control input-md"  required type="text"  maxlength="10">
							  <small>Enter 10 digit phone number only</small>
							  </div>
							</div>
							
							<!-- Textarea -->
							<div class="form-group">
							  <label class="col-md-4 control-label" for="customer_address">ADDRESS *</label>
							  <div class="col-md-7">                     
							    <textarea class="form-control" id="customer_address" name="customer_address" required ></textarea>
							  </div>
							</div>
							
							<!-- Text input-->
							<div class="form-group">
							  <label class="col-md-4 control-label" for="password" >PASSWORD *</label>  
							  <div class="col-md-7" >
							  <input id="password" name="password" placeholder="password" class="form-control input-md"  required type="password" >
							  </div>
							</div>
							
							<!-- Text input-->
							<div class="form-group">
							  <label class="col-md-4 control-label" for="retype_password" >CONFIRM PASSWORD *</label>  
							  <div class="col-md-7" >
							  <input id="retype_password" name="retype_password" placeholder="retype password" class="form-control input-md"  required type="password" >
							  </div>
							</div>
							
							<!-- Button -->
							<div class="form-group">
							  <label class="col-md-4 control-label" for="singlebutton"></label>
							  <div class="col-md-7">
							    <button id="singlebutton" name="singlebutton" class="btn btn-warning">REGISTER</button>
							  </div>
							</div>
						</fieldset>
					</form>
					</div>
				  </div>
				</div>
		</div>
		
		
<script type="text/javascript">
$(function() {
	  $('#staticParent').on('keydown', '#customer_phone', function(e){-1!==$.inArray(e.keyCode,[46,8,9,27,13,110,190])||/65|67|86|88/.test(e.keyCode)&&(!0===e.ctrlKey||!0===e.metaKey)||35<=e.keyCode&&40>=e.keyCode||(e.shiftKey||48>e.keyCode||57<e.keyCode)&&(96>e.keyCode||105<e.keyCode)&&e.preventDefault()});
})

$(document).ready(function() { /* code here */
	var er_value = document.getElementById("errorhidden").value;
	if (er_value != "" || er_value != null)
		{
		document.getElementById("error").innerHTML = er_value;
		}

});

$('#customer_email').change(function() {
	   //do stuff
		var email = document.getElementById('customer_email');
	    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

	    if (!filter.test(email.value)) {
	    alert('Please provide a valid email address');
	    email.focus;
	    return false;
	    }
	});

</script>
</body>
</html>