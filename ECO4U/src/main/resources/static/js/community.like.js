$(function(){
	//좋아요 읽기
	//좋아요 선택 여부와 선택한 총개수 표시
	function selectData(c_num){
		$.ajax({
			url:'getLike.do',
			type:'post',
			data:{c_num:c_num},
			dataType:'json',
			cache:false,
			timeout:10000,
			success:function(param){
				displayLike(param);
			},
			error:function(){
				alert('네트워크 오류 발생 : 좋아요 수 조회');
			}
		});
	}
	
	//좋아요 등록
	$('#output_like').click(function(){
		$.ajax({
			url:'writeLike.do',
			type:'post',
			data:{c_num:$('#c_num').val()},
			dataType:'json',
			cache:false,
			timeout:10000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 좋아요를 눌러주세요!');
				}else if(param.result == 'success'){
					displayLike(param);
				}else{
					alert('좋아요 등록시 오류 발생!');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});//좋아요 등록 끝 
	
	//좋아요 표시
	function displayLike(param){
		let output;
		if(param.status == 'noLike'){
			output = '../images/community/like01.png';
		}else{
			output = '../images/community/like02.png';
		}
		//문서 객체에 추가
		$('#output_like').attr('src',output);
		$('#output_lcount').text(param.count);
	}//좋아요 표시 끝
	
	//초기 데이터 표시
	selectData($('#c_num').val());
	
});