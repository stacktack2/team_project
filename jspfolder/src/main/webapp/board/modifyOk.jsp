<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Vo.Board" %>
<%@ page import="Vo.Member" %>
<%//[첨부파일] 첨부파일, 파일이름이 겹쳤을떄의 규칙 import %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
//-----------------게시글 수정 백단------------------------------
	
	request.setCharacterEncoding("UTF-8");
	
	//데이터를 수정할때는 반드시 POST로 넘겨야함
	String method = request.getMethod();
	if(method.equals("GET")){
	%>
		<script>
			alert("잘못된 접근입니다.2");
			location.href='<%=request.getContextPath()%>';
		</script>
	<%
	}
	
	//[첨부파일] 업로드 위치 지정
	//String directory = "E:\\98.팀프로젝트\\01.1차프로젝트\\team_project\\jspfolder\\src\\main\\webapp\\upload";
	String directory = "D:\\team\\team_project\\jspfolder\\src\\main\\webapp\\upload";
	//String directory = "C:\\Users\\MYCOM\\git\\team_project5\\jspfolder\\src\\main\\webapp\\upload";
	
	//[첨부파일] 사이즈정하기 100mb제한
	int sizeLimit = 100*1024*1024;	
	
	//[첨부파일]multipart request로 바꿈
	//MultipartRequest 객체 생성()
	MultipartRequest multi 
		= new MultipartRequest
			(request, directory, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
	
	
	//[첨부파일] 파라미터 
		//넘어온 업로드파일명(바뀐)
		String frealNm = multi.getFilesystemName("uploadFile");
		//원본파일명
		String foriginNm = multi.getOriginalFileName("uploadFile");
		
		Connection conn = null;	
		PreparedStatement psmt = null;
		
		String url = "jdbc:mysql://127.0.0.1:3306/campingweb";
		String user = "cteam";
		String pass ="ezen";
		
		String blist = multi.getParameter("blist");
		//null체크를 했어도(비정상 접근 차단 이유) 아래에서 메소드 사용시마다 널체크 해야함. if로 전체를 감싸지 않는이상 무조건 아래까지 실행되기 때문.
		if(blist==null){
			%>
			<script>
				alert("잘못된 접근입니다.");
				location.href="<%= request.getContextPath() %>/index.jsp";
			</script>
			<%
		}
		Member member =(Member)session.getAttribute("login");
		//Board
		Board board = new Board();
		//파라미터 받기
		board.setBtitle(multi.getParameter("btitle"));
		board.setBcontent(multi.getParameter("bcontent"));
		String bnoParam = multi.getParameter("bno");
		int bno = 0;
		if(bnoParam != null && !bnoParam.equals("")){
			bno = Integer.parseInt(bnoParam);
		}
		board.setBtype(multi.getParameter("btype"));
		//String btype = multi.getParameter("btype");


		int result = 0;
		

		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url,user,pass);
			
			//1. 게시글 수정
			if(!board.getBtype().equals("notice")){	//공지사항x
			String	sql = "UPDATE board "
						 +" SET btitle = ?"
					 	 +", bcontent = ? "
					 	 +", brdate = now()"
						 +" WHERE bno = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, board.getBtitle());
			psmt.setString(2, board.getBcontent());
			psmt.setInt(3, bno);
			}else{//공지사항o
				if(member.getMid().equals("admin")){	//관리자o
					String	sql = "UPDATE board "
							 +" SET btitle = ?"
						 	 +", bcontent = ? "
						 	 +", brdate = now()"
							 +" WHERE bno = ?";

				psmt = conn.prepareStatement(sql);
				psmt.setString(1, board.getBtitle());
				psmt.setString(2, board.getBcontent());
				psmt.setInt(3, bno);
				}else{
					%>
					<script>
						alert("권한이 없습니다.");
						location.href='<%=request.getContextPath()%>';
					</script>
				<%
				}
			}
			
			//수정된 행 수 반환
			result = psmt.executeUpdate();
			
			if(psmt != null) psmt.close();
			
			//2. 첨부파일 수정
			if(frealNm != null && foriginNm != null){
				
				//2-1.첨부파일 지우기
				String sql2 = "DELETE FROM uploadfile "
							+ " WHERE bno = ? ";
				psmt = conn.prepareStatement(sql2);
				psmt.setInt(1, bno);
				psmt.executeUpdate();
				
				if(psmt != null) psmt.close();
				
				//2-1. 첨부파일 삽입 
				String sql3 = "INSERT INTO uploadfile (foriginNm, frealNm, bno) "
							+" VALUES(?, ?, ?)";
				psmt = conn.prepareStatement(sql3);
				psmt.setString(1, foriginNm);
				psmt.setString(2, frealNm);
				psmt.setInt(3, bno);
				psmt.executeUpdate();
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null) conn.close();
			if(psmt != null) psmt.close();
		}
		
		//리다이렉트
		if(result >0){	//수정완료시 view.jsp로 점프
		%>
			<script>
				alert("수정이 완료되었습니다.");
				location.href='<%=request.getContextPath()%>/board/connectList.jsp?blist=<%=blist%>';
			</script>
		<%
		}else{
		%>
			<script>
				alert("수정이 완료되지 않았습니다.");
				location.href='<%=request.getContextPath()%>/board/connectList.jsp?blist=<%=blist%>';
			</script>
		<%
		}
	
	%>