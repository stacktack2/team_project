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
	
	String blist = request.getParameter("blist");
	//null체크를 했어도(비정상 접근 차단 이유) 아래에서 메소드 사용시마다 널체크 해야함. if로 전체를 감싸지 않는이상 무조건 아래까지 실행되기 때문.
	if(blist==null){
		%>
		<script>
			alert("잘못된 접근입니다");
			location.href="<%= request.getContextPath() %>/index.jsp";
		</script>
		<%
	}
	
	int bno = 0 ; //받아오는 이유 설명 필요
	if(bnoParam != null && bnoParam.equals("")){
		bno = Integer.parseInt(bnoParam);
	}
	String mnickNm ="";
	if(member == null){	//로그인이 안되어있는 경우 예외처리, 참고->( 이 경우 if문 아래의 자바코드도 실행되므로 아래 코드에서 member의 메소드를 null체크없이 사용하면 에러가 뜰 가능성이 있다.)
	
%>
	<script>
		alert("잘못된 접근입니다");
		location.href="<%= request.getContextPath() %>/index.jsp";
	</script>
<%
	}else{
		mnickNm = member.getMnickNm();
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
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
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
			<input type="hidden" name="blist" value="<%=blist%>">
			<table border="1" class="writeTable">
				<tbody>
					<tr>
						<th >제목</th>
							<td>
								<input type="text" name="btitle">
							</td>
						<th>카테고리</th>
						<td>
							<select name="btype" id="mainSelect" onchange="showSubSelect()">
								<option value="자유게시판"> 자유게시판</option>
								<option> 캠핑지역</option>
								<option> 캠핑장비</option>
								<option value="출석체크"> 출석체크</option>
								<option value="QnA"> QnA</option>
							<%
							if(member != null && member.getMid().equals("admin")){ // member 메소드 사용 전 null체크 추가
							%>
								<option value="공지사항">공지사항</option>
							<%
							}
							%>
							</select>
						</td>
					</tr>
					<tr>
						<th id="writerTh">작성자</th>
						
						<td id="writerTd"><%=mnickNm%></td>
						
						<th id="subSelectTh">세부카테고리</th>
						<td id="subSelectTd">
							<select name="btype" id="subSelect">
								<option value="캠핑지역_서울">서울</option>
								<option value="캠핑지역_경기권">경기권</option>
								<option value="캠핑지역_강원권">강원권</option>
								<option value="캠핑지역_충청권">충청권</option>
								<option value="캠핑지역_영남권">영남권</option>
								<option value="캠핑지역_호남권">호남권</option>
								<option value="캠핑지역_제주">제주</option>
							</select>
						</td>
						
					</tr>
					<tr>
						<td colspan="5">
							<textarea name="bcontent"></textarea>
						</td>
					</tr>
					<% // 첨부파일 :브라우저에서 접근할 수 있도록 wepapp하위에 첨부파일 만듦%>
					<tr>
						<th>첨부파일 </th>
						<td colspan="5">
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
	<script>
//		세부카테고리 이벤트
		let writerTd = document.getElementById("writerTd");
		let subSelectTh = document.getElementById("subSelectTh");
		let subSelectTd = document.getElementById("subSelectTd");
			
		function showSubSelect(){
			if(mainSelect.value != "zone"){
				writerTd.parentNode.removeChild(subSelectTh);
				writerTd.parentNode.removeChild(subSelectTd);
				writerTd.setAttribute("colspan", 3);
			}else{
				writerTd.removeAttribute("colspan");
				writerTd.parentElement.appendChild(subSelectTh);
				writerTd.parentElement.appendChild(subSelectTd);
			}
		}
	</script>
	<%@ include file ="/include/footer.jsp" %>
</body>
</html>