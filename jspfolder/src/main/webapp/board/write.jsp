<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Vo.Member" %>
<%
	//---------------게시글 작성------------------------
	
	//(mnickNm)
	Member member = (Member)session.getAttribute("login");
	
	//Get방식으로 작성(접근) 못하게 하기
	if(member == null){	//로그인이 안돼있다면
%>
	<script>
		alert("잘못된 접근입니다");
		location.href='list.jsp';
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link href="<%=request.getContextPath() %>/css/base.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/write.css" rel="stylesheet">
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
						<th align="right">제목</th>
						<td>
							<input type="text" name="btitle">
						</td>
						<th align="right">카테고리</th>
						<td>
							<select name="type">
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
			<button class="saveBtn">저장</button>
		</form>
	</section>
	</div>
	<%@ include file ="/include/footer.jsp" %>
</body>
</html>