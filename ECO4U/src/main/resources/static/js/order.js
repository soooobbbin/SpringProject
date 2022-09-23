$(function(){
	var target = document.querySelectorAll('.zipcodebtn');
	var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
	var targetID;

// 팝업 열기
for(var i = 0; i < target.length; i++){
  target[i].addEventListener('click', function(){
    targetID = this.getAttribute('href');
    document.querySelector(targetID).style.display = 'block';
  });
}

// 팝업 닫기
for(var j = 0; j < target.length; j++){
  btnPopClose[j].addEventListener('click', function(){
    this.parentNode.parentNode.style.display = 'none';
  });
}

//상품 총액
	var all_total = parseInt($('#all_total').val());
	if(all_total < 30000) 
		all_total += 2500;


//카카오페이
$('#apibtn').click(function(){
	
	if($(".payment:checked").length == 0){
		alert('결제할 상품을 선택해 주세요.');
	}else { 
		if($('#payment2').is(':checked')){
			alert("카카오페이");
		}
	}
	
	$.ajax({
		url:'kakaopay.do',
		data:{pcount:$('#pcount').val(),p_name:$('#p_name').val(),all_total:all_total},
		dataType:'json',
		success:function(data){
			var box = data.next_redirect_pc_url;
			window.open(box);
		},
		error:function(error){
			alert("error");
			} 
		});
	});


	
$('#main_form').submit(function(event){
	
	let form_data = $(this).serialize();
	
	if($(".payment:checked").length == 0){
		alert('결제 수단을 선택해 주세요.');
		return false;
	}else { 
		if($('#payment2').is(':checked')){
			$.ajax({
				url:'kakaopay.do',
				data:form_data,
				dataType:'json',
				success:function(data){
					var box = data.next_redirect_pc_url;
					window.open(box);
				},
				error:function(error){
					alert("error");
				} 
			});
		} else if($('#payment1').is(':checked')){
			$.ajax({
				url:'pay.do',
				data:form_data,
				dataType:'json',
				success:function(){
					alert("통장 입금 결제 네트워크성공");
				},
				error:function(){
					alert("통장 입금 결제 네트워크오류");
				} 
			});
		}
	}	
	
	//기본 이벤트 제거
	event.preventDefault();
	});
});
