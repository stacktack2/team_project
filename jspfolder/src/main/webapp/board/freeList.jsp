<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Vo.*" %>
<%@ page import="paging.PagingVO" %>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//(등록버튼)
	Member member = (Member)session.getAttribute("login");
	
	//[검색]
	String searchType = request.getParameter("searchType");
	String searchValue = request.getParameter("searchValue");
	
	//[페이징]
	String nowPageParam = request.getParameter("nowPage");
	
	int nowPage = 1;	
	if(nowPageParam !=null && !nowPageParam.equals("")){
		nowPage = Integer.parseInt(nowPageParam);
	}
	 
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://192.168.0.26:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	
	//[페이징]
	PagingVO pagingVO = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pass);
		
		//1. [페이징]
		String totalSql = "SELECT count(*) as cnt"
						+" FROM board b"
						+" INNER JOIN member m "
						+" ON b.mno = m.mno"
						+" WHERE btype = '자유게시판'";
		
		//[검색]
		if(searchType != null){
			if(searchType.equals("title")){
				totalSql += " AND btitle LIKE CONCAT('%',?,'%')";
			}else if(searchType.equals("writer")){
				totalSql += " AND m.mnickNm LIKE CONCAT('%',?,'%')";
			}
		}
		psmt = conn.prepareStatement(totalSql);
		
		//[검색]
		if(searchType != null 
			&& ( searchType.equals("title") || searchType.equals("writer"))){
			psmt.setString(1, searchValue);
		}
		
		rs = psmt.executeQuery();
		
		//[페이징] 
		int totalCnt =0;
		if(rs.next()){
			totalCnt = rs.getInt("cnt");
		}
		
		if(rs !=null)rs.close();
		if(psmt !=null)psmt.close();
		
		//[페이징]
		pagingVO = new PagingVO(nowPage, totalCnt, 10); 
		
		rs=null;
		
		//2. [게시글]
			String sql = "SELECT b.bno, btitle, b.mno, m.mnickNm,brdate ,bhit, btype"
					+" FROM board b "
					+" INNER JOIN member m "
					+" ON b.mno = m.mno"
					+" WHERE btype = '자유게시판'";
		
		//[검색]
		if(searchType != null){
			
			if(searchType.equals("title")){
				sql += " AND btitle LIKE CONCAT('%',?,'%')";
			}else if(searchType.equals("writer")){
				sql += " AND m.mnickNm LIKE CONCAT('%',?,'%')";
			}
			
					
		}
		
		//[인기순 최신순 정렬]
		if(searchType != null){
			if(searchType.equals("hit")){
				//최신순
				sql += " ORDER By bhit desc ";
			}else{
				//번호 역순
				sql += " ORDER BY bno desc ";
			}
		}
		
		//[페이징]
		sql +=" LIMIT ?, ?";
		
		psmt = conn.prepareStatement(sql);
		
		//[검색][페이징]
		if(searchType != null 
				&&(searchType.equals("title") 
						||searchType.equals("writer"))){
			psmt.setString(1,searchValue);
			psmt.setInt(2, pagingVO.getStart()-1);
			psmt.setInt(3, pagingVO.getPerPage());
		}else{
			psmt.setInt(1, pagingVO.getStart()-1);
			psmt.setInt(2, pagingVO.getPerPage());
		}
		
		rs = psmt.executeQuery();
	
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
			<form name ="frm1" action ="freeList.jsp" method="get" id="frm1">
				<select name="searchType" onchange="document.frm1.submit()">
					<option value="late" <%if(searchType != null 
						&& searchType.equals("late")) out.print("selected"); %>>최신순</option>
					<option value="hit"<%if(searchType != null 
						&& searchType.equals("hit")) out.print("selected"); %>>인기순</option>
				</select>
			</form>
			<form name ="frm2" action ="freeList.jsp" method="get" id="frm2">
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
			<% 
				while (rs.next()) { 
					int bno = rs.getInt("bno");
					String btype = rs.getString("btype");
					String btitle = rs.getString("btitle");
					String mnickNm = rs.getString("mnickNm");
					String brdate = rs.getString("brdate");
					int bhit = rs.getInt("bhit");
			%>
				<tr>
					<td><%=bno %></td>
					<td><%=btype %></td>
					<td><a href="view.jsp?bno=<%=bno%>"><%=btitle %></a></td>
					<td><%=mnickNm %></td>
					<td><%=brdate %></td>
					<td><%=bhit %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	<%
	if(member != null){
	%>
		<div class="btnDiv">
			<button class="writeBtn">글쓰기</button>
		</div>
	<%	
		}
	%>
		
	<div class="paging">
	<%	//페이징영역
		if(pagingVO.getStartPage()>pagingVO.getCntPage()){
	%>
			<a href="freeList.jsp?nowPage=<%=pagingVO.getStartPage()-1%>
				&searchType=<%=searchType%>
				&searchValue=<%=searchValue%>">이전</a>
	<%
		 }
		
		for(int i = pagingVO.getStartPage(); i<=pagingVO.getEndPage(); i++){
			 		
			if(nowPage == i){	
			 %>
			 	<b><%=i %></b>
			 <%
			 }else{
				 		
				 if(searchType != null){
				 %>
					<a href="freeList.jsp?nowPage=<%=i%>
						&searchType=<%=searchType%>
						&searchValue=<%=searchValue%>"><%=i %></a>
				 <%
				 }else{
				 %>
					<a href="freeList.jsp?nowPage=<%=i%>"><%=i  %></a>
				<%
				 }
			}
			 	
		}
		
		if(pagingVO.getEndPage()<pagingVO.getLastPage()){
		%>
			<a href="freeList.jsp?nowPage=<%=pagingVO.getEndPage()+1%>
				&searchType=<%=searchType%>
				&searchValue=<%=searchValue%>">다음</a>
		<%
		}
		%>
		 </div>
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (conn != null) conn.close();
			if (psmt != null) psmt.close();
			if (rs != null) rs.close();
		}
	%>