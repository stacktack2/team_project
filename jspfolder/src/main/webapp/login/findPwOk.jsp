<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Vo.Member" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.UUID"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	Connection conn = null;
	PreparedStatement psmt= null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://192.168.0.26:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	
	String mid = request.getParameter("mid");
	String mpw = "";
	String mname = request.getParameter("mname");
	String mbirth2 = request.getParameter("mbirth");
	int mbirth = Integer.parseInt(mbirth2);
	String mphone1 = request.getParameter("mphone1");
	String mphone2 = request.getParameter("mphone2");
	String mphone3 = request.getParameter("mphone3");
	String mphone = mphone1+mphone2+mphone3;
	
	boolean isfindPw = false;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,pass);
		System.out.println("연결성공!");
		
		String sql = " SELECT mid, mname, mbirth, mphone, mno, mpw"
				   + "   FROM member"
				   + "  WHERE mid = ?"
				   + "    AND mname = ?"
				   + "    AND mbirth = ?"
				   + "    AND mphone = ?";
		
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, mid);
		psmt.setString(2, mname);
		psmt.setInt(3, mbirth);
		psmt.setString(4, mphone);
		
		rs = psmt.executeQuery();
		
		if(rs.next()){
			Member member = new Member();
			member.setMno(rs.getInt("mno"));
			member.setMid(rs.getString("mid"));
			member.setMname(rs.getString("mname"));
			member.setMbirth(rs.getInt("mbirth"));
			member.setMphone(rs.getString("mphone"));
			
			mpw = rs.getString("mpw");
			
			session.setAttribute("findPw", member);
			isfindPw = true;
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
	
	if(isfindPw){
%>
		<script>
			alert('비밀번호는 <%=mpw%>입니다.');
			location.href="login.jsp";
		</script>
<%
	}else{
%>
		<script>
			alert("회원정보를 다시 입력해주세요.");
			location.href="findPw.jsp";
		</script>
<%		
	}
	
%>