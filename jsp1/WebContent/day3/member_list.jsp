<%@page import="day3.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="day3.dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day3[4] - db 회원 리스트</title>
<style>
table {
	border-collapse: separate;
	border-spacing: 5px 10px;
}

tr, td {
	border: 1px solid black;
	border-radius: 10px;
	text-align: center;
	padding: 5px;
}

tr:first-child {
	background-color: aqua;
	color: red;
}
</style>
</head>
<body>
	<%
		CustomerDao dao = CustomerDao.getInstance();
		List<Customer> list = dao.selectAll();
		// out.print(list);
	%>
	<h3>고객 리스트</h3>
	<table>
		<tr>
			<td>이름</td>
			<td>나이</td>
			<td>주소</td>
			<td>이메일</td>
			<td>취미</td>
		</tr>
		<%
			for (Customer cus : list) {
		%>
		<tr>
			<td><%=cus.getName()%></td>
			<td><%=cus.getAge()%>세</td>
			<td><%=cus.getAddress()%></td>
			<td><%=cus.getEmail()%></td>
			<td><%=cus.getHobby()%></td>
		</tr>
		<%
			}
		%>

	</table>
</body>
</html>