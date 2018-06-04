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

    <title>About Us</title>

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

    <!-- Page Content -->
    
<div class="container">
    <div id="main_area">
    
      <!-- Call to Action Section -->
        <div class="well" style="text-align:center;">
            <div class="row">
                <div class="col-md-12">
                <h4><i>If an industrialist can sell his products anywhere in India and the world, why should a farmer not be allowed to do so?</i></h4>
                </div>
            </div>
        </div>
        
        <!-- Call to Action Section -->
        <div class="well" style="">
            <div class="row">
                <div class="col-md-12">
                <p>
                Online Farmer's Basket is a computerized management system. This is developed to automate the buying and selling process. The proposed system will maintain the information about the farmers, their products and techniques used for farming. It will give an online interface for vendor to add products to sale and an interface for customers to register with the vendor to order online.
                
                </p>
                </div>
            </div>
        </div>
    
        <!-- Slider -->
        <div class="row">
            <div class="col-sm-6" id="slider-thumbs">
                <!-- Bottom switcher of slider -->
                <ul class="hide-bullets">
                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-0">
                            <img src="./../img/farmer_image/f1.jpg" style="height:120px; wdth:150px;">
                        </a>
                    </li>

                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-1"><img src="./../img/farmer_image/f2.jpg" style="height:120px; wdth:150px;"></a>
                    </li>

                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-2"><img src="./../img/farmer_image/f3.jpg" style="height:120px; wdth:150px;"></a>
                    </li>

                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-3"><img src="./../img/farmer_image/f4.jpg" style="height:120px; wdth:150px;"></a>
                    </li>

                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-4"><img src="./../img/farmer_image/f5.jpg" style="height:120px; wdth:150px;"></a>
                    </li>

                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-5"><img src="./../img/farmer_image/f6.jpg" style="height:120px; wdth:150px;"></a>
                    </li>
                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-6"><img src="./../img/farmer_image/f7.jpg" style="height:120px; wdth:150px;"></a>
                    </li>

                    <li class="col-sm-3">
                        <a class="thumbnail" id="carousel-selector-7"><img src="./../img/farmer_image/f8.jpg" style="height:120px; wdth:150px;"></a>
                    </li>

                </ul>
            </div>
            <div class="col-sm-6">
                <div class="col-xs-12" id="slider">
                    <!-- Top part of the slider -->
                    <div class="row">
                        <div class="col-sm-12" id="carousel-bounding-box">
                            <div class="carousel slide" id="myCarousel">
                                <!-- Carousel items -->
                                <div class="carousel-inner">
                                    <div class="active item" data-slide-number="0">
                                        <img src="./../img/farmer_image/f1.jpg" style="height:300px; wdth:400px;"></div>

                                    <div class="item" data-slide-number="1">
                                        <img src="./../img/farmer_image/f2.jpg" style="height:300px; wdth:400px;"></div>

                                    <div class="item" data-slide-number="2">
                                        <img src="./../img/farmer_image/f3.jpg" style="height:300px; wdth:400px;"></div>

                                    <div class="item" data-slide-number="3">
                                        <img src="./../img/farmer_image/f4.jpg" style="height:300px; wdth:400px;"></div>

                                    <div class="item" data-slide-number="4">
                                        <img src="./../img/farmer_image/f5.jpg" style="height:300px; wdth:400px;"></div>

                                    <div class="item" data-slide-number="5">
                                        <img src="./../img/farmer_image/f6.jpg" style="height:300px; wdth:400px;"></div>
                                    
                                    <div class="item" data-slide-number="6">
                                        <img src="./../img/farmer_image/f7.jpg" style="height:300px; wdth:400px;"></div>
                                    
                                    <div class="item" data-slide-number="7">
                                        <img src="./../img/farmer_image/f8.jpg" style="height:300px; wdth:400px;"></div>
                                    
                                </div>
                                <!-- Carousel nav -->
                                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                    <span class="icon-prev"></span>
                                </a>
                                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                    <span class="icon-next"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/Slider-->
        </div><!-- row end -->
        
       <div class="row"><hr></div>
       
       <div class="row">
       <div>
       <h3>FAQs</h3>
       <ul class="list-group">
		  
		  <li class="list-group-item">
		  <font color="#ff0066">When does Farmer's Basket deliver?</font><hr>
		  Your products will be delivered from 3 hours upto 24 hours from the time of placing the order. 
		  </li>
		  
		  <li class="list-group-item">
		  <font color="#ff0066">Is there a minimum order value for delivery?</font><hr>
		  There is no minimum order value for delivery. However we charge Rs. 30/- for order value below Rs. 1000/-. Delivery changes are nil (zero) for order value above Rs. 1000/-.
		  </li>
		  
		  <li class="list-group-item">
		  <font color="#ff0066">What if I'm not home to receive my order?</font><hr>
		  Once the order is dispatched from the store, a notification will be sent on your registered email address and mobile number. In case of non-availability at your residence, our Delivery Expert will try reaching you on the registered mobile number. The order will accordingly be rescheduled only after getting a confirmation from your end. 
		  </li>
		  
		  <li class="list-group-item">
		  <font color="#ff0066">How can I pay for my Farmer's Basket orders?</font><hr>
		  We accept only Cash on Delivery as of now but we are working on adding wide range of payment options in future.
		  </li>
		  
		  <li class="list-group-item">
		  <font color="#ff0066">Are there any hidden charges I should know about?</font><hr>
		  No, the price listed on the product page is all you pay. No Octroi, no additional sales tax, and no other hidden charges. Our philosophy is simple - What you see is what you pay! 
		  </li>
		
		  <li class="list-group-item">
		  <font color="#ff0066">Do I get an invoice for my order?</font><hr>
		  You will receive an Invoice on delivery of the products. You can also login to Your Account and view the invoice on your order in the My Orders section. 
		  </li>
		  
		  <li class="list-group-item">
		  <font color="#ff0066">How does COD (Cash-On-Delivery) work?</font><hr>
		  We offer COD to make your life easy. Simply place your order with us and pay for it when you receive your goods at your doorstep! 
		  </li>
		  
		  		
		</ul>
       </div>
       </div>
        

    </div>
</div>
    <!-- jQuery -->
    <script src="./../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./../js/bootstrap.min.js"></script>
	<script type="text/javascript">
	  jQuery(document).ready(function($) {
		  
	        $('#myCarousel').carousel({
	                interval: 5000
	        });
	 
	        //Handles the carousel thumbnails
	        $('[id^=carousel-selector-]').click(function () {
	        var id_selector = $(this).attr("id");
	        try {
	            var id = /-(\d+)$/.exec(id_selector)[1];
	            console.log(id_selector, id);
	            jQuery('#myCarousel').carousel(parseInt(id));
	        } catch (e) {
	            console.log('Regex failed!', e);
	        }
	    });
	        // When the carousel slides, auto update the text
	        $('#myCarousel').on('slid.bs.carousel', function (e) {
	                 var id = $('.item.active').data('slide-number');
	                $('#carousel-text').html($('#slide-content-'+id).html());
	        });
	});
	</script>
</body>

</html>
