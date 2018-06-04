<%@include file="connection.jsp"%>
<% 
		String s1=request.getParameter("fnm");
        String s2=request.getParameter("lnm");
        String s3=request.getParameter("eml");
        String s4=request.getParameter("usr");        
%>


<form method=get action=student-edit-profile3.jsp>	 		

<table border=1 align=center width=50% bordercolor=#000055 style='border-collapse:collapse'>
<tr>
<th bgcolor=#000055 > <font color=white> Login Form-Student
<tr>
<td bgcolor=#aaaaaa >&nbsp;
<tr>
<td>
<table border=0 align=center width=68% >
<tr>
<td>&nbsp;
<tr>
<td > first name : 
<td > <input type=text name=fnm  value=<%=s1%> required >
<tr>
<td > last name : 
<td > <input type=text name=lnm value=<%=s2%> required >
<tr>
<td > email : 
<td > <input type=text name=email value=<%=s3%> required >
<tr>
<td > user name : 
<td > <input type=text name=unm value=<%=s4%> required >
<tr>
<td>edit:
<td><input type=submit value=confirm-edit>


<tr>
<td>&nbsp;
<tr>
<td>&nbsp;
</table>
</table>
<p><a href=./../../index.html>HOME</a>
</p>
<p>
&copy; Abhishek - 2017
</p>
</form>
