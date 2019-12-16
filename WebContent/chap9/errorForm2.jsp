<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
결과1 : <%= 100/0 %>
결과2 : <%= Integer.parseInt("홍길동") %>
<%--

	error 페이지 처리 우선 순위
	1. 해당 페이지별로 오류페이지 설정
		<%@ page errorPage="...jsp" %>
	2. web.xml에 설정된 예외 클래스 별로 설정
		 <exception-type>java.lang.NumberFormatException</exception-type>
	     예외클래스 설정시 패키지명을 포함해야 한다.
	3. web.xml에 설정된 error 코드별로 설정.
		<error-code>500</error-code>
	4. 톰캣(웹컨테이너,웹어플리케이션서버,WAS)에서 기본으로 제공하는 에러페이지
 --%>
</body>
</html>