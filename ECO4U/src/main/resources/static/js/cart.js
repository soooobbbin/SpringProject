$(function(){
	
	//장바구니 선택 삭제
	$(document).on('click','#delete_btn',function(){
		
		if($(".select-product:checked").length == 0){
			alert('삭제할 항목을 선택해 주세요.');
			return;
		}
		
		var check = confirm('상품을 장바구니에서 삭제하시겠습니까?');
		
		if(check){
			var checkArr = [];
			
			$(".select-product:checked").each(function(index,item){
				checkArr.push($(this).attr("data-cartnum"));
			});
			
			$.ajax({
			url:'deleteCart.do',
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
					location.href='/cart/cart.do';
				}else{
					alert('장바구니 삭제시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
			
		}
		
	});
});