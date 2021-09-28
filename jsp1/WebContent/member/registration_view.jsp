<%@page import="day3.dao.CustomerDao"%>
<%@page import="day3.dto.Customer"%>
<%@page import="java.util.Arrays"%>
<%@page import="day1.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP1 프로젝트[7]</title>
</head>
<body>
	<!-- 사용자 입력 화면 출력, DB 전달 -->
	<%
		Customer cus = (Customer)request.getAttribute("customer");
	%>
	<h3>✋Welcome!✋</h3>
	<hr>
	<ul>
		<li>이름 : <%=cus.getName()%></li>
		<li>이메일 : <%=cus.getEmail()%></li>
		<li>나이 : <%=cus.getAge()%></li>
		<li>주소 : <%=cus.getAddress()%></li>
		<li>성별 : <%=cus.getGender().equals("male") ? "남자" : "여자"%></li>
		<li>취미 : <%=cus.getHobby() %></li>
	</ul>
</body>
</html>