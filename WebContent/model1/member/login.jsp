<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	1. id에 해당하는 정보를  db에서 조회
    	2. 내용이 존재하면 비밀번호 검증
    		 -> db의 비밀번호와 입력된 비밀번호를 확인
    		 	맞는 경우 : session 로그인 정보 등록. 확인 메세지 출력.
    		 => main.jsp로 페이지이동
    		 	비밀번호가	틀린 경우 : '비밀번호가 틀립니다. 다시 확인하세요' 메세지 출력	
    		id가 없으면 화면에 '아이디를 확인하세요' 메세지 출력
    		 => loginForm.jsp로 페이지 이동
     --%>
     <%-- MVC
     		모델1 : 기본JSP 구성
     		모델2 : EL,JSTL ,myBatis라는 프레임워크를 이용하여 모델구성.
     	 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 회원정보 조회</title>
</head>
<body>
<%
	String id = request.getParameter("id"); //요청객체에 의해 id,password가져옴
	String pass = request.getParameter("pass");
	//MemberDao 클래스 : Model 담당 클래스
	//Model : dbms와 연관있는 기능을 가진 클래스
	Member mem = new MemberDao().selectOne(id);
	if(mem != null) { //id 존재
		if(pass.equals(mem.getPass())){ //비밀번호 맞는 경우. 로그인 성공 /pass=>입력된내용  mem.getPass()=>데이터베이스에 있는내용
		session.setAttribute("login", id); //로그인 정보 등록 , login 이라는 별명을 지정한곳에  id값들이 들어감.
%>
<script type="text/javascript">
	alert("<%=mem.getName()%>님이 로그인 하셨습니다."); 
	//Name 이 들어감
	location.href='main.jsp'; //main 페이지로 이동.
</script>
<%	}else{ //비밀번호가 틀린경우
%>
<script type="text/javascript">
	alert("비밀번호가 틀립니다. 확인하세요");
	location.href="loginForm.jsp";
</script>	
<%	}	
	}else{ //id 없는 경우	
%>
<script type="text/javascript">
	alert("아이디를 확인하세요");
	location.href="loginForm.jsp";
</script>	
<% 	} %>

</body>
</html>