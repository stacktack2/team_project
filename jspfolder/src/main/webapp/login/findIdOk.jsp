<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Vo.Member" %>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class="Vo.Member" />
<jsp:setProperty name="member" property="*" />
<%
	
	String mname = request.getParameter("mname");
	int mbirth = Integer.parseInt("mbirth");
	String mphone1 = request.getParameter("mphone1");
	String mphone2 = request.getParameter("mphone2");
	String mphone3 = request.getParameter("mphone3");
	String mphone = mphone1+mphone2+mphone3;
	
	boolean isFindId = false;
	
	Connection conn = null;
	PreparedStatement psmt= null;
	ResultSet rs = null;
	String url = "jdbc:mysql://192.168.0.26:3306/campingweb";
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
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn != null) conn.close();
		if(psmt != null) psmt.close();
		if(rs != null) rs.close();
	}
	
	if(){
%>
		<script>
			alert('회원님의 아이디는 입니다.');
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