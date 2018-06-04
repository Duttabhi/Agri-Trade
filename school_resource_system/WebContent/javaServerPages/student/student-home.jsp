<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
 
  <head>
  
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script>
      function validate(){
      var v1 =$('#gval').find('select[name="grade"]').val();
      var v2 =$('#subject').find('select[name="subject"]').val();
      var v3 =$('#topic').find('select[name="topic"]').val();
      var v4 =$('#resource').find('select[name="resource"]').val();
      if(v1=='-1' || v2=='-1' || v3=='-1' || v4=='-1'){
   	  alert("Watch out");
      }
      else {
    	  window.location="student_redirect_to_content.jsp?val="+ v4 +"";
      }	  
      
      
      }
      </script> 
      
      
 <script language="javascript" type="text/javascript">  
      var xmlHttp  
      var xmlHttp
      function showSubject(str){
      if (typeof XMLHttpRequest != "undefined"){
      xmlHttp= new XMLHttpRequest();
      }
      else if (window.ActiveXObject){
      xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="subject.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = subjectChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }

      function subjectChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById('subject').innerHTML=xmlHttp.responseText   
      }   
      }

      function showTopic(str){
      if (typeof XMLHttpRequest != "undefined"){
        xmlHttp= new XMLHttpRequest();
        }
      else if (window.ActiveXObject){
        xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
        }
      if (xmlHttp==null){
      alert("Browser does not support XMLHTTP Request")
      return;
      } 
      var url="topic.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = topicChange;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }
      function topicChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById('topic').innerHTML=xmlHttp.responseText   
      }   
      }
      
      
      function showResource(str){
          if (typeof XMLHttpRequest != "undefined"){
            xmlHttp= new XMLHttpRequest();
            }
          else if (window.ActiveXObject){
            xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
          if (xmlHttp==null){
          alert("Browser does not support XMLHTTP Request")
          return;
          } 
          var url="resource.jsp";
          url +="?count=" +str;
          xmlHttp.onreadystatechange = resourceChange;
          xmlHttp.open("GET", url, true);
          xmlHttp.send(null);
          }
          function resourceChange(){   
          if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
          document.getElementById('resource').innerHTML=xmlHttp.responseText   
          }   
          }
          

      	
</script> 

 






<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
</script>
<title>Student Welcome page</title>
<style>


/* HEADER*/
 
.header-text {
  background-color:#4CAF50;
  padding:20px;
  
  width:100%; /* The width is 20%, by default */
  color:#ffffff; 	
  text-shadow: 2px 2px 2px rgba(0,0,0,1.0);
  box-shadow: inset 0px -40px 60px 0px #145a32 ;
  border-bottom: solid 2px #145a32;
  box-sizing:border-box;
}
/*end of header*/

/*footer*/
.footer {
    position: fixed;
    left: 0px;
    bottom: 0;
    width: 100%;
    background-color:#123554;
    color: white;
    text-align: center;
    padding: 14px 16px;
    z-index:4;
}
/*end of footer*/


/*Menu bar*/

.topnav {
  overflow: hidden;
  background-color: #123554;
}

.topnav a {
  float: right;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}


.sticky {
  position: fixed;
  top: 0;
  width: 100%;
}

.sticky + .content {
  padding-top: 102px;
}
/* End of menu bar*/



/* Use a media query to add a break point at 800px: */
@media screen and (max-width:500px) {
  .header-box{
    width:100%;
    padding:0; /* The width is 100%, when the viewport is 800px or smaller */
  }
  .carousel-box{
  	width:100%;
  	top:1500px;
  }
}
@media screen and (max-width:200px) {
	.topnav a{
    width:100%;
    }
}

@media screen and (min-width:900px) {

/*PAGE STYLE*/
#outer {
	z-index: 3;
	width: 1180px;
	margin: -10 60px 10 60px;
	background: #ffffff;
	box-shadow: 0px 0px 60px 0px rgba(0,0,0,0.2);
	position:relative;
	top:10px;
	left:57px;
}

#homeouter {

	z-index: 3;
	width: 1180px;
	background: #ffffff;
    box-shadow: 0px 0px 60px 0px rgba(0,0,0,0.2);
    position:relative;
}	
/*END OF PAGE STYLE*/

.topnav{z-index:4;}

/*footer*/
.footer {
    position: fixed;
    left: 57px;
    bottom: 0;
    width: 1180px;
    background-color:#123554;
    color: white;
    text-align: center;
    padding: 14px 16px;
    z-index:4;
}
/*end of footer*/
.sticky{
	width:1180px;}

}
/*END OF MEDIA*/

/*CONTENT*/
.content {
  padding: 16px;
}
/*END OF CONTENT*/




</style>
</head>


<body>
<div id=outer>
<div id=homeouter>
<!-- HEADER -->
<div class="header-box" style="padding:0px">
<div class="header-text" style="width:100%">
  <h1>Student Resource System</h1>
</div>

<%
String nm= session.getAttribute("unm").toString();
Integer id = (Integer) session.getAttribute("uid");
%>
<a><marquee >Hello <%=nm%></marquee></a>
</div>
<!-- END OF HEADER -->

<!-- MENU BAR -->

<div class="topnav" id="myMenuBar">

  <a href="student-reset-password1.jsp">reset</a>
  <a href="student-edit-profile1.jsp?uid=<%=id%>">edit profile</a>	 	
  <a href="logout.jsp">Logout</a>
  
<table style="padding: 14px 16px">
<tr>
 <td>  
 <select name='grade' id="gval" onchange="showSubject(this.value);">  
<option value='-1'>select</option>  
    <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/school_resource_system","root","1234");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from grade");
 while(rs.next()){
     %>
      <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
      <%
 }
     %>
      </select>
    </td>  
    <td>   
      <div id='subject'>  
      <select name='subject' id="sval">  
      <option value='-1'>select</option>  
      </select>  
      </div>  
</td>
<td>
      <div id='topic'>
      <select name='topic' id="tval">  
      <option value='-1'>select</option>  
      </select>  
      </div>
  </td>
  <td>    
      <div id='resource'>  
      <select name='resource' id="rval">  
      <option value='-1' >select</option>  
      </select>  
      </div>
    </td> 
     <td> 
      <button onclick="validate()">go</button>  
   </td>
</tr>
</table>


</div>
<!--END OF MENU BAR-->

<!-- CONTAINER CAROUSEL -->
<div class="carousel-box" style="border: 2px solid black;
    box-sizing: border-box;z-index:-1">	
<div class="container" style="width:100%;padding:0px">

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators" style="z-index:3">
      <li data-target="#myCarousel" data-slide-to="0" class="active" ></li>
      <li data-target="#myCarousel" data-slide-to="1" ></li>
      <li data-target="#myCarousel" data-slide-to="2" ></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" >
      <div class="item active" >
        <img src="images/banner.jpg" alt="1/3" style="width:100%;height:256px">
      </div>

      <div class="item"> 
        <img src="images/car.jpg" alt="2/3" style="width:100%;height:256px">
      </div>
    
      <div class="item">
        <img src="images/table.jpg" alt="3/3" style="width:100%;height:256px">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</div>
<!-- END OF CAROUSEL -->

<!-- CONTENT-->

 

<div class="content">

<a href='./../../home.jsp'>Advance Search</a>
 <h2>Best Practices for Plain-Text Email </h2>
<p>We frequently hassle out about HTML email. Whether it's Scoping beautiful messages to share, or writing about tips and tricks to successfully build and troubleshoot them, we often concentrate on HTML-based email. And, weather not alone the majority of email-related articles out there focus on email with graphics, images, colors, and links all of which require HTML. But, what about the equally-as-important-yet-often-forgotten plain-text email?</p>

<p>Plain-text email are just that plain text. They are the email equivalent to a letter written on a typewriter no images, no pretty fonts, no hyperlinks. While they may not be nearly as attractive as HTML-based emails, they play a significant role in a well-rounded email marketing strategy.</p>

<p>In this post, will give plain-text email the attention they deserve focusing on why they are important, how to properly build them, and well provide plenty of examples along the way.</p>

<p>Even when your sending out an HTML email, a plain text alternative is crucial. Multi-part MIME (Multipurpose Internet Mail Extensions) bundles together a simplified plain-text version of your email along with the HTML version of your email. Unless you are sending out a solely plain-text email, multi-part MIME should be part of every email campaign. Some great reasons why sending in multi-part MIME is a necessity:</p>

<p>  Spam filters like to see a plain-text alternative. HTML-only email are a red flag for spam filters. A lazy spammer would not take time to create a plain-text alternative so make sure you do!</p>

<p>  Some people simply prefer it. Plain and simple some people prefer text email. Since a variety of email clients give their users the option to only receive the plain-text version of an email, it's important to send in multi-part MIME format. Otherwise, if your subscribers have enabled this setting and you only send an HTML version, they may not receive your email at all. Some users may also see HTML emails as a security and privacy risk, and choose not to load any images and have visibility over all links that are included in an email. In addition, the increased bandwidth that image-heavy emails tend to consume is another driver of why users simply prefer plain-text emails.</p>

<h2>OPTIMIZE YOUR PLAIN-TEXT EMAILS</h2>
<p>Most email service providers (ESPs) will send in multi-part MIME automatically, or walk you through setting this up as an option. However, these auto-generated plain-text versions are usually unorganized and difficult to read. For example, the text version of this email is filled with back-to-back links there are no clear calls-to-action (CTAs), and it is overall a poor email experience for any subscriber reading it.</p>


<p>While using these auto-generated versions can save you time, be sure to edit them if need be. There may be added spaces between paragraphs, corrupted characters (ASCII characters such as trademark, copyright, and smart quotes, etc. aren’t supported), and links and text that are unnecessary.

Regardless of whether you’re creating the plain-text version yourself, or using the auto-generated version from your ESP, it’s important to make sure the email is easily scannable and actionable. Without HTML design elements like background colors, larger text for headlines, and imagery, you must use other elements to achieve readability.
EASY SCANABILITY + CONTENT HIERARCHY

Regardless of whether you’re designing for HTML or plain text, providing your subscriber with a positive email experience is key. Part of this is organizing content so it is easily scannable (because, let’s be honest—no one is reading every word of your email). Headlines also serve as a clear indicator of which pieces of content you’d like to be the primary focus, versus secondary, tertiary, and the like. There are numerous tactics to help achieve this.
Clear headers

While you can’t use larger text or different colors to separate headlines from the content, there are a few strategies that do work, like using all caps or symbols to separate sections. For example, the headlines in this example are clear and stand out:</p>
</div>
<!-- END OF CONTETNT-->

</div>

</div>
			
 
<div class="footer">
  <p>Footer</p>
</div> 	




</body>

<script>
window.onscroll = function() {myFunction()};

var header = document.getElementById("myMenuBar");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
}
</script>


</html>
