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
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<%@ include file="/include/mypageNav.jsp" %>
	<section>
		<div>내가 쓴 게시글</div>
			<form name="frm" action="mypage.jsp" method="get">
				<select>
					<option value="late">최신순</option>
					<option value="hit">인기순</option>
				</select>
				
				<input type="text" name="title" value="제목 검색">
				<button> 검색</button>
			</form>
		<table border="1">
			<thead>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일시</th>
				<th>조회수</th>				
			</thead>
			<tbody>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tbody>
		</table>
		
		
		<!-- 페이징 영역 -->
		 <div class="paging">
		 	
		 		<a href="">이전</a>
		 		<a href="">1</a>
		 		<a href="">다음</a>

		 </div>
		
		
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>