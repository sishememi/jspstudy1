<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--
    	1.파라미터 정보를 Member 객체에 저장
    	2.Member 객체를 db에 저장 => model 담당
    	3.회원가입 성공 : loginForm.jsp 페이지 이동
    	    회원가입 실패 : joinForm.jsp 페이지이동 (아이디 중복..?)
     --%>
<% request.setCharacterEncoding("euc-kr"); %> 
<jsp:useBean id="m" class="model.Member" />
<jsp:setProperty name="m" property="*"/><!-- 파라미터 객체 모두  저장  -->
<% 
	MemberDao dao = new MemberDao(); 
	int result = dao.insert(m);//파라미터 객체 m으로 전달
	String msg = null;
	String url = null;
	if(result > 0) {
		msg = m.getName() + "님 회원 가입 완료";
		url = "loginForm.jsp";
	} else{		
		msg = "회원 가입 실패";
		url = "joinForm.jsp";
}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>