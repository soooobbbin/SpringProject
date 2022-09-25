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
	
	//========= 장바구니에 상품 담기 =========//
	$(document).on('click','#addCart_btn',function(){
	
		alert('버튼눌림');
		
		var check = confirm('상품을 장바구니에 추가하시겠습니까?');
		
		if(check){
		let form_data = $(this).serialize();
		
		$.ajax({
			url:'addWishToCart.do',
			type:'post',
			data:{p_num:$(this).attr('data-pnum')},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 사용하세요!');
				}else if(param.result == 'success'){
					alert('장바구니에 담았습니다.');
					//location.href='../cart/cart.do';
				}else if(param.result == 'overquantity'){
					alert('기존에 주문한 상품입니다. 개수를 추가하면 재고가 부족합니다.');
				}else{
					alert('장바구니 담기 오류');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		//기본 이벤트 제거
		event.preventDefault();
		}
	});


	
	
});