<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Vo.*" %>
<%	
	//[get방식 차단]
	String method = request.getMethod();
	if(method.equals("GET")){
		response.sendRedirect("/jspfolder/index.jsp");
	}
	Member member = (Member)session.getAttribute("login");
	
	//rno
	String rnoParam = request.getParameter("rno");
	
	int rno = 0;
	//null체크 -> 빈칸체크
	if(rnoParam != null && !rnoParam.equals("")){
		rno=Integer.parseInt(rnoParam);
	}
	
	Connection conn = null;	
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,pass);
		
		//세션의 맴버 mno와 현재 rno의 mno가 일치하는 지 확인해야함.
		// 확인하는 이유: 주소를 알고 파라미터를 알면 내가 작성하지 않더라도 삭제 요청을 보낼 수 있다.
		String sql =" select mno from reply where rno = ?";
		
		psmt=conn.prepareStatement(sql);
		psmt.setInt(1,rno);
		rs = psmt.executeQuery();
		
		if(!rs.next()){
			out.print("FAIL");
			
		}else{
			
			if(member != null && rs.getInt("mno") != member.getMno()){
				out.print("FAIL");
			}else{
				
				if(psmt != null) psmt.close();
				if(rs != null) rs.close();
				
			
				//SQL
				sql = "update reply set rdelyn = 1 where rno = ? ";
				
				psmt=conn.prepareStatement(sql);
				
				psmt.setInt(1,rno);
				
				//삭제되는 결과행수 반환
				int result = psmt.executeUpdate();	
				
				if(result>0){	//삭제됐다면
					out.print("SUCCESS");
				}else{
					out.print("FAIL");
				}
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
	}
%>