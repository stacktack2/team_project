function searchId(){
	let mname = document.frm.mname.value;
	let mbirth = document.frm.mbirth.value;
	let mphone1 = document.frm.mphone1.value; // 핸드폰1
	let mphone2 = document.frm.mphone2.value; // 핸드폰2
	let mphone3 = document.frm.mphone3.value;
	
	let check = true;
	if(mname == ""){	
			check = false;	
			document.frm.mname.style.border="1px solid red";
			document.getElementById("mnameTd").innerText = "*이름을 입력해주세요.";
			return;
		}else{	
			check = true;	
			document.frm.mname.removeAttribute("style");
			document.getElementById("mnameTd").innerText = "";
		}
		
	if(mbirth == ""){	
			check = false;	
			document.frm.mbirth.style.border="1px solid red";
			document.getElementById("mbirthTd").innerText = "*생년월일을 입력해주세요.";
			return;
		}else{	
			check = true;	
			document.frm.mbirth.removeAttribute("style");
			document.getElementById("mbirthTd").innerText = "";
		}
	
	if(mphone1 == "" || mphone2 == "" || mphone3 == ""){	
			check = false;	
			document.frm.mphone1.style.border="1px solid red";
			document.frm.mphone2.style.border="1px solid red";
			document.frm.mphone3.style.border="1px solid red";
			document.getElementById("mphoneTd").innerText = "*연락처를 입력해주세요.";
			return;
		}else{	
			check = true;	
			document.frm.mphone1.removeAttribute("style");
			document.frm.mphone2.removeAttribute("style");
			document.frm.mphone3.removeAttribute("style");
			document.getElementById("mphoneTd").innerText = "";
		}
		
	if(check){
		document.frm.submit();
	}	
	
}