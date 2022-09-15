$(function(){	
	//========= 장바구니에 상품 담기 =========//
	$('#product_cart').submit(function(event){
		if($('#order_quantity').val()==''){
			alert('수량을 입력하세요!');
			$('#order_quantity').focus();
			return false;
		}
		
		let form_data = $(this).serialize();
		
		$.ajax({
			url:'../cart/write.do',
			type:'post',
			data:form_data,
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 사용하세요!');
				}else if(param.result == 'success'){
					alert('장바구니에 담았습니다.');
					location.href='../cart/cart.do';
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
	});
	
	//========= 찜목록에 상품 담기 =========//
	//좋아요 읽기
	//좋아요 선택 여부와 총개수 표시
	function selectData(board_num){
		$.ajax({
			url:'../cart/getWish.do',
			type:'post',
			data:{p_num:p_num},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				displayWish(param);
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}
	
	//좋아요 등록
	$('#wishlist').click(function(){
		$.ajax({
			url:'../cart/writeWish.do',
			type:'post',
			data:{board_num:$('#p_num').val()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 찜 추가해주세요!');
				}else if(param.result == 'success'){
					displayWish(param);
				}else{
					alert('찜 등록 시 오류 발생!');	
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}); //좋아요 등록 끝
	

	//찜 표시
	function displayWish(param){
		let output;
		if(param.status == 'noWish'){
			output = '../images/heart_blank.png';
		}else{
			output = '../images/heart_full.png';
		}
		//문서 객체에 추가
		$('#wishlist').attr('src',output);
	}
	
	
	//초기 데이터 표시
	selectData($('#p_num').val());

	
	
	
	
});