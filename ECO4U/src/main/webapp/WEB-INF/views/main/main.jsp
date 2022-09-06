<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#section1 {
	position: relative;
	margin-top:-10px;
	height:865px;
    background-color: aliceblue;
}
#section2 {
	position: relative;
	height:930px;
    background-color: lightpink;
}
#section3 {
	position: relative;
	height:930px;
    background-color: coral;
}
#section4 {
	position: relative;
	height:925px;
    background-color: aqua;
}
</style>
<script>
    var mHtml = $("html");
    var page = 1;
    
    
    mHtml.animate({scrollTop : 0},10);
    
    $(window).on("wheel", function(e) {
        if(mHtml.is(":animated")) return;
        if(e.originalEvent.deltaY > 0) {
            if(page == 4) return;
            page++;
        } else if(e.originalEvent.deltaY < 0) {
            if(page == 1) return;
            page--;
        }
        var posTop =(page-1) * $(window).height();
        mHtml.animate({scrollTop : posTop});
    });
</script>
<!-- 메인 시작 -->
    <div class="section" id="section1">1</div>
    <div class="section" id="section2">2</div>
    <div class="section" id="section3">3</div>
    <div class="section" id="section4">4</div>
<!-- 메인 끝 -->