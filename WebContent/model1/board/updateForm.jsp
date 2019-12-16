<%@page import="model.Board"%>
<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%--
    1. num값의 게시물을 db에서 조회하여 화면 출력하기.
  --%>
<% 
   int num =  Integer.parseInt(request.getParameter("num"));// num값의 게시물을 db에서 조회
/*    BoardDao dao = new BoardDao();
   Board b = dao.selectOne(num); */
   //b :  num 값에 해당하는 게시물의 db의 정보 저장.
   Board b = new BoardDao().selectOne(num);   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 수정 화면</title>
<link rel="stylesheet" href="../../css/mainboard.css">
<script>
    function file_delete(){
       document.f.file2.value="";
       file_desc.style.display="none"; //파일자체가 사라지진 않는다. 안보여지는것 뿐.
       }
</script>
</head>
<body>
<form action="update.jsp" method="post" enctype="multipart/form-data" name="f"> <!--  multipart/form-data => useBean사용불가. -->
   <input type="hidden" name="num" value = "<%=b.getNum() %>">
   <input type="hidden" name="file2" value = "<%=b.getFile1()==null?"":b.getFile1() %>"> <!-- 기존에 있는 내용을 없앤다. -->
   <table><caption>게시판 수정 화면</caption>
   <tr><td>글쓴이</td><td><input type="text" name="name" value="<%=b.getName()%>"></td></tr>
   <tr><td>비밀번호</td><td><input type="password" name="pass" ></td></tr>
   <tr><td>제목</td><td><input type="text" name="subject" value="<%=b.getSubject() %>"></td></tr>
   <tr><td>내용</td><td><textarea rows="15" name="content" value="<%=b.getContent()%>"></textarea></td></tr>
   <tr><td>첨부파일</td><td style="text-align:left">
   <%if (b.getFile1() != null && (!b.getFile1().equals(""))){%>
      <div id="file_desc"><%=b.getFile1()%>
      <a href="javascript:file_delete()">[첨부파일 삭제]</a></div>
   <%}%>
   <input type="file" name="file1"></td></tr>
   <tr><td colspan="2"><a href="javascript:document.f.submit()">[게시물 수정]</a></td></tr>
</table>
</form>
</body>
</html>