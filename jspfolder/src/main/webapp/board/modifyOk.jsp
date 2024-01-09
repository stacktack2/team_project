<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Vo.Board" %>
<%//[첨부파일] 첨부파일, 파일이름이 겹쳤을떄의 규칙 import %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
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

	//[첨부파일] 업로드 위치 지정
	//String directory = "E:\\98.팀프로젝트\\01.1차프로젝트\\team_project\\jspfolder\\src\\main\\webapp\\upload";
	String directory = "D:\\dahee\\AWS\\JAVA\\workspace\\team_project\\jspfolder\\src\\main\\webapp\\upload";
	
	//[첨부파일] 사이즈정하기
	int sizeLimit = 100*1024*1024;	//100mb제한
	
	//[첨부파일]multipart request로 바꿈 -> import필요(위 2개)
	//MultipartRequest 객체 생성() - 파라미터를 겟할수 x -> 멀티파트 리퀘스트로 가져와야함 
	MultipartRequest multi 
		= new MultipartRequest
			(request, directory, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
	
	
	Connection conn = null;	
	PreparedStatement psmt = null;
	
	String url = "jdbc:mysql://127.0.0.1:3306/campingweb";
	String user = "cteam";
	String pass ="ezen";
	
	//Board
	Board board = new Board();
	int result = 0;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,pass);
		
		//1. [게시글] 수정
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
		
		if(psmt != null) psmt.close();	
		
		//2.[첨부파일]* 현재 게시글의 PK값(기본키 bno) 가져오기
		//(as bno이기에 bno로 찾음)
		sql = "select max(bno) as bno from board";
		psmt = conn.prepareStatement(sql);
		
		ResultSet rs = psmt.executeQuery();
		
		//bno값 가져오기
		int bno = 0;
		if(rs.next()){
			bno = rs.getInt("bno");
		}
		
		if(rs != null) rs.close();
		if(psmt != null) psmt.close();
		
		//[첨부파일]
		//업로드된 실제파일명(멀티파트에서 가져오기)
		//넘어온 업로드파일명
		String realFileNM = multi.getFilesystemName("uploadFile");
		
		//원본파일명
		String originFileNM = multi.getOriginalFileName("uploadFile");
		
		//파일명 잘 넘어왔나 콘솔찍기
		//System.out.println("실제파일명: "+realFileNM);
		//System.out.println("원본파일명: "+originFileNM);
		
		//3. [첨부파일] 수정
		sql ="UPDATE uploadfile SET frealnm = ?,foriginnm = ?,frdate = now())"
			+" WHERE bno = ?";
		
		
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1,realFileNM );
		psmt.setString(2,originFileNM );
		psmt.setInt(3, bno);
		
		psmt.executeUpdate();
		
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