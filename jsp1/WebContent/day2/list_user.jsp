<%@page import="java.util.List"%>
<%@page import="day1.MyUser"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP1 프로젝트[2]</title>
</head>
<body>
	<!-- 데이터베이스에서 쿼리결과로 받아온 데이터 입니다. -->
	<%
		//MyUser 객체 리스트를 생성하고 데이터 저장.
	List<MyUser> list = new ArrayList<>();
	/* List : 인터페이스 , <> Generic Type(리스트의 요소들 데이터 타입 설정) 
	   ArrayList : List를 구현한 클래스
	*/

	list.add(new MyUser("홍길동", 23, "성남시"));
	list.add(new MyUser("도봉순", 34, "서울시 서초구"));
	list.add(new MyUser("박세리", 32, "서울시 강남구"));
	list.add(new MyUser("허재", 29, "안양시"));
	list.add(new MyUser("김길순", 41, "의왕시"));
	list.add(new MyUser("제임스", 54, "과천시"));
	%>
	<table style="margin: auto;">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>나이</th>
			<th>지역</th>
		</tr>
		<%
			// 자바코드 : 스크립트릿
		MyUser temp;
		for (int i = 0; i < list.size(); i++) {
			temp = list.get(i);
		%>
		<tr>
			<td><%=i + 1%></td>
			<td><%=temp.getName()%></td>
			<td><%=temp.getAge()%></td>
			<td><%=temp.getLocation()%></td>
		</tr>
		<%
			}
		%>


	</table>


</body>
</html>