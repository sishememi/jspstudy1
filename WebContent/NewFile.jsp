<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 정보 입력</title>
<link rel="stylesheet" href="css/syj.css">
</head>
<body>
<form action="join.jsp" method="post">
<table><caption>회원가입</caption>
<tr><td rowspan="4"></td><td>아이디</td><td><input type="text" name="id"></td></tr> <!-- 파라미터 값=>name="id"이 join.jsp로 전달 이하 동문 -->
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>이름</td><td><input type="text" name="name"></td></tr>
<tr><td>성별</td><td><input type="radio" name="gender" value="1" checked>남
					<input type="radio" name="gender" value="2">여</td></tr>
<tr><td>전화번호</td><td colspan="2"><input type="text" name="tel"></td></tr>
<tr><td>이메일</td><td colspan="2"><input type="text" name="email"></td></tr>
<tr><td colspan="3"><input type="submit" value="회원가입"></td></tr>
</table>
</form>
</body>
</html>