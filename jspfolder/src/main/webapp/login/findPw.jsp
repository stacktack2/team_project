<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/login.css" type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
<!-- 로그인 헤더 -->
<%@ include file="/include/header.jsp" %>
<section>
    	<form name="frm" action="findPwOk.jsp" method="post">
    	<h2>비밀번호 찾기</h2><br>
    		<table>
<!-- 아이디 -->
    			<tr>
    				<th align="right">아이디</th>
    				<td>
    					<input type="text" name="mid" id="id">
    				</td>
    			</tr>
<!-- 이름 -->
    			<tr>
    				<th align="right">이름</th>
    				<td>
    					<input type="text" name="mname" id="name">
    				</td>
    			</tr>
<!-- 생년월일 -->
    			<tr>
    				<th align="right">생년월일</th>
    				<td>
    					<input type="text" name="mbirth" id="birth">
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
    		<button>제출하기</button>
    	</form>
<!-- 비밀번호 찾기 -->
    	<div>로그인 하시겠어요?</div>
    	<div><a href="login.jsp">로그인</a></div>
	</section>
<%@ include file="/include/footer.jsp" %>
</body>
</html>