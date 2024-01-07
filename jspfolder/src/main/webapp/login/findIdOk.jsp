<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Vo.Member" %>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String mid = "";
	String mname = request.getParameter("mname");
	String mbirth2 = request.getParameter("mbirth");
	int mbirth = Integer.parseInt(mbirth2);
	String mphone1 = request.getParameter("mphone1");
	String mphone2 = request.getParameter("mphone2");
	String mphone3 = request.getParameter("mphone3");
	String mphone = mphone1+mphone2+mphone3;
	
	boolean isfindId = false;
	
	Connection conn = null;
	PreparedStatement psmt= null;
	ResultSet rs = null;
	String url = "jdbc:mysql://127.0.0.1:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,pass);
		System.out.println("연결성공!");
		
		String sql = " SELECT mname, mbirth, mphone, mno, mid"
				   + "   FROM member"
				   + "  WHERE mname = ?"
				   + "    AND mbirth = ?"
				   + "    AND mphone = ?";
		
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, mname);
		psmt.setInt(2, mbirth);
		psmt.setString(3, mphone);
		
		rs = psmt.executeQuery();
		
		if(rs.next()){
			Member member = new Member();
			member.setMno(rs.getInt("mno"));
			member.setMname(rs.getString("mname"));
			member.setMbirth(rs.getInt("mbirth"));
			member.setMphone(rs.getString("mphone"));
			member.setMid(rs.getString("mid"));
			
			mid = rs.getString("mid");
		
			session.setAttribute("findId", member);
			isfindId = true;
		}
		
	}catch(NumberFormatException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
	
	if(isfindId){
%>
		<script>
			alert('회원님의 아이디는 <%=mid%>입니다.');
			location.href="login.jsp";
		</script>
<%
	}else{
%>
		<script>
			alert("회원정보를 다시 입력해주세요.");
			location.href="findId.jsp";
		</script>
<%		
	}
	
%>