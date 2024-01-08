<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Vo.*" %>
<%@ page import="java.sql.*"%>
<%
	Member memberNav = (Member)session.getAttribute("login");
	
 	//[검색]
	String navValue = request.getParameter("navValue");
 
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<nav>
		<div id="welcome">
	<%
		if(memberNav != null){	//로그인이 돼있다면
	%>
			<p><%=memberNav.getMname() %>님, <span class="block">환영합니다.</span></p>
			<a href="<%=request.getContextPath()%>/mypage/mypage.jsp">마이페이지</a>
	<%		
		}else{
	%>
			<p>로그인 및 회원가입을 <span class="block">해주세요</span></p>
	<%	
		}
	%>	
		</div>
		<div class=searchMain>
			<form name="navFrm" action="allList.jsp" method="get">
				<input type="text" name="navValue"
					value="<%if(navValue!=null) out.print(navValue); %>"> 
				<button>검색</button>
			</form>
		</div>
		<ul class="menu">
			<li><a href="<%=request.getContextPath()%>/board/allList.jsp">전체글보기</a></li>
			<li><a href="<%=request.getContextPath()%>/board/noticeList.jsp">공지사항</a></li>
			<li><a href="<%=request.getContextPath()%>/board/hotList.jsp">인기글</a></li>
			<li><a href="<%=request.getContextPath()%>/board/freeList.jsp">자유게시판</a></li>
			<li>
				<a href="<%=request.getContextPath()%>/board/zoneList.jsp">캠핑지역 소개/리뷰</a>
				<ul class="submenu">
					<li><a href="#">서울</a></li>
					<li><a href="#">경기권</a></li>
					<li><a href="#">강원권</a></li>
					<li><a href="#">충청권</a></li>
					<li><a href="#">영남권</a></li>
					<li><a href="#">호남권</a></li>
					<li><a href="#">제주</a></li>					
				</ul>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/board/gearList.jsp">캠핑장비 소개/리뷰</a>
				<ul class="submenu">
					<li><a href="#">텐트/타프</a></li>
					<li><a href="#">침낭/매트</a></li>
					<li><a href="#">의자/테이블</a></li>
					<li><a href="#">화기/기타</a></li>
					<li><a href="#">차박</a></li>
				</ul>
			</li>
			<li><a href="<%=request.getContextPath()%>/board/attendList.jsp">출석체크</a></li>
			<li><a href="<%=request.getContextPath()%>/board/qnaList.jsp">Q&A</a></li>
		</ul>
		<div id="thecheat">더치트</div>
	</nav>
	
	
</body>
</html>