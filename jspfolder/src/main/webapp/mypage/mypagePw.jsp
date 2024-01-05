<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/base.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mypage.css" type="text/css" rel="stylesheet">
<style>
	
	section{
		 margin: 0 auto;
	}

</style>
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<section>
		<form name="frm">
			<input type="text" id="mypagePwinput" placeholder="비밀번호를 입력하세요.">
			<button id="mypagePwbutton">확인</button>
		</form>
	</section>
<%@ include file="/include/footer.jsp" %>
</body>
</html>