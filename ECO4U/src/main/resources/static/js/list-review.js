$(function(){
	
	//장바구니 선택 삭제
	$(document).on('click','#reviewdelete_btn',function(){
		
		if($(".select-review:checked").length == 0){
			alert('삭제할 항목을 선택해 주세요.');
			return;
		}
		
		var check = confirm('상품평을 목록에서 삭제하시겠습니까?');
		
		if(check){
			var checkArr = [];
			
			$(".select-review:checked").each(function(index,item){
				checkArr.push($(this).attr("data-reviewnum"));
			});
			
			$.ajax({
			url:'selectDeleteReview.do',
			type:'post',
			data:{del_review : checkArr.toString()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result=='logout'){
					alert('로그인해야 삭제할 수 있습니다.');
				}else if(param.result=='success'){
					alert('삭제 완료!');
					location.href='/product/mypageReview.do';
				}else{
					alert('상품평 목록 삭제시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
			
		}
		
	}); //end of click #delete_btn
	


	
	
});