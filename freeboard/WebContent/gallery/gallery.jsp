<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day12 Gallery</title>
</head>
<body>
	<form action="regist.do" method="post" enctype="multipart/form-data">
		<input type="text" name="title" placeholder="제목 입력"><br>
		<!-- accept 특정 파일만 선택 가능, audio/*, video/*, 특정 확장자 -->
		<input type="file" name="pic" accept="image/*" placeholder="이미지 파일 선택"><br>
		<input type="submit" value="전송"><br>
	</form>
	
	<hr>
	<!-- 파일업롣 전송을한 후에 view를 gallery.jsp로 하고 업로드 이미지가 나오도록 -->
</body>
</html>