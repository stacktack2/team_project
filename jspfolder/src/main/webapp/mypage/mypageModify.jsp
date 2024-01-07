<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	
// 	[비인증 접근 제한] OK 마지막에서 인증해제 해야함
// 	if(session.getAttribute("isAutFlag")){
	boolean isAutFlag = false;
	if(isAutFlag){
		response.sendRedirect("mypage.jsp")	;
	}
	
	/* Member member = session.getAttribute("member"); */
// 	int mno = member.getMno();
	int mno=7;
	

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql ="select * from member where mno = ?";
		
		psmt = conn.prepareStatement(sql);
		
		psmt.setInt(1,mno);
		
		rs = psmt.executeQuery();
		
		rs.next();
		
		String mid = rs.getString("mid");
		String mpw = rs.getString("mpw");
		String mnickNm = rs.getString("mnickNm");
		String mname = rs.getString("mname");
		int mbirth = rs.getInt("mbirth");
		String mphone = rs.getString("mphone");
		String mgender = rs.getString("mgender");
		String memail = rs.getString("memail");
		
	

%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/base.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mypage.css" type="text/css" rel="stylesheet">
<style>
	
	
	table{
		margin:80px auto;
	}
	
	th{
		font-size:18px;
		width:130px; height:45px;
		text-align:left;
	}
	input{
		width:300px; height:25px;
	}
	input[type=radio]{
		width:40px; height:15px;
	}
	#span{
		font-weight:bold; text-decoration: underline;
	}
	
</style>
<script src="<%=request.getContextPath()%>/js/mypageModify.js"></script>
</head>
<body>
	<%@ include file="/include/header.jsp" %>
	<div class="container">
	<nav>
		<div id="mypagewelcome">
			<span id="mypagenickname">닉네임</span>
			<span id="mypagename">이름</span>
		</div>
		<div>
			<span class="mypagelist"><a href="mypage.jsp">내가 쓴 게시글</a></span>
			<span id="span" class="mypagelist"><a href="mypagePw.jsp">회원 정보 수정</a></span>
			<span class="mypagelist"><a href="mypageDel.jsp">회원 탈퇴</a></span>
		</div>
		
	</nav>
	<section>
<!-- 회원가입 폼 -->
		<article>
			<form name="frm" action="mypageModifyOk.jsp" method="post">
				<table>
<!-- 아이디 -->		<tbody>
						<tr>
							<th align="right">아이디: </th>
							<td>
								<div id ="disabledinput"><%=mid %></div>
							</td>
						</tr>
<!-- 비밀번호 -->
						<tr>
							<th align="right">비밀번호: </th>
							<td><input type="password" name="mpw"></td>
						</tr>
<!-- 비밀번호 확인 -->
						<tr>
							<th align="right">비밀번호 확인: </th>
							<td><input type="password" name="mpwRe"></td>
						</tr>
<!-- 닉네임 -->
						<tr>
							<th align="right">닉네임: </th>
							<td>
								<input type="text" name="mnickNm">
								<button type="button">중복확인</button>
							</td>
						</tr>
<!-- 사용자 이름 -->
						<tr>
							<th align="right">이름: </th>
							<td><div id ="disabledinput"><%=mname %></div></td>
						</tr>
<!-- 생년월일 -->
						<tr>
							<th align="right">생년월일: </th>
							<td><div id ="disabledinput"><%=mbirth %></div></td>
						</tr>
<!-- 연락처 -->
						<tr>
							<th align="right">연락처: </th>
							<td>
								<input type="text" name="mphone1" maxlength="3" id="mphone1">-
								<input type="text" name="mphone2" maxlength="4" id="mphone2">-
								<input type="text" name="mphone3" maxlength="4" id="mphone3">
							</td>
						</tr>
<!-- 성별 -->
						<tr>
							<th align="right">성별: </th>
							<td>
								<div id ="disabledinput"><%=mgender %></div>
							</td>
						</tr>
<!-- 이메일 -->
						<tr>
							<th align="right">이메일: </th>
							<td><input type="email" name="memail"></td>
						</tr>
						<tr>
							<th></th>
							<td><button id="modifybutton">수정하기</button></td>
						</tr>
					</tbody>
				</table>
<!-- 회원가입 버튼 -->
				
			</form>
		</article>
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