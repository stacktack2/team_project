<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Vo.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
	
	Member member = (Member)session.getAttribute("login");
	
	String bnoParam = request.getParameter("bno");
	
	int bno=0;
	if(bnoParam != null && !bnoParam.equals("")){
		bno = Integer.parseInt(bnoParam);
	}
	
	Connection conn = null;	
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String url = "jdbc:mysql://localhost:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	
	//sql의 결과 행을 담을 객체 생성(선택)
	Board board = new Board();
	
 	//[첨부파일] 첨부파일목록 담을 객체
	List<Uploadfile> flist = new ArrayList<Uploadfile>();
	
	//[댓글] 댓글목록을 담을 객체
	List<Reply> rlist = new ArrayList<Reply>(); 
	
	try{
		//[조회수]
		//쿠키를 사용하여 게시글 무한증식 방지
		
		//1. 쿠키목록 가져오기
		boolean isBnoCookie = false;
		//2. 쿠키배열 생성
		Cookie[] cookies = request.getCookies();
		//3. 쿠키 원소들에 접근
		for(Cookie tempCookie : cookies){

			if(tempCookie.getName().equals("board"+bno)){
				isBnoCookie = true;
				break;	
			}
		}
		//4. 쿠키굽기			
		if(!isBnoCookie){
			//1)쿠키생성()
			Cookie cookie = new Cookie("board"+bno,"ok");	
			cookie.setMaxAge(60*60*24);	
			//2)쿠키원소추가
			response.addCookie(cookie);
		}
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,pass);
		
		String sql = "";
		
		//[조회수]
		if(!isBnoCookie){
			
			//1. 조회수 업데이트
			sql = "UPDATE board"
					+" SET bhit = bhit +1"
					+" WHERE bno = ?";
				
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1,bno);	//파라미터 bno임
			
			psmt.executeUpdate();
			
			if(psmt != null) psmt.close();
		}
		
		//2. [게시글]
		sql = "SELECT b.*, m.mnickNm "
				+" FROM board b"
				+" INNER JOIN member m "
				+" ON b.mno = m.mno "
				+" WHERE b.bno = ?";

		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, bno);
		
		rs = psmt.executeQuery();
		
		if(rs.next()){
			board.setBno(rs.getInt("bno"));
			board.setBtitle(rs.getString("btitle"));
			board.setMno(rs.getInt("mno"));
			board.setMnickNm(rs.getString("mnickNm"));
			board.setBrdate(rs.getString("brdate"));
			board.setBcontent(rs.getString("bcontent"));
			board.setBtype(rs.getString("btype"));
			board.setBhit(rs.getInt("bhit"));
		}
		
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
		
		//[첨부파일]
		sql = "SELECT * FROM uploadfile WHERE bno = ?";
		
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, bno);
		
		rs = psmt.executeQuery();
		
		while(rs.next()){
			//첨부파일 객체 생성
			Uploadfile uf = new Uploadfile();
			
			uf.setFno(rs.getInt("fno"));
			uf.setBno(rs.getInt("bno"));
			uf.setFrealnm(rs.getString("frealnm"));
			uf.setForiginnm(rs.getString("foriginnm"));
			uf.setFrdate(rs.getString("frdate"));
			
			//첨부파일 목록변수에 첨부파일원소 추가
			flist.add(uf);
		}
		
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
		
 		//[댓글] 전체게시글의 댓글
		sql = "SELECT r.*, m.mnickNm, m.mno "
				+" from reply r"
				+" inner join member m"
				+" on r.mno = m.mno"
				+" where r.bno = ?";
		
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, board.getBno());
		
		rs = psmt.executeQuery();
		
		while(rs.next()){
			//댓글 객체 생성
			Reply reply = new Reply();
			
			reply.setRno(rs.getInt("rno")); 
			reply.setBno(rs.getInt("bno"));
			reply.setMno(rs.getInt("mno"));
			reply.setMnickNm(rs.getString("mnickNm"));
			reply.setRcontent(rs.getString("rcontent"));
			reply.setRrdate(rs.getString("rrdate"));
			
			//댓글 목록변수에 댓글원소객체 추가
			rlist.add(reply);
		} 
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link href="<%=request.getContextPath()%>/css/base.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/view.css" type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.min.js"></script>
<script src="<%=request.getContextPath() %>/js/view.js"></script>
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<div class="container">
	<%@ include file="/include/nav.jsp" %>
	<section>
		<h2 class="hidden">게시글 상세보기</h2>
		<table class="viewTable" border="1" >
			<tbody>
				<tr>
					<th>작성자</th>
					<td><%=board.getMnickNm() %></td>
					<th>등록일</th>
					<td><%=board.getBrdate()%></td>
					<th>조회수</th>
					<td><%= board.getBhit()%></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><%=board.getBtitle() %></td>
					<th>카테고리</th>
					<td><%=board.getBtype() %></td>
				</tr>
				<tr>
					<td colspan="6"><%=board.getBcontent() %></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="5">
					<%
						for(Uploadfile tempf: flist){
					%>		
							<a href="download.jsp?frealnm=<%=tempf.getFrealnm()%>
								&foriginnm=<%=tempf.getForiginnm()%>">
								<%= tempf.getForiginnm()%>
							</a><br>
					<%
						}
					%> 
					</td>
				</tr>
				<tr>
					<td colspan="6">이전글 ▲ </td>
				</tr>
				<tr>
					<td colspan="6">다음글 ▼ </td>
				</tr>
			</tbody>
		</table>
		<button onclick="location.href='list.jsp'" class="viewBtn">목록</button>
		
		<div id="writeBtns">
		<%	// 로그인한 유저가 쓴 게시글에서만 수정, 삭제 버튼 노출
		if(member != null && member.getMno() == board.getMno()){
		%>
			<button onclick="location.href='modify.jsp?bno=<%=board.getBno()%>'" class="viewBtn">수정</button>
			<button onclick="delFn()" class="viewBtn">삭제</button>
			<script>
				function delFn(){
					let isDel = confirm("정말 삭제하시겠습니까?");
							
					if(isDel){
						document.delfrm.submit();
					}
				}
			</script>
		<%
			}
		%>
		<form name="delfrm" action="delete.jsp" method="post">
			<input type="hidden" name="bno" value="<%=bno%>">
		</form>
		</div>	

		<!-- 댓글영역 -->
		<!-- <form name="replyfrm" action="replyWriteOk.jsp" method="post"> -->
		<form name="replyfrm" class="replyfrm">
			<input type="hidden" name="bno" value="<%=board.getBno() %>">
			<input type="text" name="rcontent">
			<button type="button" onclick="replyInsertFn()">댓글</button>
		</form>
		
		<div class="replyArea">
	<%
		for(Reply reply: rlist){
	%>
			<div>
				<%=reply.getMnickNm() %> : 
				<span>
					<%=reply.getRcontent() %>
				</span>
				<span>
					<button onclick="modifyFn(this,<%=reply.getRno()%>)">수정</button>
					<button onclick="replyDelFn(<%=reply.getRno()%>, this)">삭제</button>
				</span>
				<span><%=reply.getRrdate() %></span>
			</div>
		<%
			}	
		%>
		</div>
	</section>
	</div>
	<%@ include file="/include/footer.jsp" %>
	
</body>

</html>