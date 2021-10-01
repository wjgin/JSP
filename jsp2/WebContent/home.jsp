<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동아리 커뮤니티 :: 자유게시판</title>
</head>
<body>
	<a href="community/listAction.jsp">커뮤니티 게시판</a>
	<c:if test="${sessionScope.user == null}">
		<a href="loginView.jsp">로그인</a>
	</c:if>
	<c:if test="${sessionScope.user != null}">
	<!-- 로그인 상태 -->
		<br> ${user.name}(${user.email})님 반갑습니다.<br>
		<a href="logout.jsp">로그아웃</a>
	</c:if>
</body>
</html>