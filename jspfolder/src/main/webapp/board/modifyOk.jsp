<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
//-----------------게시글 수정 백단------------------------------
	
	request.setCharacterEncoding("UTF-8");
	
	//**데이터를 수정할때는 반드시 POST로 넘겨야함
	//타입체크 - get방식이라면 => 점프
	String method = request.getMethod();
	if(method.equals("GET")){
	%>
		<script>
			alert("잘못된 접근입니다.");
			location.href='list.jsp';
		</script>
	<%
	}
	// 자바빈즈 사용
%>
<jsp:useBean id="board" class="Vo.Board" scope="page"/>
<jsp:setProperty property="*" name="board"/>
<%
	Connection conn = null;	
	PreparedStatement psmt = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	
	int result = 0;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,pass);
		
		//게시글 수정
		String sql = "UPDATE board "
				 +"SET btitle = ?"
				 +", bcontent = ?"
				 +" WHERE bno = ?";

		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, board.getBtitle());
		psmt.setString(2, board.getBcontent());
		psmt.setInt(3, board.getBno());
		
		//수정된 행 수 반환
		result = psmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
	}
	
	//리다이렉트
	if(result >0){	//수정완료시
	%>
		<script>
			alert("수정이 완료되었습니다.");
			location.href='view.jsp?bno=<%=board.getBno()%>';
		</script>
	<%
	}else{
	%>
		<script>
			alert("수정이 완료되지 않았습니다.");
			location.href='view.jsp?bno=<%=board.getBno()%>';
		</script>
	<%
	}
%>