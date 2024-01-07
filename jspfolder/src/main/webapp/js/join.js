 /* 모든 value값을 입력해야 제출하기가 가능한 script */
	function clickJoin(){ // 회원가입 미입력 값 있을 시 입력칸 빨간줄 처리
		let mid = document.frm.mid.value; // 아이디
		let mpw = document.frm.mpw.value; // 비밀번호
		let mpwRe = document.frm.mpwRe.value; // 비밀번호 확인
		let mnickNm = document.frm.mnickNm.value; // 닉네임
		let mname = document.frm.mname.value; // 사용자 이름 
		let mbirth = document.frm.mbirth.value; // 생년월일
		let mphone1 = document.frm.mphone1.value; // 핸드폰1
		let mphone2 = document.frm.mphone2.value; // 핸드폰2
		let mphone3 = document.frm.mphone3.value; // 핸드폰3
		let mgender = document.frm.mgender.value; // 성별
		let memail = document.frm.memail.value; // 이메일
		
		let check = true;
		
//		아이디
		if(mid == "" || mid == null){
			check = false;	
			document.frm.mid.style.border="1px solid red";
			document.getElementById("midTd").innerText = "아이디를 입력해주세요.";
			return;
		}else{
			check = true;
			document.frm.mid.removeAttribute("style");
			document.getElementById("midTd").innerText = "";
		}
		if(!checkIdFlag){
			check = false;
			document.frm.mid.style.border="1px solid red";
			document.getElementById("midTd").innerText = "아이디 중복확인을 해주세요.";
			return;
		}else{
			check = true;
			document.frm.mid.removeAttribute("style");
			document.getElementById("midTd").innerText = "";
		}

		
//		비밀번호
		if(mpw == ""){	
			check = false;	
			document.frm.mpw.style.border="1px solid red";
			document.getElementById("mpwTd").innerText = "비밀번호를 입력해주세요.";
			return;
		}else{	
			check = true;	
			document.frm.mpw.removeAttribute("style");
			document.getElementById("mpwTd").innerText = "";
		}

//		비밀번호 확인
		if(mpwRe == ""){
			check = false;
			document.frm.mpwRe.style.border="1px solid red";
			document.getElementById("mpwReTd").innerText = "비밀번호를 재입력해주세요.";
			return;
		}else if(mpwRe !== mpw){
			check = false;
			document.frm.mpwRe.style.border="1px solid red";
			document.getElementById("mpwReTd").innerText = "비밀번호가 같지 않습니다.";
			return;
		}else{	
			check = true;
			document.frm.mpwRe.removeAttribute("style");
			document.getElementById("mpwReTd").innerText = "";
		}
		
//		닉네임
		if(mnickNm == ""){	
			check = false;	
			document.frm.mnickNm.style.border="1px solid red";
			document.getElementById("mnickNmTd").innerText = "닉네임을 입력해주세요.";
			return;
		}else{	
			check = true;
			document.frm.mnickNm.removeAttribute("style");
			document.getElementById("mnickNmTd").innerText = "";
		}
		if(!checkNickNmFlag){
			check = false;
			document.frm.mid.mnickNm.border="1px solid red";
			document.getElementById("mnickNmTd").innerText = "닉네임 중복확인을 해주세요.";
			return;
		}else{
			check = true;
			document.frm.mnickNm.removeAttribute("style");
			document.getElementById("mnickNmTd").innerText = "";
		}

//		사용자 이름		
		if(mname == ""){	
			check = false;	
			document.frm.mname.style.border="1px solid red";
			document.getElementById("mnameTd").innerText = "이름을 입력해주세요.";
			return;
		}else{	
			check = true;	
			document.frm.mname.removeAttribute("style");
			document.getElementById("mnameTd").innerText = "";
		}
		
//		생년월일
		if(mbirth == ""){	
			check = false;	
			document.frm.mbirth.style.border="1px solid red";
			document.getElementById("mbirthTd").innerText = "생년월일을 입력해주세요.";
			return;
		}else{	
			check = true;	
			document.frm.mbirth.removeAttribute("style");
			document.getElementById("mbirthTd").innerText = "";
		}
		
//		연락처
		if(mphone1 == "" || mphone2 == "" || mphone3 == ""){	
			check = false;	
			document.frm.mphone1.style.border="1px solid red";
			document.frm.mphone2.style.border="1px solid red";
			document.frm.mphone3.style.border="1px solid red";
			document.getElementById("mphoneTd").innerText = "연락처를 입력해주세요.";
			return;
		}else{	
			check = true;	
			document.frm.mphone1.removeAttribute("style");
			document.frm.mphone2.removeAttribute("style");
			document.frm.mphone3.removeAttribute("style");
			document.getElementById("mphoneTd").innerText = "";
		}
		
//		성별
		if(mgender == ""){	
			check = false;
			document.getElementById("mgenderTd").innerText = "성별을 선택해주세요.";
			return;
		}else{	
			check = true;
			document.getElementById("mgenderTd").innerText = "";
		}
		
//		이메일
		if(memail == ""){	
			check = false;	
			document.frm.memail.style.border="1px solid red";
			document.getElementById("memailTd").innerText = "이메일을 입력해주세요.";
			return;
		}else{	
			check = true;	
			document.frm.memail.removeAttribute("style");
			document.getElementById("memailTd").innerText = "";
		}
		
		if(check && checkIdFlag && checkNickNmFlag){
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
				console.log("error");
				checkIdFlag = false;
			}
		});
	}
	
	function resetFn(){
		checkIdFlag = false;
	}
	
	let checkNickNmFlag = false;
//	닉네임 중복확인 함수
	function checkNickNm(){
		let nick = document.frm.mnickNm.value;
		
		$.ajax({
			url : "checkNickNm.jsp",
			type : "get",
			data : {nick : nick},
			success : function(data){
//			0 : 사용가능, 1 : 사용 불가능
			let result = data.trim();
			if(result == 0){
				checkNickNmFlag = true;
				alert("사용가능한 닉네임입니다.");
			}else{
				checkNickNmFlag = false;
				alert("이미 존재하는 닉네임입니다.");
			}
		},error:function(){
			console.log("error");
			checkNickNmFlag = false;
		}
			
		});
	}
	
	function resetNickFn(){
		checkNickNmFlag = false;
	}
	