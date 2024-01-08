<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%	
	
	

	//[get방식 차단]
	String method = request.getMethod();
	if(method.equals("GET")){
		response.sendRedirect("mypage.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
	String checkmpw = request.getParameter("checkmpw");
	
	
	/* Member member = session.getAttribute("member");
	int mno = member.getMno();
	*/
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
		
		String sql ="delete from member where mno = ? && mpw = ?";
		
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1,mno);
		psmt.setString(2,checkmpw);
		
		
		if(psmt.executeUpdate() > 0){
			%>
			<script>
				alert("탈퇴되었습니다.");
				location.href="/jspboard/index.jsp";
			</script>
		<%
		}else{
			%>
			<script>
				alert("비밀번호가 다릅니다.");
				location.href="mypageDel.jsp";
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