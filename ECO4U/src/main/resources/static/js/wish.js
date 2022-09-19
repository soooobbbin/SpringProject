$(function(){
	
	//장바구니 선택 삭제
	$(document).on('click','#delete_btn',function(){
		
		if($(".select-product:checked").length == 0){
			alert('삭제할 항목을 선택해 주세요.');
			return;
		}
		
		var check = confirm('상품을 찜 목록에서 삭제하시겠습니까?');
		
		if(check){
			var checkArr = [];
			
			$(".select-product:checked").each(function(index,item){
				checkArr.push($(this).attr("data-wishnum"));
			});
			
			$.ajax({
			url:'deleteWish.do',
			type:'post',
			data:{del_product : checkArr.toString()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result=='logout'){
					alert('로그인해야 삭제할 수 있습니다.');
				}else if(param.result=='success'){
					alert('삭제 완료!');
					location.href='/cart/wishList.do';
				}else{
					alert('찜 목록 삭제시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
			
		}
		
	}); //end of click #delete_btn
	
	

	/*	
	$('li#all').click(function(){
		$('li#all').css('background','#eee').css('font-weight','bold');
		initForm1();
	});
	$('li#living').click(function(){
		$('li#living').css('background','#eee').css('font-weight','bold');
		initForm2();
	});
	$('li#beauty').click(function(){
		$('li#beauty').css('background','#eee').css('font-weight','bold');
		initForm3();
	});
	$('li#fassion').click(function(){
		$('li#fassion').css('background','#eee').css('font-weight','bold');
		initForm4();
	});
	
	//수정 폼 초기화
*/
	
	
	
});