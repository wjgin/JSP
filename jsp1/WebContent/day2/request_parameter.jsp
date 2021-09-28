<%@page import="day1.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP1 프로젝트[4]</title>
</head>
<body>
	<!-- request parameter : request 객체에 저장되어 서버에게 전달되는 데이터. 
	1) URL 뒤에 ? 에 쿼리 문자열로 전달
	2) method를 post로 전달
-->
	<!-- 요청URL : http://http://localhost:8082/jsp1/day2/request_parameter.jsp?name=이름age=나이&location=지역 -->
	<h3>Request Parameter 연습</h3>
	<hr>
	<%
	// form data(method = "post")의 인코딩
	request.setCharacterEncoding("UTF-8");
	// requset의 파라미터
	// DTO(VO)를 타입 클래스를 이용해서 파라미터와 객체를 자동으로 매핑(프레임워크)
	String name = request.getParameter("name"); //"name"은 ?뒤에 파라미터 이름
	String age = request.getParameter("age"); //parameter 안 받을 수도 있음
	String location = request.getParameter("location");
	%>

	<ul>
		<li>이름 : <%=name%></li>
		<li>나이 : <%=age%></li>
		<li>지역 : <%=location%></li>
	</ul>
	<!-- 받은 parameter로 MyUser 객체 생성-->
	<%
	// age 파라미터가 없거나  String = "" 일 때, parseInt 오류 방지
		if (age == null || age.length() == 0) { 
	%>
	<script type="text/javascript">
		alert("나이를 입력하세요");
	</script>
	<%
	/* 
	out.print("<script>");
	out.print("alert('나이를 만드시 입력해야합니다.')");
	out.print("</script>");
	*/
	/* age = "999"; */

	} else {
	MyUser my2 = new MyUser(name, Integer.parseInt(age), location);
	out.print(my2); //out 내장 객체 -> 브라우저에 출력
	%>
	<ul>
		<li>이름 : <%=my2.getName()%></li>
		<li>나이 : <%=my2.getAge()%></li>
		<li>지역 : <%=my2.getLocation()%></li>
	</ul>
	<%
		} // end if
	%>


</body>
</html>