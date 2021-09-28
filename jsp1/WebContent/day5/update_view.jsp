<%@page import="day3.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day4 회원정보 수정</title>
<link rel="stylesheet" href="../css/member.css">
<script src="https://kit.fontawesome.com/a9b46edd75.js"
	crossorigin="anonymous"></script>
</head>
<c:if test="${alert!=null}">
	<script type="text/javascript">
	alert('고객정보가 수정되었습니다.')
	</script>
</c:if>

<body>
	<script>
        function validCheck() {
            const frm = document.frmReg;
            // 1. 패스워드: 8자리 이상
            if (frm.password.value.length < 8) {
                alert('패스워드는 8글자 이상 입니다.');
                frm.password.focus(); // 커서를 이동
                return false;
            }
            // 2. 나이: 태그 min, max 무시 -> 20 ~ 70
            if (frm.age.value < 20 || frm.age.value > 70) {
                alert('나이는 20~70 사이 입니다.');
                return false;
            }
            // 3. 취미 체크 확인
            for (let i = 0; i < frm.hobby.length; i++) {
                // hobby 배열에 하나라도 체크되면 true 리턴
                if (frm.hobby[i].checked) 
                    return true;
            }
                alert('취미를 하나 이상 선택')
                return false
        }
        
        function deleteOk() {
        	const yn = confirm("고객 정보를 삭제 하시겠습니까?");
        	if(yn) {
        		alert(`고객 idx ${cus.idx}를 삭제합니다.`)
        		// 요청 url 이동
        		location.href = `delete.jsp?idx=${cus.idx}`;
        	} else {
        		alert("취소했습니다.")
        	}
        }
        
        
    </script>
	<div style="width: 70%; margin: auto;">
		<div>
			<a href="#" class="navbar__hamburger"> <i class="fas fa-bars"></i>
			</a>
			<h3>회원정보 수정</h3>
		</div>

		<form action="update_save.jsp" method="post" name="frmReg"
			onsubmit="return validCheck()">
			<!-- 브라우저에 출력은 안되고 필요한 파라미터를 전달할 때, hidden 타입 -->
			<input type="hidden" name="idx" value="${cus.idx }">
			<table style="width: 100%; margin: auto;">
				<tr>
					<!-- 수정불가 : readonly -->
					<td class="col1">이름</td>
					<td><input type="text" name="name" placeholder="이름을 입력하세요."
						value=${cus.name } readonly></td>
				</tr>
				<tr>
					<td class="col1">이메일</td>
					<td><input type="email" name="email" value=${cus.email }></td>
				</tr>
				<tr>
					<td class="col1">나이</td>
					<td><input type="number" name="age" min="10" max="99"
						value=${cus.age } readonly></td>
				</tr>
				<tr>
					<td class="col1">주소</td>
					<td><select id=addr_select name="address" required>
							<option value="서울">서울</option>
							<option value="인천">인천</option>
							<option value="대전">대전</option>
							<option value="광주">광주</option>
							<option value="부산">부산</option>
							<option value="기타" selected>기타</option>
					</select> <span id="addr_id" style="display: none"> <input
							type="text" name="addr_etc" disabled="disabled"
							value=${cus.address }  placeholder="기타 지역을 입력하세요.">
					</span></td>
				</tr>
				<tr>
					<td class="col1">성별</td>
					<td>${cus.gender } </td>
				</tr>
				<tr>
					<td class="col1">취미</td>
					<td>${cus.hobby } </td>
				</tr>
				<tr>

					<td colspan="2">
						<div class="button">
							<input type="submit" value="가입하기"> <input type="button"
								value="삭제하기" onclick="deleteOk()"> <input type="reset"
								value="다시쓰기">
						</div>
					</td>
				</tr>

			</table>
		</form>
	</div>
	<script type="text/javascript">
	document.getElementById("addr_select").addEventListener("change",function(){
		if(this.value=="기타"){
			document.getElementById("addr_id").style.display="inline-block";
			document.frmReg.addr_etc.disabled=false;
		}else {
			document.getElementById("addr_id").style.display="none";
			document.frmReg.addr_etc.disabled=true;
		}
		
	});
	
	// 표현식으로 자바의 변수값 가져오기 (get메소드를 통해서 가져옴)
	document.querySelectorAll("option").forEach((item) =>{
		if(item.value === ${cus.address}){ 
			item.selected = true;
		}
	});
	</script>
</body>

</html>