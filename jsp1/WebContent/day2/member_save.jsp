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
	<h3>✋Welcome!✋</h3>
	<hr>
	<%
	request.setCharacterEncoding("UTF-8");
	/* 인자 받기 */
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	int age = Integer.parseInt(request.getParameter("age"));
	String address = request.getParameter("address");
	String gender = request.getParameter("gender").equals("mail") ? "남자" : "여자";
	String[] hobby = request.getParameterValues("hobby");
	%>

	<!-- 화면 출력 -->
	<ul>
		<li>이름 : <%=name%></li>
		<li>이메일 : <%=email%></li>
		<li>나이 : <%=age%></li>
		<li>주소 : <%=address%></li>
		<li>성별 : <%=gender%></li>
		<li>취미 : <%=Arrays.toString(hobby)
			.substring(1, Arrays.toString(hobby).length()-1)%></li>
			<li><%=Arrays.toString(hobby).length() %></li>
	</ul>
</body>
</html>