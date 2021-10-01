<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day9 : JSP 내장객체</title>
</head>
<body>
<h3>JSP 내장 (implicit) 객체</h3>
<ul>
	<li>스크립트릿 내에서만 사용</li>
	<li>변도 선언이 필요 x</li>
	<li>서블릿을 처리하는 컨테이너(tomcat)가 제공하고 처리도 합니다.</li>
	<ul>
		<li>request : HttpServeletRequest, 브라우저에 전달하는 요청 정보 저장</li>
		<li>response : HttpServeletResponse, 요청에 대한 응답 저장</li>
		<li>out : JspWriter, JSP 페이지 출력 스트림 객체</li>
		<li>pageContext : PageContext, 요청을 처리하는 JSP 페이지 정보 저장</li>
		<li>page : Object, 일반 자바객체(요청처리 웹 서블릿 객체가 아닙니다.)</li>
		<li>config : ServletConfig, 웹 어플리케이션 정보 저장</li>
		<li>session : HttpSession, 웹서버 브라우저 사이의 연결 정보를 저장</li>
		<li>application : ServletContext, 웹 애플리케이션 context 정보를 저장 </li>
	</ul>
	<li>Object타입, Attribute를 저장하는 객체  : request -> session -> applicaion -> pageContext
		<br>EL을 사용할때, 화살표 방향으로 저장된 애트리뷰트를 찾음</li>
	<li>※EL에서 사용할 수 있는 객체는 jsp 내장객체와는 다름</li>
</ul>
<%
// Exception 발생시 객체 저장 -> 오류 없으면 null -> null은 getMessage 불가
//String message = pageContext.getException().getMessage();
//out.print(message);
out.print(pageContext.getException());
%>
</body>
</html>