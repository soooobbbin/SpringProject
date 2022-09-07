<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<!-- 내용 시작 -->
<script>
$(function(){
    var mHtml = $("html");
    var page = 1;
    
    
    var lnb = $("#menu_full").offset().top;
    
    $(window).scroll(function() {
    	var window = $(this).scrollTop();
       if(lnb <= window) {
         $("#menu_full").addClass("fixed");
       } else {
         $("#menu_full").removeClass("fixed");
       }
     });
    
    mHtml.animate({scrollTop : 0},10);
    
    $(window).on("wheel", function(e) {
        if(mHtml.is(":animated")) return;
        if(e.originalEvent.deltaY > 0) {
            if(page == 3) return;
            page++;
        } else if(e.originalEvent.deltaY < 0) {
            if(page == 1) return;
            page--;
        }
        var posTop =(page-1) * $(window).height();
        mHtml.animate({scrollTop : posTop});
		
   		
    });
}); 
   
</script>
<!-- 메인 시작 -->
	<div class="section" id="section1">
    	<ul id="menu_full"><!--오른쪽 페이지 네이트 인덱스입니다.-->
    	<li data-menuanchor="anchor1" class="active"><a href="#section1">01</a></li><!--01번째 이미지 인덱스입니다.-->
		  <li data-menuanchor="anchor2"><a href="#section2">02</a></li><!--02번째 이미지 인덱스입니다.-->
		  <li data-menuanchor="anchor3"><a href="#section3">03</a></li><!--03번째 이미지 인덱스입니다.-->
		  <!--오른쪽 페이지 네이트 인덱스입니다.-->  
		</ul>
		<div class="col-sm-12">
			<div id="myslide" class="carousel slide" data-ride="carousel">
				<ul class="carousel-indicators">
					<li data-target="#myslide" data-slide-to="0" class="active"></li>
					<li data-target="#myslide" data-slide-to="1"></li>
					<li data-target="#myslide" data-slide-to="2"></li>
				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="${pageContext.request.contextPath}/images/main/slide-1.png"
							class="slide-1">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/images/main/slide-2.jpg"
							class="slide-2">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/images/main/slide-3.jpg"
							class="slide-3">
					</div>
				</div>
				<a class="carousel-control-prev" href="#myslide" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#myslide" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
	</div>
    <div class="section" id="section2">2</div>
    <div class="section" id="section3">3</div>
<!-- 메인 끝 -->
<!-- 내용 끝 -->