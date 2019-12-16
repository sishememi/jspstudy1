<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%--
    	1. 로그아웃 상태 : "로그인하세요." 메세지 출력. loginForm.jsp 페이지이동
    	2. 로그인 상태
    			*유효성검증
    		- 관리자가 아니고, id와 login이 다른 경우
    			"본인만 탈퇴 가능합니다." 메세지 출력. main.jsp 페이지로 이동
    		- id가 관리자 인 경우
    			"관리자는 탈퇴가 불가능합니다. 메세지 출력. list.jsp 페이지 이동
    			유효성검증*
    		- 일반사용자 
    			(1) 아이디, 비밀번호 정보
    			(2) 비밀번호 불일치 =>입력된 비밀번호와 db의 비밀번호를 검증
    					"비밀번호가 틀립니다" 메세지 출력. deleteForm.jsp 페이지 이동
    		- 관리자 
    			(1) 아이디 정보를 파라미터로 전송
    	3. 관리자 로그인, 또는 비밀번호 일치하는 경우 db에서 회원 정보 삭제하기
    	 	삭제 성공 
    	 		일반사용자 : 로그아웃 후 탈퇴메세지 출력 . loginForm.jsp 페이지이동
    	 		관리자 : 탈퇴 메세지 출력. list.jsp 페이지 이동.
    	 	삭제 실패 
    	 		일반사용자 : 삭제실패 메세지 출력. info.jsp 페이지 이동.
    	 		관리자 : 삭제실패 메세지 출력. list.jsp 페이지 이동.
    --%>
<%
	String login = (String)session.getAttribute("login");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String msg = null;
	String url = null;
	if(login == null || login.trim().equals("")){ //로그아웃 상태 
		msg = "로그인 하세요.";
		url = "loginForm.jsp";	
	}else if(!login.equals("admin") && !login.equals(id)){ //본인이아닐때
			msg = "본인만 탈퇴 가능합니다.";
			url = "main.jsp";
		}else if(id.equals("admin")){ //탈퇴 대상이 되는 회원은 관리자 안됨.
			msg = "관리자는 탈퇴가 불가능합니다.";
			url = "list.jsp"; //여기까지는 ㅣㅂ밀번호 관련없음.
		}else { //비밀번호에 관한 내용(검증)
			MemberDao dao = new MemberDao(); //db에가서
			Member mem = dao.selectOne(id); //id에 관한내용 db정보 조회
			if(login.equals("admin") || pass.equals(mem.getPass())){ //if 구문안에 순서 바뀔수 없음. 앞이 트루면 전체명제는 참. 궂이 실행하지않음
				int result = dao.delete(id); 
				if(result > 0 ){ //삭제성공
					if(login.equals("admin")){ //관리자인경우
						msg = id+"사용자를 강제 탈퇴 성공";
						url = "list.jsp";
					}else { //일반 사용자인경우
						msg = id+"님의 회원 탈퇴가 완료되었습니다.";
						url = "loginForm.jsp";
						session.invalidate();
					}
				}else{ //삭제 실패
					msg = id + "님의 탈퇴시 오류 발생.";
					if(login.equals("admin")){ //관리자인경우
						url = "list.jsp";
					}else { //일반사용자
						url = "info.jsp?id="+id;
					}
				}
			}else{
				msg = id +"님의 비밀번호가 틀립니다.";
				url = "deleteForm.jsp?id="+ id;
			}
		}
%>    
    
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>