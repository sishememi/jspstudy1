<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%--
	1.파일 업로드 =>java 영역
	2.openr 화면에 결과 전달. => javascript
	3.현재 화면 close() => javascript
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<% //파일업로드에 관한부분.
	String path = application.getRealPath("") + "model1/member/picture";
	String fname = null;
	try {
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
		fname = multi.getFilesystemName("picture");
	} catch (IOException e) {
		e.printStackTrace();
	}
%>
<script type="text/javascript">
 	img = opener.document.getElementById("pic");
 	img.src = "picture/<%=fname%>";
 	opener.document.f.picture.value="<%=fname%>";
 	self.close();
</script>
</head>
<body>

</body>
</html>