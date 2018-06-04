<%@include file = "connection.jsp"%>
<head>
<script>
function validate(){
var subid=document.getElementById("subjectId").value;
var grdid=document.getElementById("gradeId").value;

alert(subid);
window.location=" contribute-subject-topic.jsp?sid='" + subid + "'&gid='"+grdid+"' ";
}
</script>
</head>

<% 
String str=request.getParameter("g");
rs=stat.executeQuery("Select grade_id,grade_name from grade");
String cmpstr="";
String grdid="";
Integer flag=0;
while(rs.next()){
	cmpstr=rs.getString("grade_name");
	if(str.equalsIgnoreCase(cmpstr)){
		grdid=rs.getString("grade_id");
		out.println("grade alredy exist,you can add subject");
		flag=1;
	}
}	
%>
Subject:<input type=text id='subjectId'>
		

<%
if(flag==0){    
	String qry="insert into grade(grade_name) values("+str+")";
  	stat.executeUpdate(qry);
    out.println("Updated successfully...");
    rs=stat.executeQuery(" Select grade_id from grade where grade_name="+ str +" ");
    if(rs.next()){
    	grdid=rs.getString("grade_id");
    }
}


%>
    <input type=text id=gradeId value=<%=grdid%>/>
    <button value=submit onclick='validate()'>go</button>		