<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/main.css">
<meta charset="EUC-KR">
<title>JDBC ����1</title>
</head>
<body>
<%  
	Class.forName("org.mariadb.jdbc.Driver"); 
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/classdb", "scott", "1234");
	String sql = "select * from student";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	ResultSetMetaData rsmt = rs.getMetaData();
	%>
<table class='w3-table-all'><tr>
<% for(int i=1; i<=rsmt.getColumnCount();i++){ %>
	<th><%=rsmt.getColumnName(i)%></th>
	<% } %>
</tr>
<% while(rs.next()){ %><tr>
	<%for(int i=1; i<=rsmt.getColumnCount();i++) { %>
		<td><%=rs.getString(i) %>
		</td><%} %>
<%} %></tr>
</table>

</body>
</html>