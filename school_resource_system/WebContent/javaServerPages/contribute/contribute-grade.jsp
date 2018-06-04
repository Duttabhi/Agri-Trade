<head>
<script>
function validate(){
var grd=document.getElementById("gradeId").value;
alert(grd);
window.location=" contribute-grade-subject.jsp?g='" + grd + "' ";
}
</script>
</head>

<body>
Grade:<input type=text id='gradeId'>
<button value=submit onclick='validate()'>go</button>
</body>