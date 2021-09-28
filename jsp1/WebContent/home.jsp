<%@page import="day1.MyUser"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- html 파일과 JSP파일의 다른점 
	page 지시자  : java 프로그래밍 -> WAS -> 서버가 컴파일 -> html 문서 응답
	
	index.html -> web 서버 -> 서버에 배포된 파일을 요청에 따라 바로 응답
	
	http://localhost:8082/jsp1/파일 -> web서버 -> WAS -> DB서버 
								응답		<-		<-		<-
	 --%>
	<%--이 소스파일에 자바코드 작성 가능 : 스크립트릿 --%>
	<%
	String message = "hello";
	LocalDate now = LocalDate.now(); //새로운 클래스 임포트
	%>
	<h4>I am JSP</h4>
	<ul>
		<%--자바코드의 변수값 (표현식) 출력  --%>
		<li><%=now%></li>
		<%-- 자바스크립트의 ${} 표현식으로 변경: 라이브러리 사용 --%>
		<li><%=message%></li>
		<%
			String[] names = { "가군", "나군", "다군" };
		for (int i = 0; i < names.length; i++) {
		%>
		<li><%=i + 1%>:<%=names[i]%></li>
		<%
			}
		MyUser my = new MyUser();
		my.setAge(23);
		my.setName("사나");
		my.setLocation("서울");
		out.print(my);
		%>
	</ul>
</body>
</html>