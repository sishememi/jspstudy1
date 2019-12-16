<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>date1</title>
</head>
<body>

<form action="date2.jsp" method="post" name="d">
<% 
	String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss a").format(new Date());
	session.setAttribute("date", date);
%>
</form>
등록된 날짜: <%=date%>
</body>
</html>