<%@page import="java.sql.*"%>
 <html>
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
</head>  
<body>  
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
      
      <br>  
      <div id='subject'>  
      <select name='subject' id="sval">  
      <option value='-1'>select</option>  
      </select>  
      </div>  

      <div id='topic'>
      <select name='topic' id="tval">  
      <option value='-1'>select</option>  
      </select>  
      </div>
      
      <div id='resource'>  
      <select name='resource' id="rval">  
      <option value='-1' >select</option>  
      </select>  
      </div>
     
      
      <button onclick="validate()">go</button>
      
   
      </body> 
      </html>