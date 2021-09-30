<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day9 session</title>
</head>
<body>
	<div>http 프로토콜은 stateless(상태정보 유지x), connectionless(비 연결) 웹 서버와
		브라우저 사이의 연결 정보를 저장하는 방법 사용 <br>
		-> requset를 통해서 브라우저에 세션ID가 부여, 그 값으로 구별<br>
		-> 톰캣은 이름 JSESSIONID 값을 만듦 <br>
		-> 세션 유효시간의 변경읜 서버의 web.xml에서 가능(모든 프로젝트에 적용)<br>
		-> 프로젝트 web.xml은 해당 프로젝트에만 적용 <br>
			:session-config로 유효시간 변경 가능(단위: 분) <br>
			:소스코드에서 메소드로 실행해서 변경 가능(단위: 초) <br>
	</div>

	<%
		String id = session.getId();	//JSESSIONID
	out.print(id);
	long start = session.getCreationTime(); // 세션이 생성된 시간 : 첫 요청시간
	out.print(start);						// 시간이 long일 경우, 1970년 1월 1일을 시작으로 ms 단위
	
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	out.print("<br>");
	
	out.print("세션 생성 시간 : " + df.format(start));
	
	out.print("<br>");
	long exp = session.getMaxInactiveInterval();
	out.print("세션 유효시간 : " + exp + "초, " + (exp/60) + "분");
	
	// session.setMaxInactiveInterval(60);	// 60초로 세션 유지시간 변경
	
	out.print("<br>");
	// 마지막 session 접근 시간
	long last = session.getLastAccessedTime();	// 같은ID로 요청한 최근 시간
	out.print("최근 접근 시간 : " + df.format(last));
	%>
</body>
</html>