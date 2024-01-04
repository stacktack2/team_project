<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/join.css" type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.min.js">
/* 모든 value값을 입력해야 제출하기가 가능한 script */
	function clickJoin(){ // 회원가입 미입력 값 있을 시 false;
		let mid = document.frm.mid.value;
		let mpw = document.frm.mpw.value;
		let mpwRe = document.frm.mpwRe.value;
		let mnickNm = document.frm.mnickNm.value;
		let mname = document.frm.mname.value;
		let mbirth = document.frm.mbirth.value;
		let mphone = document.frm.mphone.value;
		let mgender = document.frm.mgender.value;
		let memail = document.frm.memail.value;
		
		/* 미입력칸 빨간줄 처리 */
		let check = true;
		if(mid == ""){	check = false;	document.frm.mid.style.border="1px solid red";
		}else{	check = true;	document.frm.mid.removeAttribute("style");}
		
		if(mpw == ""){	check = false;	document.frm.mid.style.border="1px solid red";
		}else{	check = true;	document.frm.mid.removeAttribute("style");}
		
		if(mpwRe == ""){	check = false;	document.frm.mid.style.border="1px solid red";
		}else{	check = true;	document.frm.mid.removeAttribute("style");}
		
		if(mnickNm == ""){	check = false;	document.frm.mid.style.border="1px solid red";
		}else{	check = true;	document.frm.mid.removeAttribute("style");}
		
		if(mname == ""){	check = false;	document.frm.mid.style.border="1px solid red";
		}else{	check = true;	document.frm.mid.removeAttribute("style");}
		
		if(mbirth == ""){	check = false;	document.frm.mid.style.border="1px solid red";
		}else{	check = true;	document.frm.mid.removeAttribute("style");}
		
		if(mphone == ""){	check = false;	document.frm.mid.style.border="1px solid red";
		}else{	check = true;	document.frm.mid.removeAttribute("style");}
		
		if(mgender == ""){	check = false;	document.frm.mid.style.border="1px solid red";
		}else{	check = true;	document.frm.mid.removeAttribute("style");}
		
		if(memail == ""){	check = false;	document.frm.mid.style.border="1px solid red";
		}else{	check = true;	document.frm.mid.removeAttribute("style");}
		
		if(check && checkIdFlag){
			document.frm.submit();
		}
	}
	
	let checkIdFlag = false;
	
//	아이디 중복확인 함수
	function checkIdFn(){
		let id = document.frm.mid.value;
		
		$.ajax({
			url : "checkId.jsp",
			type : "get",
			data : {id : id},
			success : function(data){
				// 0 : 사용가능, 1 : 사용 불가능
				let result = data.trim();
				if(result == 0){
					checkIdFlag = true;
					alert("사용가능한 아이디입니다.");
				}else{
					checkIdFlag = false;
					alert("이미 존재하는 아이디입니다.");
				}
			},error:function(){
				console.log("eroor");
				checkIdFlag = false;
			}
		});
	}
	
	function resetFn(){
		checkIdFlag = false;
	}
</script>
</head>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<body>
	<section>
<!-- 회원가입 폼 -->
		<article>
			<h2>회원가입</h2>
			<form name="frm" action="joinOk.jsp" method="post">
				<table>
<!-- 아이디 -->
					<tr>
						<th align="right">아이디: </th>
						<td>
							<input type="text" name="mid" onblur="resetFn()">
							<button type="button" onclick="checkIdFn()">중복확인</button>
						</td>
					</tr>
<!-- 비밀번호 -->
					<tr>
						<th align="right">비밀번호: </th>
						<td><input type="password" name="mpw"></td>
					</tr>
<!-- 비밀번호 확인 -->
					<tr>
						<th align="right">비밀번호 확인: </th>
						<td><input type="password" name="mpwRe"></td>
					</tr>
<!-- 닉네임 -->
					<tr>
						<th align="right">닉네임: </th>
						<td>
							<input type="text" name="mnickNm">
							<button type="button" onclick="checkNickNm()">중복확인</button>
						</td>
					</tr>
<!-- 사용자 이름 -->
					<tr>
						<th align="right">이름: </th>
						<td><input type="text" name="mname"></td>
					</tr>
<!-- 생년월일 -->
					<tr>
						<th align="right">생년월일: </th>
						<td><input type="text" name="mbirth" maxlength="8"></td>
					</tr>
<!-- 연락처 -->
					<tr>
						<th align="right">연락처: </th>
						<td>
							<input type="text" name="mphone1" maxlength="3" id="mphone1">-
							<input type="text" name="mphone2" maxlength="4" id="mphone2">-
							<input type="text" name="mphone3" maxlength="4" id="mphone3">
						</td>
					</tr>
<!-- 성별 -->
					<tr>
						<th align="right">성별: </th>
						<td>
							<input type="radio" name="mgender" value="M">남
							<input type="radio" name="mgender" value="W">여
						</td>
					</tr>
<!-- 이메일 -->
					<tr>
						<th align="right">이메일: </th>
						<td><input type="email" name="memail"></td>
					</tr>
				</table>
<!-- 회원가입 버튼 -->
				<button onclick="clickJoin();return false;">가입하기</button>
			</form>
		</article>
	</section>
</body>
</html>