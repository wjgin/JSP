<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP1 프로젝트[3]</title>
</head>
<body>
	<!-- JSP 내장 객체 (implicit) : 선언하지 않고 사용하는 객체
	1) out(JspWritter 클래스타입) 
	2) request(HttpServletRequest): 메소드 값으로 알아낼 수 있는 정보들을 확인
		: 사용자가 요청을 보내는 객체 
	-->
	
	<!-- request 객체는 서버의 입장에서 클라이언트가 보낸 정보 -->
	<h3>request(HttpServletRequest) 객체의 정보</h3>
	<ul>
		<!-- U통합R자원L위치(주소) -->
		<li>요청 URL : <%=request.getRequestURL()%></li>
		<!-- U통합R자원I식별자 -->
		<li>요청 URI : <%=request.getRequestURI()%></li>
		<li>서버IP : <%=request.getLocalAddr()%>, <%=request.getLocalName() %></li>
		<li>서버 port : <%=request.getLocalPort()%></li>
		<!-- IPv6 (64바이트, 8자리) -->
		<li>클라이언트 IP : <%=request.getRemoteAddr()%></li>
		<!-- 프로젝트 이름 -->
		<li>컨텍스트(context) : <%=request.getContextPath()%></li>
		<% request.setCharacterEncoding("UTF-8"); %>
		<li>문자인코딩 형식 : <%=request.getCharacterEncoding()%></li>
		<li></li>
		<li></li>
		<!-- 출력 IPv4 설정 : Run -> Run Configurations -> tomcat -> Arguments -> VM Arg 에 입력
                        -Djava.net.preferIPv4Stack=true -->
	</ul>

</body>
</html>