<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<!-- 내용 시작 -->
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
<!-- 내용 끝 -->