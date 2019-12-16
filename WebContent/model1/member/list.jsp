<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	1.로그아웃 상태: 로그인이 필요합니다. 메세지 출력
    				 loginForm.jsp로 페이지이동
    	2.로그인 상태
    		일반 사용자: 관리자만 가능한 거래입니다. 메세지 출력
    				 main.jsp로 페이지 이동
    		관리자
    	3.db에서 모든 회원 정보를 조회하여 List<Member> 객체로 리턴
    		List<Member> list = new MemberDao().list();
     --%>
 <%
 	String login = (String)session.getAttribute("login");
	if(login == null || login.trim().equals(""))
	{ //로그인 안된 경우
%> 
	<script>
		alert("로그인이 필요합니다.");
		location.href="loginForm.jsp";
	</script>
<%	} else if(!login.equals("admin")) { 	
%>
		<script>
		alert("관리자만 접근 가능합니다.");
		location.href="main.jsp";
		</script>
<% } else {
	List<Member> list = new MemberDao().list(); //MemberDao를 사용해서 db부분을 가져옴.(MemberDao.java에 작성)
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 목록보기</title>
<link rel="stylesheet" href="../../css/main3.css">
</head>
<body>
<table><caption>회원 목록</caption>
<tr></tr><th>아이디</th><th>이름</th><th>성별</th><th>전화</th><th>&nbsp;</th>
<% for(Member m : list) { //리스트 하나하나가 객체.
 %>
         <tr><td><a href="info.jsp?id=<%=m.getId() %>"><%=m.getId() %></a></td> <!-- href="info.jsp?id=m.getId() info.jsp로 가서 id구분-->
         <td><%=m.getName() %></td>
         <td><%=m.getGender()==1?"남":"여" %></td>
         <td><%=m.getTel() %></td>
         <td><a href="updateForm.jsp?id=<%=m.getId() %>">[수정]</a>
<%
       if(!m.getId().equals("admin")) 
         {
%>
            <a href="delete.jsp?id=<%=m.getId() %>">[강제탈퇴]</a>
      <%  } %></td></tr>
   <% } %>
</table>
</body>
</html>
<%	} %>