<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String searchType = request.getParameter("searchType");
	String searchValue = request.getParameter("searchValue");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<link href="<%=request.getContextPath()%>/css/base.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/list.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<%@ include file="/include/nav.jsp" %>
	<section>
		<h2>자유게시판</h2>
		<div class="frms">
			<%//검색의 action: 나 자신(도로 나 자신에게 옴)%>
			<form name ="frm1" action ="freelist.jsp" method="get" id="frm1">
				<select name="searchType">
					<option value="title" <%if(searchType != null 
						&& searchType.equals("late")) out.print("selected"); %>>최신순</option>
					<option value="writer"<%if(searchType != null 
						&& searchType.equals("hit")) out.print("selected"); %>>인기순</option>
				</select>
			</form>
			<form name ="frm2" action ="freelist.jsp" method="get" id="frm2">
				<select name="searchType">
					<option value="title" <%if(searchType != null 
						&& searchType.equals("title")) out.print("selected"); %>>제목</option>
					<option value="writer"<%if(searchType != null 
						&& searchType.equals("writer")) out.print("selected"); %>>작성자</option>
				</select>
				<input type="text" name="searchValue" 
				  value="<%if(searchValue!=null) out.print(searchValue); %>">
				<button class="searchBtn">검색</button>
			</form>
		</div>
		<table class="listTable">
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일시</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>자유게시판</td>
					<td>제목입니다</td>
					<td>닉네임</td>
					<td>2024-01-05</td>
					<td>10</td>
				</tr>
			</tbody>
		</table>
		<div class="btnDiv">
			<button class="writeBtn">글쓰기</button>
		</div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>