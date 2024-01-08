<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%	
	//**삭제: 반드시 POST
		//타입체크:GET방식으로 접근하는것 방지
	String method = request.getMethod();
	if(method.equals("GET")){	
	%>
		<script>
			alert("잘못된 접근입니다.");
			location.href='list.jsp';
		</script>
	<%
	}
	
	//bno
	String bnoParam = request.getParameter("bno");
	//null체크->빈칸체크
	int bno=0;
	if(bnoParam != null && !bnoParam.equals("")){
		bno = Integer.parseInt(bnoParam);
	}

	Connection conn = null;	
	PreparedStatement psmt = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	

	//결과를 담을 변수 설정
	int result =0;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,pass);
		
		//게시글 삭제
		String sql = "DELETE from board WHERE bno = ?";
		psmt = conn.prepareStatement(sql);
		
		psmt.setInt(1,bno);
		
		result = psmt.executeUpdate();	
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
	}
	
	//리다이렉트
	if(result >0){ //삭제완료시
		%>
		<script>
			alert("삭제가 완료되었습니다.");
			location.href='allList.jsp';
		</script>
		<%
		}else{
		%>
		<script>
			alert("삭제가 완료되지 않았습니다.");
			location.href='allList.jsp';
		</script>
		<%
		}
	
%>