<%@page import="day3.dto.Customer"%>
<%@page import="java.util.List"%>
<%@page import="day5.dao.MybatisDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day5 - Mybatis 테스트</title>
</head>
<body>
	<%
		out.print("<h4>Mybatis selectAll test</h4>");
	MybatisDao dao = MybatisDao.getInstance();
	List<Customer> list = dao.selectAll();
	out.print("<ol>");
	for (Customer li : list) {
		out.print("<li>" + li + "</li>");
	}
	out.print("</ol>");

	out.print("<hr>");
	out.print("<h4>Mybatis select test</h4>");
	Customer cus = dao.select(4);
	out.print(cus);

	out.print("<hr>");
	out.print("<h4>Mybatis select null test</h4>");
	cus = dao.select(99);
	out.print(cus);

	out.print("<hr>");
	out.print("<h4>Mybatis insert into customer test</h4>");
	//		int result = dao.insert(new Customer(0, "테스트2", "1111", "seri@daum.net", null, "female", 0, "골프"));
	//		out.print(result);

	out.print("<hr>");
	out.print("<h4>Mybatis delete from customer test</h4>");
	int result = dao.delete(21);
	out.print(result);

	out.print("<hr>");
	out.print("<h4>Mybatis update test</h4>");
	cus = new Customer();
	cus.setEmail("seriPark@naver.com");
	cus.setAddress("청주");
	cus.setIdx(99);
	result = dao.update(cus);
	out.print(result);
	%>
</body>
</html>