$(function() {
	//검색 유효성 체크
	$('#search_form').submit(function() {
		if ($('#keyword').val().trim() == '') {
			alert('검색어를 입력하세요!');
			$('#keyword').val('').focus();
			return false;
		}
	});

/*	$('.faq-arrow2').hide();

	$('.faq-arrow').click(function() {
		$(this).hide();
		$(this).parent().find('.faq-arrow2').show();
		$('#faq_list_table').find('.faq-arrow-show').show();
	});

	$('.faq-arrow2').click(function() {
		$('#faq-arrow2').hide();
		$('#faq-arrow').show();
		$('#faq-arrow-show').hide();
	});*/
});