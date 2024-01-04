<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="tableVo.Member" %>
<%@ page import="paging.PagingVO" %>
<%
	/* Member member = (Member)session.getAttribute("member"); */
/* Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;

String url = "jdbc:mysql://192.168.0.26:3306/campingweb";
String user = "cteam";
String pass ="ezen"; */

/* PagingVO pagingVO = null;
int nowPage = 1; */
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/base.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mypage.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<%@ include file="/include/mypageNav.jsp" %>
	<section>
		<div id="boardname">내가 쓴 게시글</div>
			<form name="frm" action="mypage.jsp" method="get">
				<select id="select">
					<option value="late">최신순</option>
					<option value="hit">인기순</option>
				</select>
				<div id="search">
					<input type="text" id="title" name="title">
					<button id="button"> 검색</button>
				</div>
			</form>
		<table id="mypagetable">
			<thead id="mypagethead">
				<th id="td1">번호</th>
				<th id="td2">카테고리</th>
				<th id="td3">제목</th>
				<th id="td4">작성자</th>
				<th id="td5">작성일시</th>
				<th id="td6">조회수</th>				
			</thead>
			<tbody id="mypagetbody">
				<td id="td1">1</td>
				<td id="td2">2</td>
				<td id="td3"></td>
				<td id="td4"></td>
				<td id="td5"></td>
				<td id="td6"></td>
			</tbody>
		</table>
		
		
		<!-- 페이징 영역 -->
		 <div id="mainpaging">
		 	
		 		<span class="paging"><a href="">이전</a></span>
		 		<span class="pagingnum"><a href="">1</a></span>
		 		<span class="paging"><a href="">다음</a></span>


		 </div>
		
		
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>