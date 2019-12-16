<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 내용 보기</title>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<%-- String writer = request.getParameter("writer);	
	 .....
 --%>
 <%--
 	1. useBean=> Book book = new Book();
 	2. pageContext.setAttribute("book",book);
  --%>
<jsp:useBean id="book" class="chap7.Book"/>
<%--
	book 객체가 위에서 만들어지고
	book.setWriter(request.getParameter("Writer"));
	book.setTitle(request.getParameter("title")
	...
	프로퍼티
	set프로퍼티
	setXxx() => xxx
	get프로퍼티
	getXxx() => xxx
	
	위 useBean과 setProperty 를 사용하면 가지고있는 파라미터 값을 전부 받을수 ㅇ ㅣㅆ다.
 --%>
<jsp:setProperty property="*" name="book"/>
<%--book.setWriter(request.getParameter("name")) --%>
<jsp:setProperty property="wr" name="book" param="name"/>
<table border="1" style="border-collapse: collapse;">
<caption>방명록 조회</caption>
<%-- getProperty => book.getWriter() 메서드 호출 , 이름이 book이고 writer값을 가져옴--%>
<tr><td>작성자</td><td><jsp:getProperty name="book" property="wr"/>,<%=book.getWr() %></td></tr>
<%-- getProperty => book.getTitle() 메서드 호출 --%>
<tr><td>제목</td><td><jsp:getProperty name="book" property="title"/>,<%=book.getTitle() %></td></tr>
<%--getProperty => book.getContent() 메서드 호출 --%>
<tr><td>내용</td><td><jsp:getProperty name="book" property="content"/>,<%=book.getContent() %></td></tr>
</table>
</body>
</html>