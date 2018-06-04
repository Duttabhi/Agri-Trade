<html>
<head>
	<!--  App Title  -->
	<title>Login</title>
	<!--  App Description  -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="./../css/bootstrap.css"/>
	<link rel="stylesheet" type="text/css" href="./../css/main.css"/>

	
	<script type="text/javascript" src="./../js/jquery-1.9.1.js"></script>
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
<body>
<%
String user=(String)session.getAttribute("user_type");
%>
<input type="hidden" value="<%=user%>" id="user"/>
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

<form class="form-4" method="post" action="../login" >
<!--  Hero Section  -->
	<section style="margin-top:5%;">
		<div class="container">
			<div class="caption">
				<div class="modal-dialog">
				<!-- Modal content-->
				  <div class="modal-content">
					<div class="modal-header">
					 <h4 class="modal-title">LOGIN  |  <a href="register.jsp">REGISTER</a></h4>
					</div>
					<div class="modal-body">
					  <table border="1" style="margin-left:90px; width:400px; text-align:center; height:190px;">
						<tr>
							<td>EMAIL ID</td>
							<td><input type="text" id="id_username" name="id_username" placeholder="Enter your email id"/></td>
						</tr>
						<tr>
							<td>PASSWORD</td>
							<td><input type="password" id="id_password" name="id_password" placeholder="Enter your password"/></td>
						</tr>
<tr>
							<td colspan="2"><button class="btn btn-info btn-lg" type="submit" >Submit</button></td>
							
						</tr>						
					  </table>
					</div>
				  </div>
				</div>
				
			</div>			
		</div>
	</section>
	<!--  End Hero Section  -->
	</form>
</body>
</html>