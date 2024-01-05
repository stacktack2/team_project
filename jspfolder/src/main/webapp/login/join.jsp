<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/join.css" type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/join.js"></script>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
<%@ include file="/include/joinHeader.jsp" %>
	<section>
<!-- 회원가입 폼 -->
		<article>
			<div id="formDiv">
			<form name="frm" action="joinOk.jsp" method="post">
				<table>
<!-- 아이디 -->
					<tr>
						<th align="right">아이디: </th>
						<td>
							<input type="text" name="mid" onblur="resetFn()">
							<button type="button" onclick="checkIdFn()">중복확인</button>
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="midTd"></a></td>
					</tr>
<!-- 비밀번호 -->
					<tr>
						<th align="right">비밀번호: </th>
						<td><input type="password" name="mpw"></td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="mpwTd"></a></td>
					</tr>
<!-- 비밀번호 확인 -->
					<tr>
						<th align="right">비밀번호 확인: </th>
						<td><input type="password" name="mpwRe"></td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="mpwReTd"></a></td>
					</tr>
<!-- 닉네임 -->
					<tr>
						<th align="right">닉네임: </th>
						<td>
							<input type="text" name="mnickNm" onblur="resetNickFn()">
							<button type="button" onclick="checkNickNm()">중복확인</button>
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="mnickNmTd"></a></td>
					</tr>
<!-- 사용자 이름 -->
					<tr>
						<th align="right">이름: </th>
						<td><input type="text" name="mname"></td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="mnameTd"></a></td>
					</tr>
<!-- 생년월일 -->
					<tr>
						<th align="right">생년월일: </th>
						<td><input type="text" name="mbirth" maxlength="8"></td>
					</tr>
					<tr class="blur">
    					<td colspan="2" id="mbirthTd"></td>
					</tr>
<!-- 연락처 -->
					<tr>
						<th align="right">연락처: </th>
						<td>
							<input type="text" name="mphone1" maxlength="3" class="phone">-
							<input type="text" name="mphone2" maxlength="4" class="phone">-
							<input type="text" name="mphone3" maxlength="4" class="phone">
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2" align="right"><a id="mphoneTd"></a></td>
					</tr>
<!-- 성별 -->
					<tr>
						<th align="right">성별: </th>
						<td>
							<input type="radio" name="mgender" value="M">남
							<input type="radio" name="mgender" value="W">여
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="mgenderTd"></a></td>
					</tr>
<!-- 이메일 -->
					<tr>
						<th align="right">이메일: </th>
						<td><input type="email" name="memail"></td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="memailTd"></a></td>
					</tr>
				</table>
<!-- 회원가입 버튼 -->
				<button onclick="clickJoin();return false;" id="joinButton">가입하기</button>
			</form>
			</div>
		</article>
	</section>
<%@ include file="/include/footer.jsp" %>
</body>
</html>