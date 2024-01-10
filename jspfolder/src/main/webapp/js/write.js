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
		let writerTd = document.getElementById("writerTd");
		let th = document.createElement("th");
		let td = document.createElement("td");
		
	if(mainSelect.value === "zone"){
		writerTd.removeAttribute("colspan");
		th.textContent = "세부카테고리";
		writerTd.parentElement.appendChild(th);
		
		td.innerHTML = '<select name="subtype" id="subSelect">'+
							'<option value="zone_Seoul">서울</option>'+
							'<option value="zone_GG">경기권</option>'+
							'<option value="zone_GW">강원권</option>'+
							'<option value="zone_CC">충청권</option>'+
							'<option value="zone_YN">영남권</option>'+
							'<option value="zone_HN">호남권</option>'+
							'<option value="zone_JJ">제주</option>'+
						'</select>';
		writerTd.parentElement.appendChild(td);
	}else{
		
		writerTd.setAttribute("colspan", 3);
	}
}