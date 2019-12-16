<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="javax.media.jai.RenderableOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String path = application.getRealPath("/") + "test/";
	int size = 10 * 1024 * 1024;//최대 업로드 크기
	MultipartRequest multi = new MultipartRequest(request,path,size,"EUC-KR");
	String fname = multi.getFilesystemName("picture");
	/* BufferedImage bi = ImageIO.read(new File(path + fname));
	int width = bi.getWidth()/100; //원본 이미지의 가로 크기의 1/5
	int height = bi.getHeight()/100; //원본 이미지의 세로크기의 1/5
	BufferedImage thumb = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	Graphics2D g = thumb.createGraphics();
	g.drawImage(bi,0,0,width,height,null);
	File f = new File(path + "sm_" + fname);
	ImageIO.write(thumb,"jpg",f); */
%>
<script>
	 function pic(p){
		opener.img.src = <%=fname%>
		opener.document.getElementById("picture").value= "<%=fname%>";
		self.close();
	 }
</script>

</body>
</html>