<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP1 프로젝트[5]</title>
</head>
<body>
	<h3>Request Parameter 연습</h3>
	<h5>사용자 입력 받기 -> 서버 전송</h5>
	<hr>

	<h5>Request Method를 GET으로 실행 합니다.(method 기본 값은 get)</h5>
	<!-- action은 데이터를 받을 서버의 url(파일명) -->
	<form action="request_parameter.jsp">
		<!-- request.getParameter(이름)로 실행할 이름과 같은 name을 설정 -->
		<input name="name" placeholder="이름 입력"> 
		<input name="age" placeholder= "나이 입력">
		<input name="location" placeholder= "주소 입력">
		<!-- 서버에 제출 -->
		<input type="submit" value="전송">
	</form>
	<hr>
	<h5>Request Method를 POST로 실행 합니다.</h5>
	<!-- POST 방식으로  전달시 url에 parameter를 숨길수 있음-->
	<!-- Query String -> Form Data -->
	<form action="request_parameter.jsp" method = "post">
		<input name="name" placeholder="이름 입력">
		<input name="age" placeholder= "나이 입력">
		<input name="location" placeholder= "주소 입력"> 
		<input type="submit" value="전송(POST)" >
	</form>
	
	<!-- 
	Request Method
	GET : 입력 데이터를 Query String으로 전달, 문자인코딩은 자동 UTF-8 => 검색으로 사용
	POST : 입력 데이터를 form data로 전달, 문자인코딩 설정 필요 => 새로운 데이터 저장 목적으로 사용
	 -->

</body>
</html>