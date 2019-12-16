<%@page import="model.BoardDao"%>
<%@page import="model.Board"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	1. 원글의 num을 파라미터로 받는다.
    	2. 원글이 num,grp,grplevel,grpstep 정보를 저장.
    	3. 입력 화면  표시
     --%>
	<%
//num => 원글의 num 값
		int num = Integer.parseInt(request.getParameter("num")); // 파라미터값 읽기
		BoardDao dao = new BoardDao();
		Board board = dao.selectOne(num);//원글에 대한 게시물 조회
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 답변 글쓰기</title>
<link rel="stylesheet" href="../../css/mainboard.css">
</head>
<body>
<form action="reply.jsp" method="post" name="f">
	<input type="hidden" name="num" value="<%=board.getNum() %>"> <!-- hidden값들은 원글에 대한것들. -->
	<input type="hidden" name="grp" value="<%=board.getGrp() %>">
	<input type="hidden" name="grplevel" value="<%=board.getGrplevel()%>">
	<input type="hidden" name="grpstep" value="<%=board.getGrpstep()%>">
	<table><caption>게시판 답글 등록</caption>
	<tr><td>글쓴이</td><td><input type="text" name="name"></td></tr>
	<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
	<tr><td>제목</td><td><input type="text" name="subject" value="RE:<%=board.getSubject() %>"></td></tr>
	<tr><td>내용</td><td><textarea name="content" rows="15"></textarea></td></tr>
	<tr><td colspan="2"><a href = "javascript:document.f.submit()">[답변 등록]</a></td></tr> <!-- javascript:document.f.submit() => reply.jsp로 이동 -->
	<tr><td>글쓴이</td><td><input type="text" name="name"></td></tr>
</table>
</form>
</body>
</html>