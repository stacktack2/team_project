	//유효성 검사 개수제한 추가해야함 개수 정해지면 {} 붙이기
	
	
	
	let mpw = document.frm.mpw;
	let mpwRe = document.frm.mpwRe; 
	
	
	let mphone1 = document.frm.mphone1; 
	let mphone2 = document.frm.mphone2; 
	let mphone3 = document.frm.mphone3; 
	
	let memail = document.frm.memail;
	
	let checkNickNmFlag = false;
	
	
	
	function checkPw(obj){
		let regId = /[^0-9a-zA-Z]/g;
		let regRs = regId.test(obj.value); 
		let mpwTd = document.getElementById("mpwTd"); 
		if(obj.value == "" || obj.value === null || obj.value === undefined){
			mpwTd.innerHTML = '비밀번호를 입력해주세요';
			mpwTd.style.color = 'red';
			return false;
		}else if(regRs){
			mpwTd.innerHTML ='영문과 숫자만 사용가능합니다.';
			mpwTd.style.color = 'red';
			return false;
		}else{
			mpwTd.innerHTML = '사용가능합니다.';
			mpwTd.style.color = 'green';
			return true;
		}
	}
	
	function checkPwRe(){
		let confirmPw = mpw.value == mpwRe.value;
		let mpwReTd = document.getElementById("mpwReTd"); 
		if(mpwRe.value == "" || mpwRe.value === null || mpwRe.value === undefined){
			mpwReTd.innerHTML = '비밀번호를 입력해주세요';
			mpwReTd.style.color = 'red';
			return false;
		}else if(!confirmPw){
			mpwReTd.innerHTML = '비밀번호가 같지 않습니다.';
			mpwReTd.style.color = 'red';
			return false;
		}else{
			mpwReTd.innerHTML = '사용가능합니다.';
			mpwReTd.style.color = 'green';
			return true;
		}
	}
	
	
	
	
	
	function checkPhone1(obj){
		let regId = /[^0-9]/g;
		let regRs = regId.test(obj.value); 
		let mphoneTd = document.getElementById("mphoneTd"); 
		if(obj.value == "" || obj.value === null || obj.value === undefined){
			mphoneTd.innerHTML = '전화번호를 입력해주세요.';
			mphoneTd.style.color = 'red';
			return false;
		}else if(regRs){
			mphoneTd.innerHTML = '숫자만 사용가능합니다.';
			mphoneTd.style.color = 'red';
			return false;
		}else{
			mphoneTd.innerHTML = '사용가능합니다.';
			mphoneTd.style.color = 'green';
			return true;
		}
	}
	
	function checkPhone2(obj){
		let regId = /[^0-9]/g;
		let regRs = regId.test(obj.value); 
		let mphoneTd = document.getElementById("mphoneTd"); 
		if(obj.value == "" || obj.value === null || obj.value === undefined){
			mphoneTd.innerHTML = '전화번호를 입력해주세요.';
			mphoneTd.style.color = 'red';
			return false;
		}else if(regRs){
			mphoneTd.innerHTML = '숫자만 사용가능합니다.';
			mphoneTd.style.color = 'red';
			return false;
		}else{
			mphoneTd.innerHTML = '사용가능합니다.';
			mphoneTd.style.color = 'green';
			return true;
		}
	}
	
	function checkPhone3(obj){
		let regId = /[^0-9]/g;
		let regRs = regId.test(obj.value); 
		let mphoneTd = document.getElementById("mphoneTd"); 
		if(obj.value == "" || obj.value === null || obj.value === undefined){
			mphoneTd.innerHTML = '전화번호를 입력해주세요.';
			mphoneTd.style.color = 'red';
			return false;
		}else if(regRs){
			mphoneTd.innerHTML = '숫자만 사용가능합니다.';
			mphoneTd.style.color = 'red';
			return false;
		}else{
			mphoneTd.innerHTML = '사용가능합니다.';
			mphoneTd.style.color = 'green';
			return true;
		}
	}
	
	
	
	function checkEmail(obj){
		let memailTd = document.getElementById("memailTd"); 
		if(obj.value == "" || obj.value === null || obj.value === undefined){
			memailTd.innerHTML = '이메일을 입력해주세요.';
			memailTd.style.color = 'red';
			return false;
		}else{
			memailTd.innerHTML = '사용가능합니다.';
			memailTd.style.color = 'green';
			return true;
		}
	}
	
	function validation(){
		if(checkPw(mpw) & checkPwRe(mpwRe)
			& checkPhone1(mphone1)
			& checkPhone2(mphone2) & checkPhone3(mphone3) 
			& checkEmail(memail)){
				document.frm.submit();	
			}
	}
