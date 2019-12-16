<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1.로그인 후에 보여지는 페이지
	  => 로그인이 안된 경우 => loginFrom.jsp 페이지 이동하기.
--%>    
<%
	//로그인 정보
	String login = (String)session.getAttribute("login"); //로그인이 되어져있는지 확인.
	if(login == null || login.trim().equals("")){
		response.sendRedirect("loginForm.jsp");	//재요청
	}else{
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원관리</title>
</head>
<body>
<h3><%=login %>로 로그인 되었습니다.</h3>
<h3><a href="logout.jsp">로그아웃</a></h3>
<h3><a href="info.jsp?id=<%=login %>">회원정보보기</a></h3>
<% if(login.equals("admin")){%>
<h3><a href="list.jsp">회원 목록보기</a></h3>
<%} %> <%} %>
</body>
</html>