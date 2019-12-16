<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
	1. 모든 파라미터 Member 객체에 저장
	2. 입력된 비밀번호와 db에 저장된 비밀번호가 같지않으면
		"비밀번호가 틀렸습니다." 메세지 출력 후, updateForm.jsp 페이지로 이동.
	3. 1번에 내용을 db에 수정하기
		 int MemberDao.update(Member)
		결과가 0보다 크면 "수정성공" 메세지 출력. info.jsp 페이지 이동
			 0보다 작으면 "수정 실패" 메세지 출력. main.jsp 페이지 이동
 --%>    
<%request.setCharacterEncoding("euc-kr");%>
<%-- useBean -> Member m = new Member(); --%>
<jsp:useBean id="m" class="model.Member" />
<%-- jsp:setProperty -> m.setId(requset.getParameter("id"); --%>
<jsp:setProperty name="m" property="*"/><!-- 1. 파라미터 객체 모두 Member에  저장 /m = 변경 후 내용  --> 
<%
	MemberDao dao = new MemberDao(); //MemberDao에 관련된 dao객채만듬
	//selectOne(id) : 사용자 id에 해당한 db정보 Member 객체로 리턴
	//dbmem : 변경 전 Member 정보 저장
	Member dbmem = dao.selectOne(m.getId()); //dbmem = 변경 전 내용. m(모든값)에  id 파라미터로부터 dao객채로 리턴.
	String login = (String)session.getAttribute("login");
	String msg = null;
	String url = null;
	//비밀번호 오류
	if(!login.equals("admin") && !m.getPass().equals(dbmem.getPass())){ //dbmem.getPass()=db에있는 비밀번호,m.getPass()=입력한 비밀번호
		msg = "비밀번호가 틀렸습니다.";
		url = "updateForm.jsp?id="+m.getId(); //updateForm을 호출하면 id값이 들어와있어야함.
	}else {//비밀번호 일치
		MemberDao dao2 = new MemberDao(); 
		int result = dao2.update(m); //m => jsp:useBean의 'm' /update = >db에 회원 정보 변경 기능. 결과 정수값 리턴.
		if(result  > 0){
			msg = "수정이 완료되었습니다.";
			url = "info.jsp?id="+m.getId();	
		}else { 	
			msg = "수정을 완료하지 못하였습니다."; //result<0
			url = "main.jsp";	//파라미터 없음.

		}
	}%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>