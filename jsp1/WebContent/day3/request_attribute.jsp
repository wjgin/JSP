<%@page import="day1.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[5] - request 객체의 애트리뷰트</title>
</head>
<body>
<!-- 데이터가 저장된 페이지에서 사용자 페이지로 전환 : pageContext.forward("데이터페이지")-->

<%
	MyUser vo = new MyUser("사나", 23, "서울");
	int value1 = 23;
	String value2 = "Hello";
	
	// 위 3가지 값은 request_result.jsp 파일로 전달
	// Attribute의 key, value로 저장 
	request.setAttribute("attr1", vo);
	request.setAttribute("attr2", value1);
	request.setAttribute("attr3", value2);
	
	// 요청을 변경 x, 요청 전달 o (데이터 전달 목적)
	// 요청을 전달했기에 url이 변경없음
	pageContext.forward("request_result.jsp");
%>
</body>
</html>