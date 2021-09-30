<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 페이지 요청 처리</title>
</head>
<body>
	<div style="width: 30%; margin: auto; padding-top: 30px;">
		<div>
			<img width="100%" alt="404status" src="../img/image.png">
		</div>
		<div style="text-align: center;">
			<h4>요청하신 페이지를 찾을 수 없습니다.</h4>
			<a href="${pageContext.request.contextPath }">💒HOME</a>
			<a href="javascript:history.back()">🚙뒤로가기</a>
			<!-- 
			상대경로 : 현재 위치를 기준으로 ../ or ./ 
			절대경로: 이 어플리케이션의 context를 기준으로 함
			-->
		</div>
	</div>
</body>
</html>