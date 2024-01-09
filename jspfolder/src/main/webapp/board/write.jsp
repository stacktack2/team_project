<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Vo.Member" %>
<!DOCTYPE html>
<html>
<head>
<%
	//(mnickNm)
	Member member = (Member)session.getAttribute("login");
	String bnoParam = request.getParameter("bno");
	
	//blist
	String blist = request.getParameter("blist");
	
	int bno = 0 ;
	if(bnoParam != null && bnoParam.equals("")){
		bno = Integer.parseInt(bnoParam);
	}
	
	
	if(member == null){	//로그인이 안돼있다면
%>
	<script>
		alert("잘못된 접근입니다");
		location.href="<%= request.getContextPath() %>/index.jsp";
	</script>
<%
	}
	//예외처리 - 자신이 작성하지 않은 글 조회 방지
	Connection conn = null;	
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String url = "jdbc:mysql://localhost:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,pass);
		
		String sql = "select bno from board where bno=? && mno=?";
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, bno);
		psmt.setInt(2, member.getMno());
		
		rs = psmt.executeQuery();
		
		if(rs.next()){
			%>
			<script>
				alert("잘못된 접근입니다");
				location.href='/jspfolder/index.jsp';
			</script>
			<%
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
	
	
	
	
	
%>

<meta charset="UTF-8">
<title>게시글 작성</title>
<link href="<%=request.getContextPath() %>/css/base.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/write.css" rel="stylesheet">
<script>
/*  blist 파라미터값을 가져오기 위해선 html에 미리 변수로 선언해줘야 하는데
 	(파라미터로 받아왔다고 html에서 바로 쓸 수 없음)
	표현식이라 문자열로 받아와야 변수로 사용할 수 있다.
*/
 let blist='<%=blist%>';
	
	function wCancleFn(){
		if(blist=="all"){
			location.href="<%=request.getContextPath() %>/list/allList.jsp";
		}else if(blist=="notice"){
			location.href="<%=request.getContextPath() %>/list/noticeList.jsp";
		}else if(blist=="hot"){
			location.href="<%=request.getContextPath() %>/list/hotList.jsp";
		}else if(blist=="free"){
			location.href="<%=request.getContextPath() %>/list/freeList.jsp";
		}else if(blist=="zone"){
			location.href="<%=request.getContextPath() %>/list/zoneList.jsp";
		}else if(blist=="gear"){
			location.href="<%=request.getContextPath() %>/list/gearList.jsp";
		}else if(blist=="attend"){
			location.href="<%=request.getContextPath() %>/list/attendList.jsp";
		}else if(blist=="qna"){
			location.href="<%=request.getContextPath() %>/list/qnaList.jsp";
		}
	}
</script>
</head>
<body>
	<%@ include file ="/include/header.jsp" %>
	<div class="container">
	<%@ include file="/include/nav.jsp" %>
	<section>
		<h2 class="hidden">게시글 등록</h2>
		<%	
			//encytype이 있어야 전달받은 파일을 기계어로 백단에 그대로 파라미터로 보낼 수 있음(원래 파라미터는 문자열로만 전달가능하기에)
			//라이브러리필요: cos.jar를 lib파일에 이게 있어야 알아서 bulid됨 
		%>
		<form action="writeOk.jsp" method="post" name="frm" enctype="multipart/form-data">
			<table border="1" class="writeTable">
				<tbody>
					<tr>
						<th >제목</th>
						<td>
							<input type="text" name="btitle">
						</td>
						<th>카테고리</th>
						<td>
							<select name="btype">
								<option> 자유게시판</option>
								<option> 캠핑지역</option>
								<option> 캠핑장비</option>
								<option> 출석체크</option>
								<option> Q&A</option>
								<%
								if(member.getMid().equals("admin")){
								%>
									<option> 공지사항</option>
								<%
								}
								%>
							</select>	
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="bcontent"></textarea>
						</td>
					</tr>
					<% // 첨부파일 :브라우저에서 접근할 수 있도록 wepapp하위에 첨부파일 만듦%>
					<tr>
						<th>첨부파일 </th>
						<td colspan="3">
							<input type="file" name="uploadFile">
						</td>
					</tr>
				</tbody>
			</table>
			<button type="button" class="cancleBtn" onclick="wCancleFn()">취소</button>
			<button class="saveBtn">저장</button>
			
		</form>
	</section>
	</div>
	<%@ include file ="/include/footer.jsp" %>
	
</body>
</html>