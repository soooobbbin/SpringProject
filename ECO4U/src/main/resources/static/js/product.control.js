$(function(){
	//===========이미지 미리보기===========//
	//최초 이미지 정보 저장
	let photo = $('#p_photo').attr('src');
	
	//이벤트 연결
	$('#upload').change(function(){
		let my_photo = this.files[0];
		let $p_photo = $(this).parent().find('.p_photo');
		if(!my_photo){
			$p_photo.attr('src',photo);
			return;
		}
		
		//파일 용량 체크
		if(my_photo.size > 1024*1024){
			alert(Math.round(my_photo.size/1024) + 'kbytes(1024kbytes까지만 업로드 가능)');
			$p_photo.attr('src',photo);
			$(this).val('');
			return;
		}
		
		//이미지 미리보기 처리
		let reader = new FileReader();
		reader.readAsDataURL(my_photo);
		
		reader.onload=function(){
			$p_photo.attr('src', reader.result);
		};		
	});
});