<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- thumnail 이미지 예제 : 큰이미지를 작은 이미지로 생성. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>원본 이미지 올리기</title>
</head>
<body>
<form action="thumbnail.jsp" method="post" enctype="multipart/form-data">
	원본이미지: <input type="file" name="picture">
	<input type="submit" value="썸네일 이미지 생성">
</form>
</body>
</html>