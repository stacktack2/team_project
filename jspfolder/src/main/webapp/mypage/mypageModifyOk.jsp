<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 유효성검사는 프론트 백 둘다 해야함 -->
<!-- 회원가입시- null, undefined 체크 추가 -->
<!-- 정규표현식 추가 -->
<!-- 중복확인시 수정하면 재 확인하도록 작성 -->

<!-- post방식으로 받을땐 get방식 체크 -->
<!-- 인증이 필요한 페이지는 비인증 접근 제한 -->

<%
//	[get방식 차단]
	String method = request.getMethod();
	if(method.equals("GET")){
		response.sendRedirect("mypage.jsp");
	}
// 	[비인증 접근 제한]
// 	if(session.getAttribute("isAutFlag")){
	boolean isAutFlag = false;
	if(isAutFlag){
		response.sendRedirect("mypage.jsp")	;
	}
	
	/* Member member = session.getAttribute("member"); */
// 	int mno = member.getMno();
	int mno=7;

	
	
%>