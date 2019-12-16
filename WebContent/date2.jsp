<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>date2</title>
</head>
<body>
<% 
	String sdate = (String)session.getAttribute("date");
	if(sdate == null){%>
	<script>
		alert("날짜 등록 후 거래하세요. date1.jsp로 돌아갑니다.");
		location.href="date1.jsp";
	</script>
<%	} else {  %>
		반갑습니다 등록된 날짜: <%=sdate %>
<%		
		session.invalidate();
	
}
%>	

</body>
</html>