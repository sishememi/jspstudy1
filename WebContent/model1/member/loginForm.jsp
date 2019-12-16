<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
    ..:상위폴더
    "../../css/main.css" : 상대경로 방식
    "/jspstudy1/css/main.css" 절대경로방식
 	<link rel="stylesheet" href="../../css/main.css">
--%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<link rel="stylesheet" href="../../css/main3.css">
<script>
	function find_id(){
		var nw = open("idForm.jsp","id","width=600,height=200,menubar=no,top=200,left=200")
	}
	
	function find_pw(){
		var nw = open("pwForm.jsp","pw","width=600,height=250,menubar=no,top=200,left=200")
	}
</script>
</head>
<body>
<form action="login.jsp" method="post" name="f">
<table>
	<caption>로그인</caption>
	<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
	<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
	<tr><td colspan="2">
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='joinForm.jsp'">
		<input type="button" value="아이디찾기" onclick="javascript:find_id()">
		<input type="button" value="비밀번호찾기" onclick="javascript:find_pw()"></td></tr>
</table>
</form>
</body>
</html>