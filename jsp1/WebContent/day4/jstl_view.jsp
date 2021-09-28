<%@page import="day3.dto.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day4[2] jstl과 el로 list 가져오기</title>
</head>
<body>
	<h3>고객 리스트 입니다.</h3>
	<!-- el로 attribute 가져오기  -->
	<%-- ${list} --%>
	<!-- cus : CustomerDto 타입, get메소드가 있어야지 프로퍼티를 가져올 수 있음 -->
	<c:forEach var="cus" items="${list}" varStatus="status">
		<ul>
			<!-- for의 상태를 가진 변수에서 index 가져오기-->
			<li id="name">${status.index}<a href="update.jsp?idx=${cus.idx}">${cus.name}</a></li>
			<li>${cus.age}세(${cus.gender eq 'male' ? '남성' : '여성'})</li>
			<li>${cus.address}</li>
			<li>${cus.email}</li>
			<li>${cus.hobby}</li>
		</ul>
	</c:forEach>
</body>
</html>