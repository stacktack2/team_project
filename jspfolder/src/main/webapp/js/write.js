/*function showSubSelect() {
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


function showSubSelect(obj){
	if(document.getElementById("subSelectTh") !== null){
	document.getElementById("subSelectTh").remove();
	}
	if(document.getElementById("subSelectTd") !== null){
	document.getElementById("subSelectTd").remove();
	}
	if(obj.value ==="캠핑지역"){
		let subTr = document.getElementById("subTr");
		let subSelectTh = document.createElement("th");
		let subSelectTd = document.createElement("td");
		subSelectTh.setAttribute("id","subSelectTh");
		subSelectTd.setAttribute("id","subSelectTd")
		subSelectTh.textContent='세부카테고리';
		subSelectTd.innerHTML=
		'<select name="btype" id="subSelect">'+
		'<option value="캠핑지역_서울">서울</option>'+
		'<option value="캠핑지역_경기권">경기권</option>'+
		'<option value="캠핑지역_강원권">강원권</option>'+
		'<option value="캠핑지역_충청권">충청권</option>'+
		'<option value="캠핑지역_영남권">영남권</option>'+
		'<option value="캠핑지역_호남권">호남권</option>'+
		'<option value="캠핑지역_제주">제주</option>'+
		'</select>';
		subTr.appendChild(subSelectTh);
		subTr.appendChild(subSelectTd);
		
	}else if(obj.value ==="캠핑장비"){
		let subTr = document.getElementById("subTr");
		let subSelectTh = document.createElement("th");
		let subSelectTd = document.createElement("td");
		subSelectTh.setAttribute("id","subSelectTh");
		subSelectTd.setAttribute("id","subSelectTd")
		subSelectTh.textContent='세부카테고리';
		subSelectTd.innerHTML=
		'<select name="btype" id="subSelect">'+
		'<option value="캠핑지역_서울">서울</option>'+
		'<option value="캠핑지역_경기권">경기권</option>'+
		'<option value="캠핑지역_강원권">강원권</option>'+
		'<option value="캠핑지역_충청권">충청권</option>'+
		'<option value="캠핑지역_영남권">영남권</option>'+
		'<option value="캠핑지역_호남권">호남권</option>'+
		'<option value="캠핑지역_제주">제주</option>'+
		'</select>';
		
		subTr.appendChild(subSelectTh);
		subTr.appendChild(subSelectTd);
	}
}


					