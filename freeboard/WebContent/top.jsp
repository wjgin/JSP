<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav>
	<!-- 의미(semantic)태그, 동작을 담당하지는 않음-->
	<!-- 메뉴 구성은 ul, li 태그를 사용 -->
	<ul class="container">
		<li><a class="menu" href="list.do">Community</a></li>
		<li><a class="menu" href="gallery.do">Gallery</a></li>
		<li><a class="menu" href="">Kakao</a></li>
		<li><a class="menu" href="about.html">About</a></li>
		<li id="login"><c:if test="${sessionScope.user == null}">
				<a href="login.do">로그인</a>
				<!-- 		<a href="./login.do">로그인</a> 현재 경로에서 login.do -->
				<!-- 		<a href="/login.do">로그인</a> root context에서 login.do -->
			</c:if> <c:if test="${sessionScope.user != null}">
				<!-- 로그인 상태 -->
				<br> ${user.name}(${user.email})님 반갑습니다.<br>
				<a href="logout.do">로그아웃</a>
			</c:if></li>
	</ul>
</nav>