$(function(){
	//검색 유효성 체크
	$('#search_form').submit(function(){
		if($('#keyword').val().trim()==''){
			alert('검색어를 입력하세요!');
			$('#keyword').val('').focus();
			return false;
		}
	});
	
	$('#faq-arrow2').hide();
	$('#faq-arrow-show').hide();
	
	$('#faq-arrow').click(function(){
		$('#faq-arrow').hide();
		$('#faq-arrow2').show();
		$('#faq-arrow-show').show();
	});
	
	$('#faq-arrow2').click(function(){
		$('#faq-arrow2').hide();
		$('#faq-arrow').show();
		$('#faq-arrow-show').hide();
	});
	
	$('#faqspan1').click(function(){
		$('#faqspan1').css('border-bottom','3px solid #7c8f83');
		$('#faqspan2').css('border-bottom','none');
		$('#faqspan3').css('border-bottom','none');
	});
	
	$('#faqspan2').click(function(){
		$('#faqspan2').css('border-bottom','3px solid #7c8f83');
		$('#faqspan1').css('border-bottom','none');
		$('#faqspan3').css('border-bottom','none');
	});
	
	$('#faqspan3').click(function(){
		$('#faqspan3').css('border-bottom','3px solid #7c8f83');
		$('#faqspan1').css('border-bottom','none');
		$('#faqspan2').css('border-bottom','none');
	});
});