<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day12 Gallery</title>
<style type="text/css">
input {
	padding: 10px;
	border: 1px solid gray;
	border-radius: 5px;
}

.thumbnail {
	padding-bottom: 10px;
	border: none;
}

.thumbnail img {
	width: 100%;
	height: 300px;
	object-fit: cover;
	margin-bottom: 10px;
}

.container {
	width: 30%;
	float: left;
	padding: 10px;
	border: none;
}
form > :nth-child(5) {/* 5번째 자식태그(자식태그는 br도 포함) */
	margin-left: 50px;
}
</style>

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
	<c:forEach var="item" items="${glist}">
	 	<div class="container">
	 		<div class="thumbnail">
	 			<img alt="gallery" src="/img/${item.filename}">
	 			<!-- /img/와 upload폴더와의 매핑 필요 : server.xml에서 -->
	 		</div>
	 		<div>
	 			<strong>${item.title}</strong>
	 		</div>
	 	</div>
	</c:forEach>
</body>
<!--   
server.xml에서 <Host> 사이에 context 태그 추가
<Context docBase="d:\desktop\upload" path="/img" reloadable="true"/> -->

</html>