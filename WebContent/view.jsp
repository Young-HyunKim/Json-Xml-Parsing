 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>                 
<%@page import="org.json.simple.parser.JSONParser"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSON/XML</title>
</head>
<body>
<div>
	<h1>json</h1>
	<button class="btnCallJson" id="btnCallJson">jsonCall</button>
	<table id="tblListJson" border="1" style="color:red;"></table>
</div>

<div>
	<h1>xml</h1>
	<button class="btnCallXml" id="btnCallXml">xmlCall</button>
	<table id="tblListXml" border="1" style="color:blue;"></table>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$("#btnCallJson").click(function() {
	$.ajax({
		url: "./jsontype.jsp",			
		type: "get",					
		dataType: "json",			
		data: {
			
		},
		success: function(data) {
			$("#tblListJson").empty("")	
			
			var html =' ';
				html+='<tr>';
				html+='<th>Name</th>';
				html+='<th>Email</th>';
				html+='<th>PW</th>';''
				html+='<th>studentPhone</th>';
				html+='<th>parentPhone</th>';
				html+='</tr>';
				
	        $.each(data, function(index, value) {
	        	html+='<tr>';
	        	html+='<td>' + value.name + '</td>';
	        	html+='<td>' + value.email + '</td>';
	        	html+='<td>' + value.password + '</td>';
	        	html+='<td>' + value.studentPhone + '</td>';
	        	html+='<td>' + value.parentPhone + '</td>';
				html+='</tr>';
			});
			$("#tblListJson").append(html)
		},
        error    : function() {
            alert('error');
        }
	});	
});


$("#btnCallXml").click(function() {

	$.ajax({
		url: "./xmltype.jsp",			
		type: "get",					
		success: function(data) {		
			$("#tblListXml").empty("")
			
			var html =' ';
				html+='<tr>';
				html+='<th>이름</th>';
				html+='<th>이메일</th>';
				html+='<th>비밀번호</th>';
				html+='<th>학생번호</th>';
				html+='<th>부모번호</th>';
				html+='</tr>';
			
	        $(data).find("person").each(function() {
                var name = $(this).find("name").text();		
                var email = $(this).find("email").text();
                var password = $(this).find("password").text();
                var studentphone = $(this).find("studentPhone").text();
                var parentphone = $(this).find("parentPhone").text();
				
                html +='<tr>';
	        	html +='<td>' + name + '</td>';
	        	html +='<td>' + email + '</td>';
	        	html +='<td>' + password + '</td>';
	        	html +='<td>' + studentphone + '</td>';
	        	html +='<td>' + parentphone + '</td>';
				html += '</tr>';
			});
	        
			$("#tblListXml").append(html)	
		},
        error    : function() {
            alert('error');
        }
	});	
});
</script>
</body>
</html>