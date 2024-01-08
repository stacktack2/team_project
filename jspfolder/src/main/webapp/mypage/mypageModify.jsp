<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:mysql://127.0.0.1:3306/campingweb";
		String user = "cteam";
		String pass ="ezen";
	try{
//	 	[비인증 접근 제한] OK 마지막에서 인증해제 해야함
//	 	if(session.getAttribute("isAutFlag")){
		boolean isAutFlag = true;
		if(!isAutFlag){
			%>
			<script>
				alert("비정상적인 접근입니다.");
				location.href="mypagePw.jsp";
			</script>
			<%
		}else{
			
			/* Member member = session.getAttribute("member"); */
		// 	int mno = member.getMno();
			int mno=7;
			
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
<link href="<%=request.getContextPath()%>/css/join.css" type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/mypage.css" type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js"></script>
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
			<form name="frm" action="mypageModifyOk.jsp" method="post" onsubmit="return false;" >
				<table>

					<tr id="trTitle">
						<th>아이디</th>
					</tr>
					<tr>
						<td>
							<input disabled value="<%=mid %>" type="text" name="mid" id="mid" class="textbox">
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="midTd"></a></td>
					</tr>

					<tr id="trTitle">
						<th>비밀번호</th>
					</tr>
					<tr>
						<td>
							<input value="<%=mpw %>" type="password" name="mpw" oninput="checkPw(this);checkPwRe();" class="textbox">
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="mpwTd"></a></td>
					</tr>

					<tr id="trTitle">
						<th>비밀번호 확인</th>
					</tr>
					<tr>
						<td>
							<input type="password" name="mpwRe" oninput="checkPwRe()" class="textbox">
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="mpwReTd"></a></td>
					</tr>

					<tr id="trTitle">
						<th>닉네임</th>
					</tr>
					<tr>
						<td>
							<input disabled value="<%=mnickNm %>" type="text" name="mnickNm" class="textbox">
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="mnickNmTd"></a></td>
					</tr>

					<tr id="trTitle">
						<th>이름</th>
					</tr>
					<tr>
						<td>
							<input disabled value="<%=mname %>" type="text" name="mname" class="textbox">
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="mnameTd"></a></td>
					</tr>

					<tr id="trTitle">
						<th>생년월일</th>
					</tr>
					<tr>
						<td>
							<input disabled value="<%=mbirth %>" type="text" name="mbirth" maxlength="8" class="textbox">
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2" id="mbirthTd"></td>
					</tr>
					<tr id="trTitle">
						<th>연락처</th>
					</tr>
					<tr>
						<td>
							<input value="<%=mphone %>" type="text" name="mphone1" oninput="checkPhone1(this)" maxlength="3" class="phone"> -
							<input type="text" name="mphone2" oninput="checkPhone2(this)" maxlength="4" class="phone"> -
							<input type="text" name="mphone3" oninput="checkPhone3(this)" maxlength="4" class="phone">
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2" align="right"><a id="mphoneTd"></a></td>
					</tr>
					<tr id="trTitle">
						<th>성별</th>
					</tr>
					<tr>
						<td>
							<div><%=mgender %></div>
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="mgenderTd"></a></td>
					</tr>
					<tr id="trTitle">
						<th>이메일</th>
					</tr>
					<tr>
						<td>
							<input value="<%=memail %>" type="email" name="memail" oninput="checkEmail(this)" class="textbox">
						</td>
					</tr>
					<tr class="blur">
    					<td colspan="2"><a id="memailTd"></a></td>
					</tr>
				</table>
				<input type="submit" id="joinButton" onclick="validation();" value="가입하기">
			</form>
		</article>
	</section>
	</div>
	<%@ include file="/include/footer.jsp" %>
	<script src="<%=request.getContextPath()%>/js/mypageModify.js"></script>
</body>
</html>


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
