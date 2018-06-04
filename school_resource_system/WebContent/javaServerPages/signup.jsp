<!DOCTYPE html>
<html>
<head>
<%

String s1=request.getParameter("s1");
String s2=request.getParameter("s2");

if(s1==null){
	s1="";
}
if(s2==null){
	s2="";
}

%>
<script>
<!--
function validate()
{
    if(document.forms["rgstr"]["remember"].checked == false){
	alert("Either you can tick it or leave this page!");
	 }
	
	var usr_nm=document.forms["rgstr"]["usr-nm"].value;
    var usr_nm_len=usr_nm.length;
	var eml=document.forms["rgstr"]["email"];
	var usr_nm_flag=0;
if(usr_nm_len<8 || usr_nm_len>16)
	{
		alert("user name length should be between 8 and 16");
		usr_nm_flag=1;
	}
if(usr_nm_flag)
{
		document.forms["rgstr"]["usr-nm"].value="";
        usr_nm_flag=0;
}

var email_flag=0;
if (eml.value.indexOf("@", 0) < 0)
    {
        alert("Please enter a valid e-mail address.");
		email_flag=1;

    }
    if (eml.value.indexOf(".", 0) < 0)
    {
        alert("Please enter a valid e-mail address.");
        email_flag=1;
    }



if(email_flag)
{
		document.forms["rgstr"]["email"].value="";
        email_flag=0;
}

	

}
-->
</script>
</head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

button:hover {
    opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: #474e5d;
    padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}
 
/* The Close Button (x) */
.close {
    position: absolute;
    right: 35px;
    top: 15px;
    font-size: 40px;
    font-weight: bold;
    color: #f1f1f1;
}

.close:hover,
.close:focus {
    color: #f44336;
    cursor: pointer;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
</style>
<body>

<h2>Sign up Form</h2>


<button onclick="document.getElementById('id01').style.display='block'" style="width:auto">Sign Up As student</button>
<div id="id01" class="modal">
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form class="modal-content" method=get name="rgstr" action=./../registration> 
    <div class="container">
      <h1>Sign Up</h1>
      <p>Please fill in this form to create an account.</p>
      <hr>
     
      <label for="first-name"><b>First name</b></label>
      <input type="text" placeholder="Enter first Name" name="frst-nm" required value=<%=s1%> >

      <label for="last-name"><b>Last name</b></label>
      <input type="text" placeholder="Enter last Name" name="lst-nm" required value=<%=s2%> >

      <label for="email"><b>Email</b></label>
      <input type="text"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="Enter Email" name="email" required>
      
      <label for="user-name"><b>User Name</b></label>
      <input type="text" placeholder="Enter User Name" name="usr-nm" required >      
      
      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="psw" required>

      
      <label>
        <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px" required> Remember me
      </label>

      <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

      <div class="clearfix">
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
        <button type="submit" class="signupbtn" onclick=validate()>Sign Up</button>
      </div>
  
    </div>
  </form>  
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</body>
</html>
