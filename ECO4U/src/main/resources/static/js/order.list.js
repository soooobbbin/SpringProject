$(function(){
	$('#search_form').submit(function(){	
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력하세요!');
			$('#keyword').val('').focus();
			return false;
		}
		
		if($('#keyfield').val()==1 && isNaN($('#keyword').val())){
			alert('주문번호는 숫자만 입력하세요!');
			$('#keyword').val('').focus();
			return false;
		}

	
	});

});