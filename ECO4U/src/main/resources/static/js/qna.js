$(function() {
	
	//검색 유효성 체크
	$('#search_form').submit(function(){
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력하세요!');
			$('#keyword').val('').focus();
			return false;
		}
	});
	
	$('#qna_write_btn03').click(function(){
		alert("취소가 완료되었습니다.");
		location.href="faqlist.do";
	});
	$('#qna_write_btn01').click(function(){
		alert("취소가 완료되었습니다.");
		history.back();
	});
	
	//처음 화면에 보여지는 이미지 읽기
	let photo_path = $('.my-photo2').attr('src');
	let my_photo2; //업로드하고자 선택한 이미지 저장
	$('#upload').change(function(){
		my_photo2 = this.files[0];
		if(!my_photo2){ //파일 정보가 없는 경우
			$('.my-photo2').attr('src', photo_path);
			return;
		}
		//파일 용량 체크
		if(my_photo2.size > 1024*1024){
			alert(Math.round(my_photo2.size/1024) + 
							'kbytes(1024kbytes까지만 업로드 가능)');
			//원래 이미지로 교체
			$('.my-photo2').attr('src', photo_path);
			$(this).val(''); //파일명 지우기
			return;
		}
		
		//이미지 미리보기 처리
		let reader = new FileReader();
		//선택한 이미지 읽기
		reader.readAsDataURL(my_photo2);
		
		reader.onload=function(){
			//읽어들인 이미지 표시
			$('.my-photo2').attr('src', reader.result);
		};
	});//end of change
	
	
	//취소 버튼 처리
	$('#photo_reset').click(function(){
		$('.my-photo2').attr('src',photo_path);
		$('#upload').val('');
	});
	
	 //글자 수 세기
	 $("#qnacontent_length").keyup(function() {
	 var content = $(this).val();
	 $("#qnacontent_ckeck").text("(" + content.length + " / 500자)");

		 if (content.length > 500) {
			alert("최대 500자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 500));
			$('#qnacontent_ckeck').text("(500 / 500자)");
		}
	});
	
	//문의글 선택 삭제
	$(document).on('click','#qnadelete_btn',function(){
		
		if($(".select-qna:checked").length == 0){
			alert('삭제할 항목을 선택해 주세요.');
			return;
		}
		
		var check = confirm('문의글을 삭제하시겠습니까?');
		
		if(check){
			var checkArr = [];
			
			$(".select-qna:checked").each(function(index,item){
				checkArr.push($(this).attr("data-cartnum"));
			});
			
			$.ajax({
			url:'deleteQnA.do',
			type:'post',
			data:{del_qna : checkArr.toString()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result=='logout'){
					alert('로그인해야 삭제할 수 있습니다.');
				}else if(param.result=='success'){
					alert('삭제 완료!');
					location.href='/faq/qnalist.do';
				}else{
					alert('문의글 삭제시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생(체크)');
			}
		});
			
		}
	});
});