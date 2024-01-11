<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String blist = request.getParameter("blist");
	//null체크를 했어도(비정상 접근 차단 이유) 아래에서 메소드 사용시마다 널체크 해야함. if로 전체를 감싸지 않는이상 무조건 아래까지 실행되기 때문.
	if(blist==null){
		%>
		<script>
			alert("잘못된 접근입니다");
			location.href="<%= request.getContextPath() %>/index.jsp";
		</script>
		<%
	}else{
		
		%>
			<%-- <script>
				location.href="<%= request.getContextPath() %>/list/<%=blist%>List.jsp";
			</script>  --%>
		
		<%
		
		if(blist.equals("all")){
			%>
			<script>
				location.href="<%= request.getContextPath() %>/list/allList.jsp";
			</script>
			<%
		}else if(blist.equals("notice")){
			%>
			<script>
				location.href="<%= request.getContextPath() %>/list/noticeList.jsp";
			</script>
			<%
		}else if(blist.equals("hot")){
			%>
			<script>
				location.href="<%= request.getContextPath() %>/list/hotList.jsp";
			</script>
			<%
		}else if(blist.equals("free")){
			%>
			<script>
				location.href="<%= request.getContextPath() %>/list/freeList.jsp";
			</script>
			<%
		}else if(blist.equals("zone")){
			%>
			<script>
				location.href="<%= request.getContextPath() %>/list/zoneList.jsp";
			</script>
			<%
		}else if(blist.equals("gear")){
			%>
			<script>
				location.href="<%= request.getContextPath() %>/list/gearList.jsp";
			</script>
			<%
		}else if(blist.equals("attend")){
			%>
			<script>
				location.href="<%= request.getContextPath() %>/list/attendList.jsp";
			</script>
			<%
		}else if(blist.equals("QnA")){
			%>
			<script>
				location.href="<%= request.getContextPath() %>/list/QnAList.jsp";
			</script>
			<%
		}else{
			%>
			<script>
				location.href="<%= request.getContextPath() %>/list/allList.jsp";
			</script>
			<%
		}
	
	}
	
%>