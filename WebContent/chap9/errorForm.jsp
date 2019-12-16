<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%-- 현재페이지에서 오류 (예외)발생시 error.jsp 제어 이동--%>
<%@ page errorPage="error.jsp" %>
    <%-- 예외 발생 페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>예외 발생 페이지</title>
</head>
<body>
<%=request.getParameter("name").trim() %>
</body>
</html>