<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 내용 시작 -->
<!-- include libraries(jquery,bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<!-- include ckeditor js -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/faq.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/faq.js"></script>
<div class="faq_write_main">
	<h2 style="font-weight:bold">FAQ<span style="font-size:11px; font-weight:none">(공지수정)</span></h2>
	<hr class="faq_write_hr" size="3" width="112px" align="left">
	<form:form action="faqupdate.do" modelAttribute="fAQVO" id="update_form" enctype="multipart/form-data">
 	<form:hidden path="f_num"/>    
	    <form:errors element="div" cssClass="error-color"/>
	    <ul class="f_title_li">
			<li>
			<select name="f_category" id="f_category">
				<option value="1"<c:if test="${faq.f_category == 1}">selected</c:if>>회원문의</option>
				<option value="2"<c:if test="${faq.f_category == 2}">selected</c:if>>상품/배송문의</option>
				<option value="3"<c:if test="${faq.f_category == 3}">selected</c:if>>기타</option>
			</select>
			<form:input path="f_title" placeholder="제목을 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder = '제목을 입력하세요.'" autocomplete="off"/>
			<form:errors path="f_title" cssClass="error-color"/>
			</li>
			<li>
				<form:textarea path="f_content" placeholder="내용을 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder = '내용을 입력하세요.'" autocomplete="off"/>
				<form:errors path="f_content" cssClass="error-color"/>
				<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor
		            .create( document.querySelector( '#f_content' ),{
		            	extraPlugins: [MyCustomUploadAdapterPlugin]
		            })
		            .then( editor => {
						window.editor = editor;
					} )
		            .catch( error => {
		                console.error( error );
		            } );
			    </script>   
			</li>
			
		</ul>
		<div class="align-left" id="faq_write_btn01">
			<form:button>수정</form:button>
			<input type="button" value="목록" onclick="location.href='faqlist.do'">
		</div>
	<%-- 	   	<ul>
			<li>
				<label for="title">제목</label>
				<form:input path="title"/>
				<form:errors path="title" 
				             cssClass="error-color"/>
			</li>
			<li><b>내용</b></li>
			<li>
				<form:textarea path="content"/>
				<form:errors path="content" cssClass="error-color"/>
			<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor
		            .create( document.querySelector( '#content' ),{
		            	extraPlugins: [MyCustomUploadAdapterPlugin]
		            })
		            .then( editor => {
						window.editor = editor;
					} )
		            .catch( error => {
		                console.error( error );
		            } );
			    </script>
			</li>
			<li>
				<label for="upload">파일업로드</label>
				<input type="file" name="upload" id="upload">
				<c:if test="${!empty boardVO.filename}">
				<div id="file_detail">
					(${boardVO.filename})파일 등록
					<input type="button" value="파일삭제"
					                      id="file_del">
				</div>
				<script type="text/javascript">
					$(function(){
						$('#file_del').click(function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								$.ajax({
									url:'deleteFile.do',
									data:{board_num:${boardVO.board_num}},
									type:'post',
									dataType:'json',
									cache:false,
									timeout:30000,
									success:function(param){
										if(param.result == 'logout'){
											alert('로그인 후 사용하세요!');
										}else if(param.result == 'success'){
											$('#file_detail').hide();
										}else{
											alert('파일 삭제 오류 발생');
										}
									},
									error:function(){
										alert('네트워크 오류 발생');
									}
								});
							}
						});
					});
				</script>
				</c:if>
			</li>
		</ul>    
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="목록"
			            onclick="location.href='list.do'">
		</div>  --%>   
	</form:form>
</div>
<!-- 내용 끝 -->