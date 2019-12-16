<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
	//db연결 
	Class.forName("org.mariadb.jdbc.Driver"); //db연결
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb", "scott", "1234"); //db연결
	String sql = "select * from member where id=?";
	PreparedStatement pstmt = conn.prepareStatement(sql); 
	pstmt.setString(1,id); //첫번째 ?에 입력한 id를 넣음
	//db로 부터 id에 해당하는 정보 읽기.
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){ //id 존재
		
	String dbPass = rs.getString("pass");
	if(pass.equals(dbPass)){ //비밀번호 맞는 경우. 로그인 성공
		session.setAttribute("login", id);
		String name = rs.getString("name");
%>
<script type="text/javascript">
	alert("<%=name%>님이 로그인 하셨습니다.");
	location.href='main.jsp';
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