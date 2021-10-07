<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>day7 글 상세보기</title>
<link rel="stylesheet" href="css/freeboard.css?v=3">
<link rel="stylesheet" href="css/flexbox2.css?v=3">
</head>
<body>
	<%@ include file="../top.jsp"%>
	<section>
		<!-- 문서가 생성될때 실행 -->
		<h3>동아리 커뮤니티</h3>
		<hr>
		<div style="width: 80%; margin: auto;">
			<ul id="main">
				<li>
					<ul class="row">
						<li>제목</li>
						<li>${bean.subject }</li>
						<li>조회수</li>
						<li>${bean.readCount}</li>
					</ul>
				</li>
				<li>
					<ul class="row">
						<li>작성자</li>
						<li>${bean.name}<span
							style="font-size: 70%; padding-left: 30px;">(${bean.ip })</span></li>
						<li>작성날짜</li>
						<li><fmt:formatDate value="${bean.wdate }" type="both" /> <!-- pattern= "yyyy-MM-dd HH:mm:ss, type= date, time, both -->
						</li>
					</ul>
				</li>
				<li id="content">
					<ul>
						<li>내용</li>
						<!-- textarea에 입력한 줄바꿈 \n 은 db에도 \n으로 저장됨
					브라우저의 줄바꿈은 <br> 태그 
					=> 1) <pre>태그 사용으로 \n 줄바꿈으로 인식
					=> 2) \n을 <br>로 대치
					-->
						<li><pre>${bean.content}</pre></li>
					</ul>
				</li>
			</ul>
			<div style="text-align: center; margin-bottom: 10px;">
				<a class="button" href="update.do?idx=${bean.idx}&page=${page}">수정</a>
				<a class="button" onclick='deleteSet()'>삭제</a> <a class="button"
					href="list.do?page=${page}">목록</a>
			</div>
			<!-- 메인글 출력 끝 -->

			<!-- 댓글 시작 -->
			<form action="comment.do?page=${page}" method="post" name="frmCmt">
				<input type="hidden" name="mref" value="${bean.idx}">
				<hr class="line">
				<div>
					<span>댓글</span> <span>${bean.commentCount}</span> <span></span>
				</div>
				<hr class="line">
				<ul id="main">
					<li>
						<ul class="row">
							<li>작성자</li>
							<li><input type="text" name="name" class="input"></li>
							<li>글비밀번호</li>
							<li><input type="password" name="password" class="input"></li>
						</ul>
					</li>
					<li>
						<ul class="row-2">
							<li><textarea rows="5" cols="80" name="content"
									style="resize: none;" placeholder="댓글을 작성하세요." class="input"
									required></textarea></li>
							<li><input type="submit" value="저장" class="button small">
								<input type="reset" value="취소" class="button small"></li>
						</ul>
					</li>
					<!-- 작성된 댓글 영역 -->
					<c:forEach var="cmt" items="${cmtlist }">
						<li>
							<ul>
								<li>${cmt.name }</li>
								<li>${cmt.ip }</li>
								<li>${cmt.wdate }</li>
								<!-- 댓글삭제 : 글 비밀번호(생략), 댓글 idx, 글 idx -->
								<li><a
									href="javascript:deleteCmt('${cmt.idx}','${bean.idx}', '${page})">삭제</a></li>
							</ul>
						</li>
						<li><pre>${cmt.content }</pre></li>
					</c:forEach>

				</ul>
			</form>
		</div>

		<!-- modal : alert,confirm 그리고 추가적인 정보를 받을 때 사용자가 만드는 입력 상자...-->
		<div id="myModal" class="modal">
			<!-- Modal content : 모달 입력창-->
			<div class="modal-content">
				<span class="close">&times;</span><br>
				<div style="padding: 0px 20px;">
					<b>글비밀번호</b><br> <br>
					<form action="delete.do" method="post" name="frmPassword"
						onsubmit="return deleteOk()">
						<input type="hidden" name="page" value="${page}"> <input
							type="hidden" name="idx" value="${bean.idx }"> <input
							type="password" name="password" size="10"> <input
							type="submit" value="확인" style="padding: 5px 20px;"> <span
							style="color: red;" id="err"></span>

					</form>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		var modal = document.getElementById('myModal');
		var span = document.getElementsByClassName("close")[0];
		span.onclick = function() {
			modal.style.display = "none";
			document.getElementById('err').innerHTML = "";
		}

		// 삭제 비밀번호 입력 창 보이기
		function deleteSet() {
			document.getElementById("myModal").style.display = 'block';
		}

		// 삭제 확인 함수
		function deleteOk() {
			const yn = confirm('글을 삭제하시겠습니까?');
			if (yn) {
				// 비밀번호 입력 여부 확인
				if (document.frmPassword.password.value == "") {
					document.getElementById('err').innerHTML = "비밀번호를 입력하세요.";
					return false;
				} else {
					return true;
				}
			} else {
				modal.style.display = "none";
				return false;
			}
		}

		// 댓글 삭제
		function deleteCmt(cmtidx, idx, page) {
			const yn = confirm('댓글을 삭제하시겠습니까?');
			if (yn) {
				location.href = 'commentAction.jsp?del=&cmtidx=' + cmtidx
						+ '&idx=' + idx + '&page=' + page;
			} else {
				alert('댓글 삭제 취소합니다.');
			}
		}
	</script>
	<%@ include file="../bottom.jsp"%>
</body>
</html>









