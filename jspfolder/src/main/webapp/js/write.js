/*	function showSubSelect() {
	    let mainSelect = document.getElementById("mainSelect");
	    let subSelect = document.getElementById("td");

	    // 선택한 메인카테고리에 따라 서브카테고리를 동적으로 생성
	    if (mainSelect.value === "zone") {
	        if (!subSelect) {  // subSelect가 없으면 새로 만듦
	            subSelect = document.createElement("select");
	            subSelect.id = "subSelect";
	            // 여기에 옵션들을 추가하는 코드를 작성
	            let options = ["서울", "경기권", "강원권", "충청권", "영남권", "호남권", "제주"];
	            for (let i = 0; i < options.length; i++) {
	                let option = document.createElement("option");
	                option.text = options[i];
	                subSelect.add(option);
	            }
	            // 새로 만든 subSelect를 추가
	            document.body.appendChild(subSelect);
	        }
	        subSelect.style.display = "block";
	    } else if (subSelect) {  // subSelect가 있으면 제거
	        subSelect.style.display = "none";
	    }
	}*/
	
function showSubSelect(){
	// 메인 카테고리
	let mainSelect = document.getElementById("mainSelect");
	// 작성자 th
	let writerTh = document.getElementById("writerTh");
	// 작성자 닉네임 td
	let writerTd = document.getElementById("writerTd");
	// 세부카테고리 th
	let subSelectTh = document.getElementById("subSelectTh");
	// 세부카테고리 td
	let subSelectTd = document.getElementById("subSelectTd");
	// 세부카테고리 select
	let subSelect = document.getElementById("subSelect");
	
	if(mainSelect.value != "zone"){
		console.log(mainSelect.value);
		document.getElementById("subSelectTh").style.disply = "block";
		document.getElementById("writerTd").colspan = "2";
	}
}