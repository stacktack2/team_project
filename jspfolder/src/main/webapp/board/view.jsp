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
		//쿠키를 사용하여 게시글 무한증식 방지(조회수 증가에 대한 기준: PC)
		
		//1. 가지고 있는 쿠키목록 가져오기(비교)
		boolean isBnoCookie = false;
		//2. 쿠키배열 생성
		Cookie[] cookies = request.getCookies();
		
		//3. 쿠키 원소들에 접근
		for(Cookie tempCookie : cookies){
			//??? "board"+bno 이게 뭔지
			//"board"+bno 이 이름이 있다는 것 = 이 게시물에 방문한 적이 있다.
			if(tempCookie.getName().equals("board"+bno)){
				isBnoCookie = true;
				break;	// 일치하는 쿠키 찾으면 바로 반복문 빠져나오기
			}
		}
		//4. 쿠키굽기			
		if(!isBnoCookie){
			//1)쿠키생성()
			Cookie cookie = new Cookie("board"+bno,"ok");
			//쿠키유지시간		
			cookie.setMaxAge(60*60*24);	//하루지속
			//2)쿠키추가
			response.addCookie(cookie);
		}
		
		//DB연결
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
			//psmt.setInt(1, board.getBno()); 아님
			//select되기 이전이라 bno=0이므로 파라미터로 가져온 bno사용해야함
			psmt.setInt(1,bno);	
			
			//쿼리호출
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
		sql = "SELECT r.rno, r.bno, m.mnickNm, m.mno, r.rcontent "
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
<script>
//-----------------------스크립트-------------------------------------

	//[댓글 등록]
	function replyInsertFn(){
		
		//로그인 안했을 시 다른 실행 막아주기!
		let loginMember = '<%=member%>';
		
		if(loginMember != 'null'){	//로그인했으면
			// form태그 안 데이터를 파라미터값으로 가져오기
			let params = $("form[name=replyfrm]").serialize();
			//console.log(params); 콘솔로 확인
			
			$.ajax({
				url: "replyWriteOk.jsp",
				type: "post",
				data: params,
				success:function(data){
					//console.log(data);
					//prepand로 댓글달기: append(끝), prepend(시작)
					if(data.trim() != "FAIL"){
						$(".replyArea").prepend(data.trim());
					}
				},error:function(){
					console.log("error");
				}
			});
		}else{	//로그인 안했으면
			alert("로그인 후에 처리하세요");
		}
	
		//댓글 등록 후 댓글창 비우기
		$("input[name=rcontent]").val("");
	}
	
	//[댓글 삭제]
	function replyDelFn(rno,obj){
		//alert(rno);
		$.ajax({
			url: "deleteReplyOk.jsp",
			type: "post",
			data: "rno="+rno,	//키=값
			success:function(data){
				//console.log(data);
				if(data.trim() == 'SUCCESS'){
					alert("댓글이 삭제되었습니다.");
					let target = $(obj).parent().parent();
					target.remove();
				}else{
					alert("댓글이 삭제되지 못했습니다.");
				}
			},error:function(){
				console.log("error");
			}
		});
	}
	
	//[댓글 수정]
	//수정중? -> 초기값을 false로 둠
	let isModify = false;
	
	function modifyFn(obj, rno){

		//동시다발적 수정하는것 방지(하나 수정중일때는 다른것 수정안됨)
		
		if(!isModify){
			//입력양식 초기값 얻어오기
			//prev(): 형 찾기
			let value = $(obj).parent().prev("span").text().trim();
			//console.log(value);
			
			let html = "<input type='text' name = 'rcontent' value='"+value+"'>";
			html += "<input type='hidden' name='rno' value='"+rno+"'>";
			html += "<input type='hidden' name='oldRcontent' value='"+value+"'>";
			
			$(obj).parent().prev("span").html(html);
			
			html = "<button onclick='saveFn(this)'>저장</button>"
				 +"<button onclick='cancleFn(this)'>취소</button>";
			
			$(obj).parent().html(html);
			
			isModify=true;
		}else{
			alert("수정중인 댓글을 저장하세요");
		}
	}
	
	//[댓글 수정-저장]
	function saveFn(obj){
		//저장후 다른댓글 수정할 수 있도록 false로 만들어놓음
		isModify=false;
		
		//수정된 값
		let value = $(obj).parent().prev("span").find("input[name=rcontent]").val();
		
		let rno = $(obj).parent().prev("span").find("input[name=rno]").val();
		
		//원본
		let originalValue= $(obj).parent().prev("span").find("input[name=oldRcontent]").val();
		
		$.ajax({
			url: "replyModifyOk.jsp",
			type:"post",
			data:{rcontent: value, rno:rno},//키:값
			success : function(data){
				if(data.trim()=='SUCCESS'){
					$(obj).parent().prev("span").text(value);
					//버튼생성
					let html ='<button onclick="modifyFn(this,'+rno+')">수정</button>'
							+ '<button onclick="replyDelFn('+rno+', this)">삭제</button>';
					$(obj).parent().html(html);
				}else{	//수정취소?
					$(obj).parent().prev("span").text(originalValue);	//원본값 넣어줌
					let html = '<button onclick="modifyFn(this,'+rno+')">수정</button>'
							+  '<button onclick="replyDelFn('+rno+',this)">삭제</button>';
					$(obj).parent().html(html);
				}
			},error:function(){
				console.log("error");
			}
			
		});
	}
	
	//[댓글 수정-취소]
	function cancleFn(obj){
		//원본
		let originValue = $(obj).parent().prev("span").find("input[name=oldRcontent]").val();
		//console.log(originValue);
		
		let rno = $(obj).parent().prev("span").find("input[name=rno]").val();
		
		//이 이전에 rno가져오기
		$(obj).parent().prev("span").text(originValue);
		//버튼생성
		let html = "<button onclick='modifyFn(this,"+rno+")'>수정</button>";
		html += "<button onclick='replyDelFn("+rno+", this)'>삭제</button>";
		
		$(obj).parent().html(html);
		
		isModify = false;
		
	}
	
//-----------------------------html------------------------------------------
</script>
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
						for(Uploadfile tempbf: flist){
					%>		
							<%-- <a href="<%=request.getContextPath()%>/upload/<%=tempbf.getFrealnm()%>" download><%=tempbf.getForiginnm() %></a><br> --%>	
							<a href="download.jsp?frealNM=<%=tempbf.getFrealnm()%>&foriginNM=<%=tempbf.getForiginnm()%>"><%= tempbf.getForiginnm()%></a><br>
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
		<%	// 로그인한 유저가 쓴 게시글에서만 수정, 삭제 버튼 노출
			// (member !=null을 먼저! 아니면 member가 로그인을 안하면 nullpointException이 발생)
		if(member != null && member.getMno() == board.getMno()){
		%>
			<button onclick="location.href='modify.jsp?bno=<%=board.getBno()%>'">수정</button>
			<button onclick="delFn()">삭제</button>
			<script>
				function delFn(){
					let isDel = confirm("정말 삭제하시겠습니까?");
							
					if(isDel){
						document.frm.submit();
					}
				}
			</script>
		<%
			}
		%>
		<%//삭제버튼: form을 아예 밖으로 빼놓고 자바스크립트로 form을 submit하는 방법으로 삭제버튼 실행%>
		<form name="frm" action="delete.jsp" method="post">
			<input type="hidden" name="bno" value="<%=bno%>">
		</form>	


	<%// 댓글영역 %>
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
				<!-- 자기자신에 해당하는 rno값 => 수정, 삭제 -->
				<span>
					<button onclick="modifyFn(this,<%=reply.getRno()%>)">수정</button>
					<button onclick="replyDelFn(<%=reply.getRno()%>, this)">삭제</button>
				</span>
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