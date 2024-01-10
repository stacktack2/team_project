	
	//[댓글 등록]
	function replyInsertFn(){
		
		// form태그 데이터를 파라미터값으로 가져오기
		let params = $("form[name=replyfrm]").serialize();
		$.ajax({
			url: "replyWriteOk.jsp",
			type: "post",
			data: params,
			success:function(data){
				console.log("error3");
				if(data.trim() != "FAIL" && data.trim() != "FAILFAIL"){
					$(".replyArea").prepend(data.trim());	//첫번째 자식으로
					
				}else{
					alert("댓글이 입력되지 않았습니다.")
				}
			},error:function(){
				console.log("error4");
			}
		});
			//댓글 등록 후 댓글창 비우기
			$("input[name=rcontent]").val("");
	}
	
	//[댓글 삭제]
	function replyDelFn(rno,obj){
		$.ajax({
			url: "deleteReplyOk.jsp",
			type: "post",
			data: "rno="+rno,	//키=값
			success:function(data){
				if(data.trim() == 'SUCCESS'){
					alert("댓글이 삭제되었습니다.");
					let target = $(obj).parent().parent();
					target.remove();
				}else{
					alert("댓글이 삭제되지 못했습니다.");
				}
			},error:function(){
				console.log("error");
			}
		});
	}
	
	//[댓글 수정]
	//수정중 -> 초기값을 false로 둠
	let isModify = false;
	
	function modifyFn(obj, rno){

		//동시다발적 수정하는것 방지(하나 수정중일때는 다른것 수정안됨)
		
		if(!isModify){	//수정중이라면
			//입력양식 초기값 얻어오기
			let value = $(obj).parent().prev("span").text().trim();	//부모의 형 span 기존 rcontent
			
			let html = "<input type='text' name = 'rcontent' value='"+value+"'>";
			html += "<input type='hidden' name='rno' value='"+rno+"'>";
			html += "<input type='hidden' name='oldRcontent' value='"+value+"'>";
			
			$(obj).parent().prev("span").html(html);
			
			html = "<button onclick='saveFn(this)'>저장</button>"
				 +"<button onclick='cancleFn(this)'>취소</button>";
			
			$(obj).parent().html(html);
			
			isModify=true;
		}else{
			alert("수정중인 댓글을 저장하세요");
		}
	}
	
	//[댓글 수정-저장]
	function saveFn(obj){
		//저장후 다른댓글 수정할 수 있도록 false로 만들어놓음
		isModify=false;
		
		//수정된 값
		let value = $(obj).parent().prev("span").find("input[name=rcontent]").val();
		
		let rno = $(obj).parent().prev("span").find("input[name=rno]").val();
		
		//원본
		let originalValue= $(obj).parent().prev("span").find("input[name=oldRcontent]").val();
		
		$.ajax({
			url: "replyModifyOk.jsp",
			type:"post",
			data:{rcontent: value, rno:rno},//키:값
			success : function(data){
				if(data.trim()=='SUCCESS'){
					$(obj).parent().prev("span").text(value);
					let html ='<button onclick="modifyFn(this,'+rno+')">수정</button>'
							+ '<button onclick="replyDelFn('+rno+', this)">삭제</button>';
					$(obj).parent().html(html);
				}else{	//수정취소
					$(obj).parent().prev("span").text(originalValue);	//원본값 넣어줌
					let html = '<button onclick="modifyFn(this,'+rno+')">수정</button>'
							+  '<button onclick="replyDelFn('+rno+',this)">삭제</button>';
					$(obj).parent().html(html);
				}
			},error:function(){
				console.log("error");
			}
			
		});
	}
	
	//[댓글 수정-취소]
	function cancleFn(obj){
		//원본
		let originValue = $(obj).parent().prev("span").find("input[name=oldRcontent]").val();
		
		let rno = $(obj).parent().prev("span").find("input[name=rno]").val();
		
		$(obj).parent().prev("span").text(originValue);
		
		let html = "<button onclick='modifyFn(this,"+rno+")'>수정</button>";
		html += "<button onclick='replyDelFn("+rno+", this)'>삭제</button>";
		
		$(obj).parent().html(html);
		
		isModify = false;
		
	}
	
	
	
	