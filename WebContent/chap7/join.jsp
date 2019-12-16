<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- 1.이미 joinForm.jsp의 파라미터값이  들어와잇음 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 내용 출력하기</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
 <% request.setCharacterEncoding("euc-kr"); %> <!-- 2.그래서 안깨지도록 한글 값으로. -->
 <jsp:useBean id="mem" class="chap7.Member" scope="page"/> <!-- 3.객체생성 -->
 <jsp:setProperty property="*" name="mem"/> <!-- property="*" 의미. 파라미터와 멤버객체의 setproperty와 비교해서 값을 받아옴. property-->
 <%-- mem 객체에 파라미터 값이 전부 저장된 상태 --%>
 <table border="1" style="border-collapse: collapse;"><caption>가입 내용출력</caption>
<tr><td>아이디</td><td><jsp:getProperty name="mem" property="id"/></td></tr>
<%-- 저장된값을 getProperty로 출력 이하 동문. --%>
<tr><td>비밀번호</td><td><jsp:getProperty name="mem" property="pass"/></td></tr>
<tr><td>이름</td><td><jsp:getProperty name="mem" property="name"/></td></tr>
<tr><td>성별</td><td><jsp:getProperty name="mem" property="gender2"/></td></tr>
<tr><td>나이</td><td><jsp:getProperty name="mem" property="age"/></td></tr>
<tr><td>이메일</td><td><jsp:getProperty name="mem" property="email"/></td></tr>
</table>
</body>
</html>