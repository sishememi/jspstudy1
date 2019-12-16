<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	1.session에 로그인 정보 제거.
    	2. id 님 로그아웃되었습니다. 메세지 출력.
    	 	=>loginForm.jsp 페이지로 이동하기.
     --%>
<% 
	String login = (String)session.getAttribute("login");
	session.invalidate();
%>
<script>
alert("<%=login%>님 로그아웃되었습니다.");
location.href="loginForm.jsp";
</script>