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
		
	}); //end of click #delete_btn
	
	//=========장바구니 수량 변경=======//
	$('.cart-modify').on('click',function(){
	let input_quantity = $(this).parent().find('input[name="order_quantity"]');
		if(input_quantity.val()==''){
			alert('수량을 입력하세요');
			input_quantity.focus();
			return;
		}
		if(isNaN(input_quantity.val())){
			input_quantity.val(input_quantity.attr('value'));
			return;
		}
		if(input_quantity.val()<1){
			alert('상품의 최소 수량은 1입니다.');
			input_quantity.val(input_quantity.attr('value'));
			return;
		}
		$.ajax({
			url:'modifyCart.do',
			type:'post',
			data:{cart_num:$(this).attr('data-cartnum'),p_num:$(this).attr('data-pnum'),order_quantity:input_quantity.val()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result=='logout'){
					alert('로그인 후 사용해주세요');
				}else if(param.result=='noSale'){
					alert('판매 중지 되었습니다.');
					location.href='cart.do';
				}else if(param.result=='noQuantity'){
					alert('상품의 수량이 부족합니다.');
					location.href='cart.do'
				}else if(param.result=='success'){
					alert('상품 개수가 수정되었습니다.');
					location.href='cart.do';
				}else{
					alert('수정시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
	
	//========상품 선택 확인===========//
	$('.order-btn').on('click',function(){
		
		if($(".select-product:checked").length == 0){
			alert('결제할 상품을 선택해 주세요.');
			location.replace('cart.do');
		}else {
		
		
			const checkArr = [];	
			$(".select-product:checked").each(function(index,item){
				checkArr.push($(this).attr("data-cartnum"));
			});
			var checkArrnum = "";
			for(var i=0; i<=(checkArr.length)-1; i++){
				if(i==(checkArr.length)-1){
					checkArrnum += checkArr[i];
				}else{
					checkArrnum += checkArr[i]+',';
				}
			}
			
			location.replace("orders.do?cart_num=" + checkArrnum);
		}
	});
	
});