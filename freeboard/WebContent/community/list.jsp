<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리 커뮤니티</title>
<link rel="stylesheet" href="css/boardlist.css?v=3">
<link rel="stylesheet" href="css/flexbox2.css?v=3">
<!-- url기준 -->
</head>
<body>
	<%@ include file="../top.jsp"%>
	<section>
		<h3>동아리 커뮤니티</h3>
		<hr>
		<div style="margin: auto;">
			<ul id="main">
				<li>
					<ul class="row">
						<li><b>번호</b></li>
						<li><b>제목</b></li>
						<li><b>작성자</b></li>
						<li><b>조회수</b></li>
						<li><b>작성일</b></li>
					</ul>
				</li>
				<c:forEach var="vo" items="${list}">
					<!-- vo가 Freeboard타입  blists.getList() 실행-->
					<li><c:set var="pno" value="${pageDto.currentPage}" />
						<ul class="row">
							<li>${vo.idx }</li>
							<li><a href="detail.do?idx=${vo.idx}&page=${pno}"
								class="title">${vo.subject}</a> ... <span
								style="color: orange; font-size: 80%;">(${vo.commentCount})</span>
							</li>
							<li>${vo.name }</li>
							<li>${vo.readCount}</li>
							<li><fmt:formatDate value="${vo.wdate}" pattern="yyyy-MM-dd" /></li>
						</ul></li>
				</c:forEach>
			</ul>
			<div style="margin: auto;">
				Go!&nbsp;&nbsp;<a class="button" href="insert.do">글쓰기</a>&nbsp;&nbsp;
				<a class="button" href="${pageContext.request.contextPath}">홈</a>&nbsp;&nbsp;작성글
				총 개수 :
				<c:out value="${pageDto.totalCount}"></c:out>
			</div>
			<!-- 글 목록 페이지 처리 : pagination-->
			<div style="text-align: center;">
				<hr>
				<!-- 요청 url은 현재와 같고 parameter만 변경 -->
				<c:if test="${pageDto.startPage != 1 }">
					<a class="pagenum" href="?page=1">&lt;&lt;</a>
					<a class="pagenum" href="?page=${pageDto.startPage-1}">&lt;</a>
					<!-- 현재 페이지 10페이지 앞 -->
				</c:if>
				<c:forEach var="i" begin="${pageDto.startPage }"
					end="${pageDto.endPage }">
					<a class="pagenum"
						<c:if test = "${pageDto.currentPage == i}">current</c:if>
						href="?page=${i}">${i}</a>
				</c:forEach>
				<c:if test="${pageDto.endPage != pageDto.totalPage}">
					<a class="pagenum" href="?page=${pageDto.endPage+1}">&gt;</a>
					<a class="pagenum" href="?page=${pageDto.totalPage}">&gt;&gt;</a>
				</c:if>
			</div>
			<!-- request.contextPath: request.getContextPath 메소드와 동일 결과 
	listAction에서 pageContext 객체를 사용해서 listView.jsp로 요청이 전달 되었기에
	pageContext.request로 함-->
		</div>
	</section>
	<%@ include file="../bottom.jsp"%>
</body>
</html>








