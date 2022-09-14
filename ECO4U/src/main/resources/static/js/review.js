$(function() {
	$('#review_write_btn03').click(function(){
		alert("취소가 완료되었습니다.");
		/*location.href="주문내역으로.do";*/
	});
	$('#review_write_btn01').click(function(){
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
	 $("#r_content_length").keyup(function() {
	 var content = $(this).val();
	 $("#r_content_ckeck").text("(" + content.length + " / 500자)");

		 if (content.length > 500) {
			alert("최대 500자까지 입력 가능합니다.");
			$(this).val(content.substring(0, 500));
			$('#r_content_ckeck').text("(500 / 500자)");
		}
	});
});