<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day4[1] JSTL</title>
</head>
<body>
	<!-- jstl 태그를 사용하기 위한 지시자 설정-->
	<!-- c로 시작하는 태그 : core 태그 => 변수, 제어문 사용 -->
	<!-- 자바 변수처럼 값 저장 가능 : c:set -->

	<h3>자바 변수처럼 값을 저장</h3>
	<!-- 변수명: age, 값 : 10 -->
	<c:set var="age" value="10" />
	age 출력 : 단순 el(${age}) 보다는 
	c:out 태그 사용(<c:out value="${age}" />) 
	<br> XSS를 방지합니다.

	<h3>자바 if 역할 태그</h3>
	<c:if test="${age<20 }">
		<span style="color: green;">청소년 입니다.</span>
	</c:if>

	<h3>자바 if ~ else 역할 태그</h3>
	<c:set var="age" value="30" /> 	<!-- 변수값 변경 -->
	<c:choose>
		<c:when test="${age<20 }">	<!-- if -->
			<span style="color: green;">20세 미만 청소년 입니다.</span>
		</c:when>
		<c:otherwise>	<!-- else -->
			<span style="color: green;">20세 이상 성인 입니다.</span>
		</c:otherwise>
	</c:choose>
	
	<!-- parameter를 가져옴 이름은 cnt -->
	<h3>for 역할 태그</h3>
	<c:forEach var="i" begin="0" end="${param.cnt}" step="2">
		<c:out value="${i}" />
		<br>
	</c:forEach>
	<a href = "jstl_ex.jsp?cnt=10">param.cnt 테스트</a>

	<h3>forToken 태그</h3>
	<c:forTokens items="사나,나나,나연,다현" delims="," var = "user">
	<c:out value="${user}"></c:out> <br>
	</c:forTokens>
</body>
</html>