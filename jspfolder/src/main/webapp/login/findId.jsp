<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/login.css" type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/findId.js"></script>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
<!-- 로그인 헤더 -->
<%@ include file="/include/header.jsp" %>
<section>
    	<form name="frm" action="findIdOk.jsp" method="post">
    	<h2>아이디 찾기</h2><br>
    		<table>
<!-- 이름 -->
    			<tr>
    				<th align="right">이름</th>
    				<td>
    					<input type="text" name="mname">
    				</td>
    			</tr>
<!-- 생년월일 -->
    			<tr>
    				<th align="right">생년월일</th>
    				<td>
    					<input type="text" name="mbirth">
    				</td>
    			</tr>
<!-- 연락처 -->
    			<tr>
    				<th align="right">연락처</th>
    				<td>
						<input type="text" name="mphone1" maxlength="3" class="phone">-
						<input type="text" name="mphone2" maxlength="4" class="phone">-
						<input type="text" name="mphone3" maxlength="4" class="phone">
					</td>
    			</tr>
    		</table>
    		<button onclick="searchId()" id="searchId">아이디 조회하기</button>
    	</form>
<!-- 비밀번호 찾기 -->
    	<div>비밀번호를 찾으시나요?</div>
    	<div><a href="findPw.jsp">비밀번호 찾기</a></div>
	</section>
<%@ include file="/include/footer.jsp" %>
</body>
</html>