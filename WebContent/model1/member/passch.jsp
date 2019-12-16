<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--
	1.로그아웃 상태인 경우. 로그인하세요. 메세지 출력
	    로그인 상태임
		다른 사용자의 비밀번호 변경 불가.
		opener 페이지를 loginForm.jsp 페이지 이동.
		페이지 닫기
	2. 로그아웃 상태아닐때. pass,chpass 파라미터 값 저장.
	3.pass 비밀번호가 db에 저장된 비밀번호와 틀리면
	    비밀번호 오류메세지 출력. passwordFrom.jsp로 페이지이동
	4.pass 비밀번호가 db에 저장된 비밀번호와 같으면
	    비밀번호 수정. 
	  opener 페이지를 updateForm.jsp 페이지 이동.
	    현재 페이지 닫기.
 --%>
<%
	String login = (String)session.getAttribute("login");
	boolean opener = false;
	boolean closer = false;
	String msg = null;
	String url = null;

	if(login == null || login.trim().equals("")){ //로그아웃 상태
		opener  = true;
		closer = true;
		msg = "로그인하세요.";
		url = "loginForm.jsp";
	}else {//로그인
		String pass = request.getParameter("pass");
		String chgpass = request.getParameter("chgpass");
		MemberDao dao= new MemberDao();
		Member mem = dao.selectOne(login); //login은 값이있는애드람ㄴ 들어옴
		if(pass.equals(mem.getPass())){ //입력된 비밀번호와 db에 입력된 비밀번호가 같은 경우
			closer = true;
			if(dao.updatePass(login,chgpass) > 0) {
				msg ="비밀번호가 변경되었습니다.";
			}else{
				msg = "비밀번호 변경중 오류가 발생했습니다.";
			}
		}else {	//입력된 비밀번호와 db에 입력된 비밀번호가 다른 경우
			msg="비밀번호 오류입니다. 확인하세요.";
			url ="passwordForm.jsp";
		}
	}%>
<script>
	alert("<%=msg%>");
	<%if(opener) { %>
		opener.location.href="<%=url%>";
	<%} else {%>
		location.href="<%=url%>";
	<% } %>
	<%if(closer) { %>
		self.close();
	<% } %>
</script>
