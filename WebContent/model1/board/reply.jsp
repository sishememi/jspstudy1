<%@page import="model.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1.파라미터 값을 Board 객체에 저장하기. => useBean 태그 사용
		원글정보: num, grp, grplevel, grpstep //누구의답글,순서에대한.
		답글정보: name, pass, subject, content => 등록정보
	2.같은 grp 값을 사용하는 게시물들의 grpstep 값을 1 증가하기
		void BoardDao.grpSetAdd(grp,grpstep)
	2.같은 grp 값을 사용하는 게시물들의 grpstep 값을 1 증가하기
		num : maxnum + 1
		grp : 원글과 동일.
		grplevel : 원글 + 1
		grpstep : 원글 +1
	4.등록 성공시: "답변 등록완료" 메세지 출력 후 , list.jsp페이지로 이동
	    등록 실패시 : "답변 등록시 오류 발생" 메세지 출력 후 , replyForm.jsp 페이지 이동하기. 
		
--%>
<%--1.파라미터 값을 Board 객체에 저장하기. => useBean 태그 사용 --%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="b" class="model.Board"/>
<jsp:setProperty name="b" property="*"/>

<%
	BoardDao dao = new BoardDao();
	//2.같은 grp 값을 사용하는 게시물들의 grpstep 값을 1 증가하기
	dao.getStepAdd(b.getGrp(),b.getGrpstep());
	//3.Board 객체를 db에 insert하기.
	int grplevel = b.getGrplevel(); //원글에대한 level
	int grpstep = b.getGrpstep(); //원글에 대한 step
	int num = dao.maxnum(); // num의 최대값 저장
	String msg = "답변 등록시 오류발생";
	String url = "replyForm.jsp?num=" +b.getNum();
	b.setNum(++num);
	b.setGrplevel(grplevel + 1);//답글입력시 원글보다 1증가 해야됨.
	b.setGrpstep(grpstep + 1);
	if(dao.insert(b)){
		msg = "답변 등록완료";
		url = "list.jsp";
}%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
