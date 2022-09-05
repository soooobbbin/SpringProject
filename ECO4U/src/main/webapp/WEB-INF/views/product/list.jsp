<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product-list.css">
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
	<div class="container">
		<hr>
		<div class="list-header">
			<div class="category">
				<form action="list.do" id="search_form"  method="get">
					<ul class="product-category-ul" id="category" name="category">
						<li><a class="cate" href="/product/list.do?p_category=0&order=${order}" <c:if test="${param.p_category==0}">style="font-weight:bolder;"</c:if>>ALL</a></li>
						<li><a class="cate" href="/product/list.do?p_category=1&order=${order}" <c:if test="${param.p_category==1}">style="font-weight:bolder;"</c:if>>Living</a></li>
						<li><a class="cate" href="/product/list.do?p_category=2&order=${order}" <c:if test="${param.p_category==2}">style="font-weight:bolder;"</c:if>>Beauty</a></li>
						<li><a class="cate" href="/product/list.do?p_category=3&order=${order}" <c:if test="${param.p_category==3}">style="font-weight:bolder;"</c:if>>Fashion</a></li>
					</ul>
				</form>
			</div>
			<div class="order">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 정렬 <!-- 아래 화살표 -->
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item"
						href="/product/list.do?p_category=${p_category}&order=new">신상품순</a></li>
					<li><a class="dropdown-item"
						href="/product/list.do?p_category=${p_category}&order=hignPrice">높은가격순</a></li>
					<li><a class="dropdown-item"
						href="/product/list.do?p_category=${p_category}&order=lowPrice">낮은가격순</a></li>
					<li><a class="dropdown-item"
						href="/product/list.do?p_category=${p_category}&order=review">리뷰많은순</a></li>
				</ul>
			</div>
		</div>
			<hr class="bhr">
			<div class="row cardmargin">
				<c:forEach var="product" items="${list}" varStatus="status">
					<div class="col" style="margin-top: 15px;">
						<div class="card" style="width: 300px; border: 0px;">
							<a href="/product/detail.do?p_num=${product.p_num}"
								class="btn btn-primary stretched-link"
								style="background-color: #f4f9f2; color: #000000; border-color: #f4f9f2;">
								<img class="card-img-top"
								style="width: 278px; height: 200px; position: relative; top: 0px; left: 0px; z-index: 100; opacity: 1; transition: opacity 500ms linear 0s;"
								src="/ex/resources/${product.p_photo}" alt="thumbnail">
								<div class="card-body">
									<span class="p_name">[${product.p_brand}]</span>
									<span class="p_name">${product.p_name}</span><br>
									<span class="price">￦<fmt:formatNumber type="number"
											maxFractionDigits="3" value="${product.p_price}" /></span>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="page align-center">${page}</div>
</div>
<!-- 내용 끝 -->