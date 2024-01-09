<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	페이지 인코딩
	request.setCharacterEncoding("UTF-8");

//	login 사용자 정보 세션
	Member member = (Member)session.getAttribute("login");

//	검색
	String searchAlign = request.getParameter("searchAlign");
	String searchType = request.getParameter("searchType");
	String searchValue = request.getParameter("searchValue");

//	화면 초기값 고정
	if(searchAlign == null){
		searchAlign = "late";
	}

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,pass);
		
		String sql = " SELECT b.bno, btitle, b.mno, m.mickNm, brdate, bhit, btype"
				   + " , (select count(*) from reply r where r.bno = b.bno) as rcnt"
				   + " FROM board b"
				   + " INNER JOIN member m"
				   + " ON b.mno = m.mno"
				   + " WHERE btype = '캠핑지역'";
		
//	option value별 게시글 정렬
		if(searchAlign != null){
			if(searchAlign.equals("late")){
				sql += " order by brdate desc ";
			}else if(searchAlign.equals("hit")){
				sql += " order by bhit desc ";
			}
		}
		
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑지역 게시판</title>
<link href="<%=request.getContextPath()%>/css/base.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mypage.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@ include file="/include/header.jsp" %>
	<div class="frms">
<%@ include file="/include/nav.jsp" %>
	<section>
<!-- 게시판페이지 이름 -->
		<div>캠핑지역 게시판</div>
<!-- 게시글 정렬폼 -->
		<form name="frm1" action="zoneList.jsp" method="get" id="frm1">
<%-- 게시글 정렬종류 --%>
			<select name="searchAlign" id="select">
				<option value="late">최신순</option>
				<option value="hit">인기순</option>
				<option value="Seoul">서울</option>
				<option value="GG">경기권</option>
				<option value="GW">강원권</option>
				<option value="CC">충청권</option>
				<option value="YN">영남권</option>
				<option value="HN">호남권</option>
				<option value="JJ">제주</option>
			</select>
		</form>
<!-- 게시글 검색폼 -->
		<form name="frm2" action="zoneList.jsp" method="get" id="frm2">
			<select name="searchType" id="select">
				<option value="title">제목</option>
				<option value="writer">작성자</option>
			</select>
<!-- 게시글 검색칸 -->
			<input type="text" name="searchValue">
			<button>검색</button>
		</form>
<!-- 게시글 리스트 -->
		<table>
<!-- 테이블 헤드 -->
		<thead>
			<tr>
				<th id="td1">번호</th>
				<th id="td2">카테고리</th>
				<th id="th3">제목</th>
				<th id="td4">작성자</th>
				<th id="td5">작성일시</th>
				<th id="td6">조회수</th>	
			</tr>
		</thead>
<!-- 테이블 바디 -->
		<tbody>
		</tbody>
		</table>
	</section>
	</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
%>