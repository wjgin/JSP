<%@page import="day3.dao.CustomerDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="java.util.Arrays"%>
<%@page import="day1.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mybatis insert 결과</title>
<style type="text/css">
li {
	list-style: none;
	border-radius: 3px;
	background-color: aqua;
	margin: 5px;
}

ul {
	display: flex;
	flex-direction: row;
}
</style>
</head>
<body>
	<h3>✋Welcome!✋</h3>
	<c:choose>
		<c:when test="${idx > 0}">
			<ul>
				<li id="name"><c:out value="${customer.name}"/></li>
				<li><c:out value="${customer.age}세(${customer.gender eq 'male' ? '남성' : '여성'})"/></li>
				<li><c:out value="${customer.address}"/></li>
				<li><c:out value="${customer.email}"/></li>
				<li><c:out value="${customer.hobby}"/></li>
			</ul>
		</c:when>
		<c:otherwise>
			<span>잘못된 입력 입니다.</span>
		</c:otherwise>
	</c:choose>
	<hr>
	
	<a href = "update.jsp?idx=${customer.idx}">👉 정보 수정</a>
	<a href = "delete.jsp?idx=${customer.idx}">👉 회원 삭제</a>
</body>
</html>