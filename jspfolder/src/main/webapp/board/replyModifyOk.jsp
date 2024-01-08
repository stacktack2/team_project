<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%

	request.setCharacterEncoding("UTF-8");

	//파라미터 가져오기
	String rcontent = request.getParameter("rcontent");
	String rnoParam = request.getParameter("rno");
	
	//null체크 -> 빈칸체크
	int rno = 0;
	if(rnoParam != null && !rnoParam.equals("")){
		rno = Integer.parseInt(rnoParam);
	}
	
	Connection conn = null;	
	PreparedStatement psmt = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,pass);
		
		//SQL
		String sql = "UPDATE reply "
					+" SET rcontent = ? "
					+" WHERE rno = ?";
		
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, rcontent);
		psmt.setInt(2,rno);
		
		//수정되는 행수 반환
		int result = psmt.executeUpdate();
		
		if(result>0){ //수정됐다면
			out.print("SUCCESS");
		}else{
			out.print("FAIL");
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
	}
%>