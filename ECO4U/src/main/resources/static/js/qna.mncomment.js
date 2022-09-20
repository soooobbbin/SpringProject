$(function(){
	let currentPage;
	let count;
	let rowCount;
	
	//댓글 목록
	function selectQnAList(pageNum){
		currentPage = pageNum;
		
		//로딩 이미지 노출
		$('#loading').show();
		
		$.ajax({
			url:'listComment.do',
			type:'post',
			data:{pageNum:pageNum,q_num:$('#q_num').val()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				//로딩 이미지 감추기
				$('#loading').hide();
				count = param.count;
				rowCount = param.rowCount;
				
				if(pageNum == 1){
					//처음 호출시는 해당 ID의 div의 내부
					//내용물을 제거
					$('#output').empty();
				}
				
				//댓글 목록 작업
				$(param.list).each(function(index,item){
					
					let output = '<div class="item">';
					//로그인한 회원번호와 댓글 작성자 회원번호가 일치
					if(item.auth==2){
					output += '<div class="managerbox">' + (/\r\n/g,'<br>');
					output += '<span id="commentname" style="margin-left:1%">' + '나' + '</span>';
					output += '<div class="sub-item">';
					output += '<p style="color:black; margin-left:1%">' + item.qc_content.replace(/\r\n/g,'<br>') + '</p>';
					
					if(item.modify_date){
						output += '<span class="modify-date" style="margin-left:1%">최근 수정일 : ' + item.modify_date + '</span>';
					}else{
						output += '<span class="modify-date" style="margin-left:1%">' + item.reg_date + '</span>';
					}
					
					output += ' <input type="button" data-num="'+ item.qc_num +'" value="삭제" class="delete-btn">';
					output += '<span style="float:right; font-weight:bold">' + '&nbsp;&nbsp;|&nbsp;' + '</span>';
					output += ' <input type="button" data-num="'+ item.qc_num +'" value="수정" class="modify-btn">';
					output += '</div>';
					}else{
						output += '<span id="commentname">';
						output += item.mem_name + '님' + '</span>';
						output += '<div class="sub-item">';
						output += '<p style="color:black;">' + item.qc_content.replace(/\r\n/g,'<br>') + '</p>';
						
						if(item.modify_date){
							output += '<span class="modify-date">최근 수정일 : ' + item.modify_date + '</span>';
						}else{
							output += '<span class="modify-date">' + item.reg_date + '</span>';
						}
					}
					
					output += '<hr size="1" noshade>';
					output += '</div>';
					output += '</div>'; 
					
					//문서 객체에 추가
					$('#output').append(output);
				});
				
				//paging button 처리
				if(currentPage>=Math.ceil(count/rowCount)){
					//다음 페이지가 없음
					$('.paging-button').hide();
				}else{
					//다음 페이지가 존재
					$('.paging-button').show();
				}
			},
			error:function(){
				//로딩 이미지 감추기
				 $('#loading').hide();
				 alert('네트워크 오류 발생 등록 폼');
			}
		});
		
	}
	
	//다음 댓글 보기 버튼 클릭시 데이터 추가
	$('.paging-button input').click(function(){
		selectQnAList(currentPage + 1);
	});
	
	//댓글 등록
	$('#qcom_form').submit(function(event){
		if($('#qc_content').val().trim()==''){
			alert('내용을 입력하세요');
			$('#qc_content').val('').focus();
			return false;
		}
		
		let form_data = $(this).serialize();
		//데이터 전송
		$.ajax({
			url:'writeComment.do',
			type:'post',
			data:form_data,
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result=='logout'){
					alert('로그인해야 작성할 수 있습니다.');
				}else if(param.result=='success'){
					//폼 초기화
					initForm();
					//댓글 작성이 성공하면 새로 삽입한 글을
					//포함해서 첫번째 페이지의 게시글을 다시 
					//호출
					selectQnAList(1);
				}
			},
			error:function(){
				alert('네트워크 문의 등록 오류 발생');
			}
		});
		//기본 이벤트 제거
		event.preventDefault();
	});
	
	//댓글 작성 폼 초기화
	function initForm(){
		$('textarea').val('');
		$('#qc_first .letter-count').text('300/300');
	}
	//textarea에 내용 입력시 글자수 체크
	//댓글 수정 버튼 클릭시 수정 폼 노출
	$(document).on('click','.modify-btn',function(){
		//댓글 글번호
		let qc_num = $(this).attr('data-num');
		//댓글 내용
		let content = $(this).parent().find('p').html().replace(/<br>/g,'\r\n');
		
		//댓글 수정폼 UI
		let modifyUI = '<form id="mqc_form">';
		modifyUI += '<input type="hidden" name="qc_num" id="mqc_num" value="'+ qc_num +'">';
		modifyUI += '<textarea rows="1" cols="100" name="qc_content" id="mqc_content" class="qcom-content">'+ content +'</textarea>';
		modifyUI += '<div id="mqc_second" class="align-right">';
		modifyUI += ' <input type="button" value="취소" class="qc-reset">';
		modifyUI += '<span style="float:right; font-weight:bold">' + '&nbsp;&nbsp;|&nbsp;' + '</span>';
		modifyUI += '<input type="submit" value="완료">';
		modifyUI += '</div>';
		modifyUI += '<hr size="1" noshade width="100%">';
		modifyUI += '</form>';
		
		//이전에 이미 수정하는 댓글이 있을 경우 수정 버튼을
		//클릭하면 숨김 sub-item을 환원시키고 수정폼을 초기화
		//함
		initModifyForm();
		
		//지금 클릭해서 수정하고자 하는 데이터는 감추기
		$(this).parent().hide();
		
		//수정 폼을 수정하고자 하는 데이터가 있는 div에 노출
		$(this).parents('.item').append(modifyUI);
		
		//입력한 글자수 셋팅
		let inputLength = $('#mqc_content').val().length;
		let remain = 300 - inputLength;
		remain += '/300';
		
		//문서 객체에 반영
		$('#mqc_first .letter-count').text(remain);
		
	});
	//수정 폼에서 취소 버튼 클릭시 수정 폼 초기화
	$(document).on('click','.qc-reset',function(){
		initModifyForm();
	});
	//수정 폼 초기화
	function initModifyForm(){
		$('.sub-item').show();
		$('#mqc_form').remove();
	}
	//댓글 수정
	$(document).on('submit','#mqc_form',function(event){
		if($('#mqc_content').val().trim()==''){
			alert('내용을 입력하세요!');
			$('#mqc_content').val('').focus();
			return false;
		}
		
		//폼에 입력한 데이터 반환
		let form_data = $(this).serialize();
		
		//수정
		$.ajax({
			url:'updateComment.do',
			type:'post',
			data:form_data,
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result=='logout'){
					alert('로그인해야 수정할 수 있습니다.');
				}else if(param.result=='success'){
					$('#mqc_form').parent()
					              .find('p')
                                  .html($('#mqc_content').val()
                                         .replace(/</g,'&lt;')
                                         .replace(/>/g,'&gt;')
                                         .replace(/\r\n/g,'<br>')
                                         .replace(/\r/g,'<br>')
                                         .replace(/\n/g,'<br>'));
                    //최근 수정일 처리
                    $('#mqc_form').parent()
                                  .find('.modify-date')
                                  .text('최근 수정일 : 5초미만');
					//수정폼 초기화
					initModifyForm();
				}else if(param.result=='wrongAccess'){
					alert('타인의 글은 수정할 수 없습니다.');
				}else{
					alert('수정시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생 댓글 수정');
			}
		});
		//기본 이벤트 제거
		event.preventDefault();
	});
	//댓글 삭제
	$(document).on('click','.delete-btn',function(){
		//댓글 번호
		let qc_num = $(this).attr('data-num');
		
		$.ajax({
			url:'deleteComment.do',
			type:'post',
			data:{qc_num:qc_num},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 삭제할 수 있습니다.');
				}else if(param.result == 'success'){
					alert('삭제 완료!');
					selectQnAList(1);
				}else if(param.result == 'wrongAccess'){
					alert('타인의 글을 삭제할 수 없습니다.');
				}else{
					alert('댓글 삭제시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});
	
	//초기 데이터(목록) 호출
	selectQnAList(1);
	
});




