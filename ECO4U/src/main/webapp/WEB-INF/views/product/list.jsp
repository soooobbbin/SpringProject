<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 내용 시작 -->
<div class="page-main">
	<div class="row">
		<div class="col-sm-12 ">
			<div id="myslide" class="carousel slide" data-ride="carousel">
				<ul class="carousel-indicators">
					<li data-target="#myslide" data-slide-to="0" class="active"></li>
					<li data-target="#myslide" data-slide-to="1"></li>
					<li data-target="#myslide" data-slide-to="2"></li>
				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="${pageContext.request.contextPath}/images/product/slide-1.png"
							class="slide-1">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/images/product/slide-2.png"
							class="slide-2">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/images/product/slide-3.png"
							class="slide-3">
					</div>
				</div>
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
	</div>
	<div class="container" >
		<hr>
		<div class="row">
		<input type="hidden" id="product_category_name" value="${product_category_name}">
	<input type="hidden" id="order" value="${order}">   
	<div class="form-row justify-content-center">
		<h4 align="center">${product_category_name}</h4>	
	</div>	
	<div class="form-row justify-content-center" id="categories">
		<div class="form-group col-md-4" >
			<ul class="list-group list-group-horizontal">		
				<li class="list-group-item">
				<div class="dropdown-menu">
					<a class="dropdown-item" href="/product/list.do">ALL</a>
					<a class="dropdown-item" href="/product/list.do?p_category=1">Living</a>
					<a class="dropdown-item" href="/product/list.do?p_category=2">Beauty</a>
					<a class="dropdown-item" href="/product/list.do?p_category=3">Fashion</a>					       					       
				</div>
				</li>
				<div class="btn-group">
					<button class="btn btn-secondary btn-sm dropdown-toggle"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						최신순</button>
					<ul class="dropdown-order">
						<li><a class="dropdown-item" href="#">최신순</a></li>
						<li><a class="dropdown-item" href="#">높은가격순</a></li>
						<li><a class="dropdown-item" href="#">낮은가격순</a></li>
						<li><a class="dropdown-item" href="#">리뷰많은순</a></li>
					</ul>
				</div>
			</ul>	
		</div>	
		<div class="form-group col-md-8" >
			<ul class="list-group list-group-horizontal">
				<li class="list-group-item">
					<div class="custom-control custom-radio">
						<input type="radio" name="searchOption"  id="option1" value="PRODUCT.PRODUCTNAME" class="custom-control-input" checked>
						<label class="custom-control-label" for="option1">이름</label>
					</div>
				</li>
				<li class="list-group-item">	
					<div class="custom-control custom-radio">
						<input type="radio" name="searchOption"  id="option2" value="PRODUCT_NAME.PRODUCT_NAME_TITLE" class="custom-control-input">
						<label class="custom-control-label" for="option2">제목</label>
					</div>							
				</li>												  				  
				<li class="list-group-item">
					<form class="form-inline">
						<input class="form-control form-control-sm mr-3 w-75" id="searchWord" type="text" placeholder="Search"
							aria-label="Search" value="${searchWord}">
						<a id="searchBtn" href="#"><i class="fas fa-search" aria-hidden="true"></i></a>
					</form>
				</li>		  
			</ul>		
		</div>
	</div>		  	

	<div id="mainList" class="row"></div>

			<div class="col-sm">
				<hr>
				<div class="row cardmargin">
					<c:forEach items="${ProductVO}" var="pvo">
                  <div class="col" style="margin-top: 15px;">
                     <ul>
                        <li>
                           <div class="card" style="width: 300px; border: 0px;">
                              <a href="itemview?pd_id=${dto.pd_id}" class="btn btn-primary stretched-link" style="background-color: #F9F9F9; color: #000000; border-color: #F9F9F9;">
                                   <img class="card-img-top" style="width: 278px; height:200px; position: relative; top: 0px; left: 0px; z-index: 100; opacity: 1; transition: opacity 500ms linear 0s;"   src="/ex/resources/${dto.img}" alt="Card image">
                                 <div class="card-body">
                                    <h4 class="card-title">${pvo.p_name}</h4>
                                    <p class="card-text">${dto.rg_id}</p>
                                    <span>가격: <fmt:formatNumber value="${pvo.p_price}" pattern="#,###"/></span>
                                       
                                 </div>
                              </a>
                           </div>
                    
                        </li>
                     </ul>
                  
                  </div>
               </c:forEach>
				</div>
				</div>
								
			</div>
		</div>
</div>
<!-- 내용 끝 -->