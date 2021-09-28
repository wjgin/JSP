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
		if (address.equals("기타"))
			address = request.getParameter("addr_etc");
		String gender = request.getParameter("gender");
		String[] hobby = request.getParameterValues("hobby");
		String hobbies = Arrays.toString(hobby).substring(1, Arrays.toString(hobby).length() - 1);

		Customer cus = new Customer(0, name, password, email, address, gender, age, hobbies);
		CustomerDao dao = CustomerDao.getInstance();
		dao.insert(cus);
	%>
	<!-- 화면 출력 -->
	<ul>
		<li>이름 : <%=name%></li>
		<li>이메일 : <%=email%></li>
		<li>나이 : <%=age%></li>
		<li>주소 : <%=address%></li>
		<li>성별 : <%=gender.equals("male") ? "남자" : "여자"%></li>
		<li>취미 : <%=hobbies %></li>
	</ul>
</body>
</html>