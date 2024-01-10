<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Vo.Member"%>
<%@ page import="Vo.Board"%>
<%@ page import="java.sql.*"%>
<%//[첨부파일] 첨부파일, 파일이름이 겹쳤을떄의 규칙 import %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%	
request.setCharacterEncoding("UTF-8");
Connection conn = null;
PreparedStatement psmt = null;

String url = "jdbc:mysql://127.0.0.1:3306/campingweb";
String user = "cteam";
String pass ="ezen";
	
int result =0;
try{

	String blist = request.getParameter("blist");
	//null체크를 했어도(비정상 접근 차단 이유) 아래에서 메소드 사용시마다 널체크 해야함. if로 전체를 감싸지 않는이상 무조건 아래까지 실행되기 때문.
	if(blist==null){
		%>
		<script>
			alert("잘못된 접근입니다");
			location.href="<%= request.getContextPath() %>/index.jsp";
		</script>
		<%
	}
	//[첨부파일] 업로드 위치 지정
	/* String directory = "E:\\98.팀프로젝트\\01.1차프로젝트\\team_project\\jspfolder\\src\\main\\webapp\\upload"; */
	//String directory = "D:\\dahee\\AWS\\JAVA\\workspace\\team_project\\jspfolder\\src\\main\\webapp\\upload";
	String directory = "C:\\Users\\MYCOM\\git\\team_project5\\jspfolder\\src\\main\\webapp\\upload";
	
	//[첨부파일] 사이즈정하기
	int sizeLimit = 100*1024*1024;	//100mb제한
	
	//[첨부파일]multipart request로 바꿈 -> import필요(위 2개)
	//MultipartRequest 객체 생성() - 파라미터를 겟할수 x -> 멀티파트 리퀘스트로 가져와야함 
	MultipartRequest multi 
		= new MultipartRequest
			(request, directory, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
	
	
	//세션에서 저장된 값(login 키) 가져오기 
	// - 파라미터값보다 먼저 불러야 btitle, bcontent가 null값이 안됨
	Member member =(Member)session.getAttribute("login");
	
	//타입체크: GET방식으로 접근하는것 방지 
	String method = request.getMethod();
	if(method.equals("GET") || member == null){	//get방식이라면
		response.sendRedirect(request.getContextPath());	
	}
	
	//파라미터를 담을 VO생성(import필요)
	Board board = new Board();
	//파라미터값 받아오기
	board.setBtitle(multi.getParameter("btitle"));
	board.setBcontent(multi.getParameter("bcontent"));
	board.setBtype(multi.getParameter("btype"));

//	캠핑지역 값 받아오기
	String subtype = request.getParameter("subtype");
	
	
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn=DriverManager.getConnection(url,user,pass);
		//1.[게시글] 작성 
		String sql = " INSERT INTO board(btitle, bcontent, mno, brdate, btype) "
				   + " VALUES(?,?,?,NOW(),?) ";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, board.getBtitle());
		psmt.setString(2, board.getBcontent());
		psmt.setInt(3,member.getMno());
		// btype 분기점
		
		boolean isPass= true;
		if(board != null){
			if(board.getBtype().equals("free")){
				psmt.setString(4, "자유게시판"); isPass = false;
			}else if(board.getBtype().equals("attend")){
				psmt.setString(4, "출석체크");isPass = false;
			}else if(board.getBtype().equals("QnA")){
				psmt.setString(4, "QnA");isPass = false;
			}else if(board.getBtype().equals("notice")){
				psmt.setString(4, "공지사항");isPass = false;
			}else if(board.getBtype().equals("zone_Seoul")){
				psmt.setString(4, "캠핑지역서울");isPass = false;
			}else if(board.getBtype().equals("zone_GG")){
				psmt.setString(4, "캠핑지역경기권");isPass = false;
			}else if(board.getBtype().equals("zone_GW")){
				psmt.setString(4, "캠핑지역강원권");isPass = false;
			}else if(board.getBtype().equals("zone_CC")){
				psmt.setString(4, "캠핑지역충청권");isPass = false;
			}else if(board.getBtype().equals("zone_YN")){
				psmt.setString(4, "캠핑지역영남권");isPass = false;
			}else if(board.getBtype().equals("zone_HN")){
				psmt.setString(4, "캠핑지역호남권");isPass = false;
			}else if(board.getBtype().equals("zone_JJ")){
				psmt.setString(4, "캠핑지역제주");isPass = false;
			}else if(board.getBtype().equals("gear_Tent")){
				psmt.setString(4, "캠핑장비텐트");isPass = false;
			}else if(board.getBtype().equals("gear_Bad")){
				psmt.setString(4, "캠핑장비침낭");isPass = false;
			}else if(board.getBtype().equals("gear_Chair")){
				psmt.setString(4, "캠핑장비의자");isPass = false;
			}else if(board.getBtype().equals("gear_Fire")){
				psmt.setString(4, "캠핑장비화기");isPass = false;
			}else if(board.getBtype().equals("gear_Car")){
				psmt.setString(4, "캠핑장비차박");isPass = false;
			}
		}
		
		
		
		if(!isPass){
			//삽입된 행 수 반환
			result = psmt.executeUpdate();
			
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
		
			if(realFileNM != null && originFileNM != null){
			
				//2.[첨부파일]* 현재 등록(삽입)된 게시글에 대한 PK값(기본키 bno) 가져오기(insert된 후, conn 종료전)
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
				
				
				
				//3. [첨부파일]삽입
				sql = " INSERT INTO uploadfile(bno, frealNm, foriginNm, frdate)"
					+ " VALUES(?,?,?, now())";
				
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setInt(1, bno);
				psmt.setString(2,realFileNM );
				psmt.setString(3,originFileNM );
				
				psmt.executeUpdate();

			}
			
		}else{
			%>
			<script>
				alert("잘못된 접근입니다");
				location.href="<%= request.getContextPath() %>/index.jsp";
			</script>
			<%
		}
			
		if(result>0){ //insert 성공시
			%>
				<script>
					alert("게시물이 등록되었습니다.");
					if(blist=="all"){
						location.href="<%=request.getContextPath() %>/list/allList.jsp";
					}else if(blist=="notice"){
						location.href="<%=request.getContextPath() %>/list/noticeList.jsp";
					}else if(blist=="hot"){
						location.href="<%=request.getContextPath() %>/list/hotList.jsp";
					}else if(blist=="free"){
						location.href="<%=request.getContextPath() %>/list/freeList.jsp";
					}else if(blist=="zone"){
						location.href="<%=request.getContextPath() %>/list/zoneList.jsp";
					}else if(blist=="gear"){
						location.href="<%=request.getContextPath() %>/list/gearList.jsp";
					}else if(blist=="attend"){
						location.href="<%=request.getContextPath() %>/list/attendList.jsp";
					}else if(blist=="QnA"){
						location.href="<%=request.getContextPath() %>/list/qnaList.jsp";
					}
				</script>
				<%
				}else{
				%>
				<script>
					alert("게시글 등록되지 않았습니다.");
					if(blist=="all"){
						location.href="<%=request.getContextPath() %>/list/allList.jsp";
					}else if(blist=="notice"){
						location.href="<%=request.getContextPath() %>/list/noticeList.jsp";
					}else if(blist=="hot"){
						location.href="<%=request.getContextPath() %>/list/hotList.jsp";
					}else if(blist=="free"){
						location.href="<%=request.getContextPath() %>/list/freeList.jsp";
					}else if(blist=="zone"){
						location.href="<%=request.getContextPath() %>/list/zoneList.jsp";
					}else if(blist=="gear"){
						location.href="<%=request.getContextPath() %>/list/gearList.jsp";
					}else if(blist=="attend"){
						location.href="<%=request.getContextPath() %>/list/attendList.jsp";
					}else if(blist=="qna"){
						location.href="<%=request.getContextPath() %>/list/qnaList.jsp";
					}
				</script>
				<%	
					
				}
	
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null) conn.close();
			if(psmt != null) psmt.close();
		}
	%>
		