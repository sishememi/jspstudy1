<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 가입 정보 확인</title>
<link rel="stylesheet" href="../css/syj.css">
</head>
<body>
 <% request.setCharacterEncoding("euc-kr"); %> 
 <jsp:useBean id="log" class="syj.Member.Test" scope="page"/> 
 <jsp:setProperty property="*" name="log"/> 
 <table><caption>회원가입 내용</caption>
<tr><td rowspan="4"><jsp:getProperty name="log" property="picture"/></td><td>아이디</td><td><jsp:getProperty name="log" property="id"/></td></tr> 
<tr><td>비밀번호</td><td><jsp:getProperty name="log" property="pass"/></tr>
<tr><td>이름</td><td><jsp:getProperty name="log" property="name"/></tr>
<tr><td>성별</td><td><jsp:getProperty name="log" property="gender2"/></td></tr>
<tr><td>전화번호</td><td colspan="2"><jsp:getProperty name="log" property="tel"/></td></tr>
<tr><td>이메일</td><td colspan="2"><jsp:getProperty name="log" property="email"/></td></tr>
<tr><td colspan="3"><input type="submit" value="회원가입"></td></tr>
</table>
<p style="text-aling:center">Goodee Academy Since 2016 - written by 심윤정</p>
</body>
</html>