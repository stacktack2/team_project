<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/join.css" type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js">
/* 모든 value값을 입력해야 제출하기가 가능한 script */
	function clickJoin(){ // 회원가입 미입력 값 있을 시 false;
		let mid = document.frm.mid.value;
		let mpw = document.frm.mpw.value;
		let mpwRe = document.frm.mpwRe.value;
		let mnickNm = document.frm.mnickNm.value;
		let mname = document.frm.mname.value;
		let mbirth = document.frm.mbirth.value;
		let mphone = document.frm.mphone.value;
		let mgender = document.frm.mgender.value;
		let memail = document.frm.memail.value;
		
		let check = true;
		/* 미입력칸 빨간줄 처리 */
		if(mid == ""){
			check = false;
			document.frm.mid.style.border="1px solid red";
		}else{
			check = true;
			document.frm.mid.removeAttribute("style");
		}
		if(mpw == ""){
			check = false;
			document.frm.mid.style.border="1px solid red";
		}else{
			check = true;
			document.frm.mid.removeAttribute("style");
		}
		if(mpwRe == ""){
			check = false;
			document.frm.mid.style.border="1px solid red";
		}else{
			check = true;
			document.frm.mid.removeAttribute("style");
		}
		if(mnickNm == ""){
			check = false;
			document.frm.mid.style.border="1px solid red";
		}else{
			check = true;
			document.frm.mid.removeAttribute("style");
		}
		if(mname == ""){
			check = false;
			document.frm.mid.style.border="1px solid red";
		}else{
			check = true;
			document.frm.mid.removeAttribute("style");
		}
		if(mbirth == ""){
			check = false;
			document.frm.mid.style.border="1px solid red";
		}else{
			check = true;
			document.frm.mid.removeAttribute("style");
		}
		if(mphone == ""){
			check = false;
			document.frm.mid.style.border="1px solid red";
		}else{
			check = true;
			document.frm.mid.removeAttribute("style");
		}
		if(mgender == ""){
			check = false;
			document.frm.mid.style.border="1px solid red";
		}else{
			check = true;
			document.frm.mid.removeAttribute("style");
		}
		if(memail == ""){
			check = false;
			document.frm.mid.style.border="1px solid red";
		}else{
			check = true;
			document.frm.mid.removeAttribute("style");
		}
	}
</script>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
<%@ include file="/include/joinSemantic.jsp" %>
	<section>
<!-- 회원가입 폼 -->
		<article>
			<h2>회원가입</h2>
			<form name="frm" action="joinOk.jsp" method="post">
				<table>
<!-- 아이디 -->
					<tr>
						<th align="right">아이디: </th>
						<td>
							<input type="text" name="mid">
							<button type="button">중복확인</button>
						</td>
					</tr>
<!-- 비밀번호 -->
					<tr>
						<th align="right">비밀번호: </th>
						<td><input type="password" name="mpw"></td>
					</tr>
<!-- 비밀번호 확인 -->
					<tr>
						<th align="right">비밀번호 확인: </th>
						<td><input type="password" name="mpwRe"></td>
					</tr>
<!-- 닉네임 -->
					<tr>
						<th align="right">닉네임: </th>
						<td><input type="text" name="mnickNm"></td>
					</tr>
<!-- 사용자 이름 -->
					<tr>
						<th align="right">이름: </th>
						<td><input type="text" name="mname"></td>
					</tr>
<!-- 생년월일 -->
					<tr>
						<th align="right">생년월일: </th>
						<td><input type="text" name="mbirth" maxlength="8"></td>
					</tr>
<!-- 연락처 -->
					<tr>
						<th align="right">연락처: </th>
						<td>
							<input type="text" name="mphone" maxlength="3" class="phone">-
							<input type="text" name="mphone" maxlength="4" class="phone">-
							<input type="text" name="mphone" maxlength="4" class="phone">
						</td>
					</tr>
<!-- 성별 -->
					<tr>
						<th align="right">성별: </th>
						<td>
							<input type="radio" name="mgender" value="M">남
							<input type="radio" name="mgender" value="W">여
						</td>
					</tr>
<!-- 이메일 -->
					<tr>
						<th align="right">이메일: </th>
						<td><input type="email" name="memail"></td>
					</tr>
				</table>
<!-- 회원가입 버튼 -->
				<button onclick="clickJoin();return false;">제출하기</button>
			</form>
		</article>
	</section>
</body>
</html>