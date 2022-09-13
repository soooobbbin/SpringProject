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

	$('.faqbtn00').click(function() {
		$(this).css('color', 'white');
		$(this).css('border', '7px solid #7c8f83');
		$(this).css('background-color', '#7c8f83');
		$('.faqbtn01').css('color', 'black');
		$('.faqbtn01').css('border', '7px solid #f4f9f2');
		$('.faqbtn01').css('background-color', '#f4f9f2');
		$('.faqbtn02').css('color', 'black');
		$('.faqbtn02').css('border', '7px solid #f4f9f2');
		$('.faqbtn02').css('background-color', '#f4f9f2');
		$('.faqbtn03').css('color', 'black');
		$('.faqbtn03').css('border', '7px solid #f4f9f2');
		$('.faqbtn03').css('background-color', '#f4f9f2');
	});

	$('.faqbtn01').click(function() {
		$(this).css('color', 'white');
		$(this).css('border', '7px solid #7c8f83');
		$(this).css('background-color', '#7c8f83');
		$('.faqbtn00').css('color', 'black');
		$('.faqbtn00').css('border', '7px solid #f4f9f2');
		$('.faqbtn00').css('background-color', '#f4f9f2');
		$('.faqbtn02').css('color', 'black');
		$('.faqbtn02').css('border', '7px solid #f4f9f2');
		$('.faqbtn02').css('background-color', '#f4f9f2');
		$('.faqbtn03').css('color', 'black');
		$('.faqbtn03').css('border', '7px solid #f4f9f2');
		$('.faqbtn03').css('background-color', '#f4f9f2');
	});

	$('.faqbtn02').click(function() {
		$(this).css('color', 'white');
		$(this).css('border', '7px solid #7c8f83');
		$(this).css('background-color', '#7c8f83');
		$('.faqbtn00').css('color', 'black');
		$('.faqbtn00').css('border', '7px solid #f4f9f2');
		$('.faqbtn00').css('background-color', '#f4f9f2');
		$('.faqbtn01').css('color', 'black');
		$('.faqbtn01').css('border', '7px solid #f4f9f2');
		$('.faqbtn01').css('background-color', '#f4f9f2');
		$('.faqbtn03').css('color', 'black');
		$('.faqbtn03').css('border', '7px solid #f4f9f2');
		$('.faqbtn03').css('background-color', '#f4f9f2');
	});

	$('.faqbtn03').click(function() {
		$(this).css('color', 'white');
		$(this).css('border', '7px solid #7c8f83');
		$(this).css('background-color', '#7c8f83');
		$('.faqbtn00').css('color', 'black');
		$('.faqbtn00').css('border', '7px solid #f4f9f2');
		$('.faqbtn00').css('background-color', '#f4f9f2');
		$('.faqbtn01').css('color', 'black');
		$('.faqbtn01').css('border', '7px solid #f4f9f2');
		$('.faqbtn01').css('background-color', '#f4f9f2');
		$('.faqbtn02').css('color', 'black');
		$('.faqbtn02').css('border', '7px solid #f4f9f2');
		$('.faqbtn02').css('background-color', '#f4f9f2');
	});

});