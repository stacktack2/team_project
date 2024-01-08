<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%	
	//rno
	String rnoParam = request.getParameter("rno");

	int rno = 0;
	//null체크 -> 빈칸체크
	if(rnoParam != null && !rnoParam.equals("")){
		rno=Integer.parseInt(rnoParam);
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
		String sql = "DELETE from reply where rno = ?";
		
		psmt=conn.prepareStatement(sql);
		
		psmt.setInt(1,rno);
		
		//삭제되는 결과행수 반환
		int result = psmt.executeUpdate();	
		
		if(result>0){	//삭제됐다면
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