<%@page import="java.sql.*"%>
 <html>
      <head> 
      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script>
      function validate(){
      var v1 =$('#country').find('select[name="country"]').val();
      var v2 =$('#state').find('select[name="state"]').val();
      var v3 =$('#city').find('select[name="city"]').val();
      if(v1=='-1' || v2=='-1' || v3=='-1'){
    	  
    	  alert("Watch out");
      }
    	  
      }
      </script> 
      
 			<script language="javascript" type="text/javascript">  
      				var xmlHttp  
      				var xmlHttp
      				function showState(str)
      				{
     						if (typeof XMLHttpRequest != "undefined")
     						{
      									xmlHttp= new XMLHttpRequest();
      						}
      						else if (window.ActiveXObject)
      						{
      									xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
      						}
     					 	if (xmlHttp==null)
     					 	{
      									alert("Browser does not support XMLHTTP Request")
      									return;
      						} 
      						var url="state.jsp";
      						url +="?count=" +str;
      						xmlHttp.onreadystatechange = stateChange;
      						xmlHttp.open("GET", url, true);
      						xmlHttp.send(null);
      				}

      function stateChange(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("state").innerHTML=xmlHttp.responseText   
      }   
      }

      function showCity(str){
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
      var url="city.jsp";
      url +="?count=" +str;
      xmlHttp.onreadystatechange = stateChange1;
      xmlHttp.open("GET", url, true);
      xmlHttp.send(null);
      }
      function stateChange1(){   
      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
      document.getElementById("city").innerHTML=xmlHttp.responseText   
      }   
      }
      		</script>  
      </head>  
      <body>  
      
      <select name='country' onchange="showState(this.value)" id='coval'>  
      <option value='-1'>Select</option>  
 <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/reg1","root","1234");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from country");
 while(rs.next()){
     %>
      <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
     <%
 }
     %>
      </select>  
      <br>  
      <div id='state'>  
      <select name='state' id='sval'>  
      <option value='-1'>Select</option>  
      </select>  
      </div>  

 	  <div id='city'>	
      <select name='city' id='cval'>  
      <option value='-1'>Select</option>  
      </select>  
      </div>
      
      
      <button onclick='validate()'>go</button>
    
      </body> 
      
      

      </html>
