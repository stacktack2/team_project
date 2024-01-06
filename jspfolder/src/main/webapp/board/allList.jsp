<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Vo.*" %>
<%@ page import="paging.PagingVO" %>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//(등록버튼)
// 	Member member = (Member)session.getAttribute("member");
	int mno =7;
	
	//[검색]
	String searchAlign = request.getParameter("searchAlign");
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
	
	String url = "jdbc:mysql://localhost:3306/sys";
	String user = "root";
	String pass ="1234";
	
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
						+"  WHERE (btype = '자유게시판' or btype='캠핑지역' or btype='캠핑장비' or btype='공지사항') ";
		
		//[검색]
		if(searchType != null){
			if(searchType.equals("title")){
				totalSql += " and btitle like concat('%',?,'%')";				
			}else if(searchType.equals("writer")){
				totalSql += " and m.mnickNm like concat('%',?,'%')";								
			}
		}
		
		psmt = conn.prepareStatement(totalSql);
		if(searchType != null && (searchType.equals("title") || searchType.equals("writer"))){
			psmt.setString(1,searchValue);
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
			
		String sql = " select b.*, m.mnickNm , (select count(*) from reply r where r.bno = b.bno) as rcnt "
				 +" from board b inner join member m on b.mno = m.mno "
				 +" WHERE (btype = '자유게시판' or btype='캠핑지역' or btype='캠핑장비' or btype='공지사항') ";
				
				
		//[검색]
		if(searchType != null){
			if(searchType.equals("title")){
				sql += " and btitle like concat('%',?,'%')";				
			}else if(searchType.equals("writer")){
				sql += " and m.mnickNm like concat('%',?,'%')";								
			}
		}
		
		if(searchAlign != null){
			if(searchAlign.equals("late")){
				sql += " order by brdate desc ";
			}else if(searchAlign.equals("hit")){
				sql += " order by bhit desc ";
			}
		}
		
		sql += " limit ?,? ";
		
		
		
		
 		psmt = conn.prepareStatement(sql);
		
		if(searchType != null && (searchType.equals("title") || searchType.equals("writer"))){
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
<title>전체게시판 목록</title>
<link href="<%=request.getContextPath()%>/css/base.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mypage.css" type="text/css" rel="stylesheet">
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<div class="container">
	<%@ include file="/include/nav.jsp" %>
	<section>
		<div id="boardname">전체게시판</div>
		
			<form name ="frm1" action ="allList.jsp" method="get" id="frm1">
				<select name="searchAlign" onchange="document.frm1.submit()" id="select">
					<option value="late" <%if(searchAlign != null 
						&& searchAlign.equals("late")) out.print("selected"); %>>최신순</option>
					<option value="hit"<%if(searchAlign != null 
						&& searchAlign.equals("hit")) out.print("selected"); %>>인기순</option>
				</select>
			</form>
			
			
			<form name ="frm2" action ="allList.jsp" method="get" id="frm2">
				<select name="searchType" id="select">
					<option value="title" <%if(searchType != null 
						&& searchType.equals("title")) out.print("selected"); %>>제목</option>
					<option value="writer"<%if(searchType != null 
						&& searchType.equals("writer")) out.print("selected"); %>>작성자</option>
				</select>
				<input type="text"  id="title" name="searchValue" 
				  value="<%if(searchValue!=null) out.print(searchValue); %>">
				<input type="hidden" name="searchAlign" value="<%if(searchAlign!=null) out.print(searchAlign); %>">
				<button id="button">검색</button>
			</form>
		
		
		<table id="mypagetable">
			<thead id="mypagethead">
				<tr>
					<th id="td1">번호</th>
					<th id="td2">카테고리</th>
					<th id="th3">제목</th>
					<th id="td4">작성자</th>
					<th id="td5">작성일시</th>
					<th id="td6">조회수</th>				
				</tr>
			</thead>
			
			<tbody id="mypagetbody">
				<%
					if(!rs.next()){
				%>		
						
						<tr> <td id="td" colspan="6"> 아무것도 검색되지 않았습니다. </td> </tr>
				<%
					}else{
				
						int num =0;
						while(true){
							
							%>
							<tr id ="tr">
								<td id="td1"><%=pagingVO.getStart()+num %></td>
								<td id="td2"><%=rs.getString("btype") %></td>
								<td id="td3"><%=rs.getString("btitle") %><span id="replyspan">[<%=rs.getInt("rcnt") %>]</span></td>
								<td id="td4"><%=rs.getString("mnickNm") %></td>
								<td id="td5"><%=rs.getString("brdate") %></td>
								<td id="td6"><%=rs.getInt("bhit") %></td>
							</tr>
							<%
							if(!rs.next()){
								break;
							}
							num++;
						}
					}
				%> 
				
			</tbody>
		</table>
		
		
		<!-- 페이징 영역 -->
		 
	
		
	<div class="mainpaging">
	<%	//페이징영역
		if(pagingVO.getStartPage()>pagingVO.getCntPage()){
	%>
			<span class="paging">
		 		<a href="allList.jsp?nowPage=<%=pagingVO.getStartPage()-1%>
				<%if(searchAlign!=null && !searchAlign.equals("")) out.print("&searchAlign="+searchAlign);
						if(searchType!=null && !searchAlign.equals("")) out.print("&searchType="+searchType);
						if(searchValue!=null && !searchAlign.equals("")) out.print("&searchValue="+searchValue);
						%> ">이전</a>
			</span>
	<%
		 }
		
		for(int i = pagingVO.getStartPage(); i<=pagingVO.getEndPage(); i++){
			 		
			if(nowPage == i){	
			 %>
			 	<b><%=i %></b>
			 <%
			 }else{
				 		
				 if(searchAlign != null){
				 %>
					<span class="pagingnum"><a href="allList.jsp?nowPage=<%=i%>
						<%if(searchAlign!=null && !searchAlign.equals("")) out.print("&searchAlign="+searchAlign);
						if(searchType!=null && !searchAlign.equals("")) out.print("&searchType="+searchType);
						if(searchValue!=null && !searchAlign.equals("")) out.print("&searchValue="+searchValue);
						%> "> <%=i %></a></span>
				 <%
				 }else{
				 %>
					<span class="pagingnum"><a href="allList.jsp?nowPage=<%=i%>"><%=i  %></a></span>
				<%
				 }
			}
			 	
		}
		
		if(pagingVO.getEndPage()<pagingVO.getLastPage()){
		%>
			<span class="paging">
			<a href="allList.jsp?nowPage=<%=pagingVO.getEndPage()+1%>
				<%if(searchAlign!=null && !searchAlign.equals("")) out.print("&searchAlign="+searchAlign);
						if(searchType!=null && !searchAlign.equals("")) out.print("&searchType="+searchType);
						if(searchValue!=null && !searchAlign.equals("")) out.print("&searchValue="+searchValue);
						%> ">다음</a>
			</span>
		<%
		}
		%>
		 </div>
		
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