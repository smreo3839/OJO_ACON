<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<jsp:include page="/include/lib_common.jsp"/>
	<title>StudyClub에 오신것을 환영합니다.d</title>
</head>
<body class="">
	<jsp:include page="/include/header_common.jsp"/>
	<!-- page-inner:s -->
	<div class="page-inner">


		<!--/ Carousel Star /-->
		<div class="intro intro-carousel">
		 <div id="carousel" class="owl-carousel owl-theme">
			<div class="carousel-item-a intro-item bg-image" style="background-image: url(${designPath}/img/main1.jpg)">
			  <div class="overlay overlay-a"></div>
			  <div class="intro-content display-table">
				 <div class="table-cell">
					<div class="container">
					  <div class="row">
						 <div class="col-lg-8">
							<div class="intro-body">
							  <p class="intro-title-top">Seoul, Gangnam
							  <h1 class="intro-title mb-4">
								  Welcome !
								 <br> STUDY <span class="color-b">CLUB </span> </h1> 
							  <p class="intro-subtitle intro-price">
								 <a href="#"><span class="price-a"> 둘러보기</span></a>
							  </p>
							</div>
						 </div>
					  </div>
					</div>
				 </div>
			  </div>
			</div>
			<div class="carousel-item-a intro-item bg-image" style="background-image: url(${designPath}/img/main2.jpg)">
			  <div class="overlay overlay-a"></div>
			  <div class="intro-content display-table">
				 <div class="table-cell">
					<div class="container">
					  <div class="row">
						 <div class="col-lg-8">
							<div class="intro-body">
							  <p class="intro-title-top">Incheon, Wonsoo
							  <h1 class="intro-title mb-4">
								  Welcome !
								 <br> STUDY <span class="color-b">CLUB </span> </h1> 
							  <p class="intro-subtitle intro-price">
								 <a href="#"><span class="price-a"> 방 둘러보기</span></a>
							  </p>
							</div>
						 </div>
					  </div>
					</div>
				 </div>
			  </div>
			</div>
			<div class="carousel-item-a intro-item bg-image" style="background-image: url(${designPath}/img/main3.jpg)">
			  <div class="overlay overlay-a"></div>
			  <div class="intro-content display-table">
				 <div class="table-cell">
					<div class="container">
					  <div class="row">
						 <div class="col-lg-8">
							<div class="intro-body">
							  <p class="intro-title-top">Busan, Haewoondae
							  <h1 class="intro-title mb-4">
								  Welcome !
								 <br> STUDY <span class="color-b">CLUB </span> </h1> 
							  <p class="intro-subtitle intro-price">
								 <a href="#"><span class="price-a"> 방 둘러보기</span></a>
							  </p>
							</div>
						 </div>
					  </div>
					</div>
				 </div>
			  </div>
			</div>
		 </div>
		</div>
		<!--/ Carousel end /-->

		<!--/ Services Star /-->
		<section class="section-services section-t8">
		 <div class="container">
			<div class="row">
			  <div class="col-md-12">
				 <div class="title-wrap d-flex justify-content-between">
					<div class="title-box">
					  <h2 class="title-a">Our Services</h2>
					</div>
				 </div>
			  </div>
			</div>
			<div class="row">
			  <div class="col-md-4">
				 <div class="card-box-c foo">
					<div class="card-header-c d-flex">
					  <div class="card-box-ico">
						 <span class="fa fa-users"></span>
					  </div>
					  <div class="card-title-c align-self-center">
						 <h2 class="title-c">People</h2>
					  </div>
					</div>
					<div class="card-body-c">
					  <p class="content-c">
						이직을 원하는 직장인, 면접을 준비중인 취준생, 자격증 준비중인 수험생, 당신의 든든한 동료가 되어줄 같은 목표를 가진 친구들이 모두 모여있습니다
					  </p>
					</div>
					<div class="card-footer-c">
					  <a href="#" class="link-c link-icon">Read more
						 <span class="ion-ios-arrow-forward"></span>
					  </a>
					</div>
				 </div>
			  </div>
			  			  <div class="col-md-4">
				 <div class="card-box-c foo">
					<div class="card-header-c d-flex">
					  <div class="card-box-ico">
						 <span class="fa fa-home"></span>
					  </div>
					  <div class="card-title-c align-self-center">
						 <h2 class="title-c">Share</h2>
					  </div>
					</div>
					<div class="card-body-c">
					  <p class="content-c">
					 전국 각지의 모든 깔끔하고 조용한 공간이 한 눈에 모여있으니 함께할 동료들이 있다면 공간은 우리에게 맡기세요! 
					  </p>
					</div>
					<div class="card-footer-c">
					  <a href="#" class="link-c link-icon">Read more
						 <span class="ion-ios-arrow-forward"></span>
					  </a>
					</div>
				 </div>
			  </div>
			  <div class="col-md-4">
				 <div class="card-box-c foo">
					<div class="card-header-c d-flex">
					  <div class="card-box-ico">
						 <span class="fa fa-heart"></span>
					  </div>
					  <div class="card-title-c align-self-center">
						 <h2 class="title-c">Exprience</h2>
					  </div>
					</div>
					<div class="card-body-c">
					  <p class="content-c">
						 제공된 공간과 함께한 동료들을 위해 다른 사용자들이 남긴 경험들을 함께 나눌 수 있어요.
						 직접 사용한 사용자만 리뷰가 올라오기때문에 안심하고 고를 수 있어요 
					  </p>
					</div>
					<div class="card-footer-c">
					  <a href="#" class="link-c link-icon">Read more
						 <span class="ion-ios-arrow-forward"></span>
					  </a>
					</div>
				 </div>
			  </div>

			</div>
		 </div>
		</section>
		<!--/ Services End /-->

		<!--/ Property Star /
		<section class="section-property section-t8">
		 <div class="container">
			<div class="row">
			  <div class="col-md-12">
				 <div class="title-wrap d-flex justify-content-between">
					<div class="title-box">
					  <h2 class="title-a">Latest Properties</h2>
					</div>
					<div class="title-link">
					  <a href="property-grid.html">All Property
						 <span class="ion-ios-arrow-forward"></span>
					  </a>
					</div>
				 </div>
			  </div>
			</div>
			<div id="property-carousel" class="owl-carousel owl-theme">
			  <div class="carousel-item-b">
				 <div class="card-box-a card-shadow">
					<div class="img-box-a">
					  <img src="${designPath}/img/property-6.jpg" alt="" class="img-a img-fluid">
					</div>
					<div class="card-overlay">
					  <div class="card-overlay-a-content">
						 <div class="card-header-a">
							<h2 class="card-title-a">
							  <a href="property-single.html">206 Mount
								 <br /> Olive Road Two</a>
							</h2>
						 </div>
						 <div class="card-body-a">
							<div class="price-box d-flex">
							  <span class="price-a">rent | $ 12.000</span>
							</div>
							<a href="#" class="link-a">Click here to view
							  <span class="ion-ios-arrow-forward"></span>
							</a>
						 </div>
						 <div class="card-footer-a">
							<ul class="card-info d-flex justify-content-around">
							  <li>
								 <h4 class="card-info-title">Area</h4>
								 <span>340m
									<sup>2</sup>
								 </span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Beds</h4>
								 <span>2</span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Baths</h4>
								 <span>4</span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Garages</h4>
								 <span>1</span>
							  </li>
							</ul>
						 </div>
					  </div>
					</div>
				 </div>
			  </div>
			  <div class="carousel-item-b">
				 <div class="card-box-a card-shadow">
					<div class="img-box-a">
					  <img src="${designPath}/img/property-3.jpg" alt="" class="img-a img-fluid">
					</div>
					<div class="card-overlay">
					  <div class="card-overlay-a-content">
						 <div class="card-header-a">
							<h2 class="card-title-a">
							  <a href="property-single.html">157 West
								 <br /> Central Park</a>
							</h2>
						 </div>
						 <div class="card-body-a">
							<div class="price-box d-flex">
							  <span class="price-a">rent | $ 12.000</span>
							</div>
							<a href="property-single.html" class="link-a">Click here to view
							  <span class="ion-ios-arrow-forward"></span>
							</a>
						 </div>
						 <div class="card-footer-a">
							<ul class="card-info d-flex justify-content-around">
							  <li>
								 <h4 class="card-info-title">Area</h4>
								 <span>340m
									<sup>2</sup>
								 </span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Beds</h4>
								 <span>2</span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Baths</h4>
								 <span>4</span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Garages</h4>
								 <span>1</span>
							  </li>
							</ul>
						 </div>
					  </div>
					</div>
				 </div>
			  </div>
			  <div class="carousel-item-b">
				 <div class="card-box-a card-shadow">
					<div class="img-box-a">
					  <img src="${designPath}/img/property-7.jpg" alt="" class="img-a img-fluid">
					</div>
					<div class="card-overlay">
					  <div class="card-overlay-a-content">
						 <div class="card-header-a">
							<h2 class="card-title-a">
							  <a href="property-single.html">245 Azabu
								 <br /> Nishi Park let</a>
							</h2>
						 </div>
						 <div class="card-body-a">
							<div class="price-box d-flex">
							  <span class="price-a">rent | $ 12.000</span>
							</div>
							<a href="property-single.html" class="link-a">Click here to view
							  <span class="ion-ios-arrow-forward"></span>
							</a>
						 </div>
						 <div class="card-footer-a">
							<ul class="card-info d-flex justify-content-around">
							  <li>
								 <h4 class="card-info-title">Area</h4>
								 <span>340m
									<sup>2</sup>
								 </span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Beds</h4>
								 <span>2</span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Baths</h4>
								 <span>4</span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Garages</h4>
								 <span>1</span>
							  </li>
							</ul>
						 </div>
					  </div>
					</div>
				 </div>
			  </div>
			  <div class="carousel-item-b">
				 <div class="card-box-a card-shadow">
					<div class="img-box-a">
					  <img src="${designPath}/img/property-10.jpg" alt="" class="img-a img-fluid">
					</div>
					<div class="card-overlay">
					  <div class="card-overlay-a-content">
						 <div class="card-header-a">
							<h2 class="card-title-a">
							  <a href="property-single.html">204 Montal
								 <br /> South Bela Two</a>
							</h2>
						 </div>
						 <div class="card-body-a">
							<div class="price-box d-flex">
							  <span class="price-a">rent | $ 12.000</span>
							</div>
							<a href="property-single.html" class="link-a">Click here to view
							  <span class="ion-ios-arrow-forward"></span>
							</a>
						 </div>
						 <div class="card-footer-a">
							<ul class="card-info d-flex justify-content-around">
							  <li>
								 <h4 class="card-info-title">Area</h4>
								 <span>340m
									<sup>2</sup>
								 </span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Beds</h4>
								 <span>2</span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Baths</h4>
								 <span>4</span>
							  </li>
							  <li>
								 <h4 class="card-info-title">Garages</h4>
								 <span>1</span>
							  </li>
							</ul>
						 </div>
					  </div>
					</div>
				 </div>
			  </div>
			</div>
		 </div>
		</section>
		/ Property End /-->

		<!--/ Agents Sta
		<section class="section-agents section-t8">
		 <div class="container">
			<div class="row">
			  <div class="col-md-12">
				 <div class="title-wrap d-flex justify-content-between">
					<div class="title-box">
					  <h2 class="title-a">Best Agents</h2>
					</div>
					<div class="title-link">
					  <a href="agents-grid.html">All Agents
						 <span class="ion-ios-arrow-forward"></span>
					  </a>
					</div>
				 </div>
			  </div>
			</div>
			<div class="row">
			  <div class="col-md-4">
				 <div class="card-box-d">
					<div class="card-img-d">
					  <img src="${designPath}/img/agent-4.jpg" alt="" class="img-d img-fluid">
					</div>
					<div class="card-overlay card-overlay-hover">
					  <div class="card-header-d">
						 <div class="card-title-d align-self-center">
							<h3 class="title-d">
							  <a href="agent-single.html" class="link-two">Margaret Sotillo
								 <br> Escala</a>
							</h3>
						 </div>
					  </div>
					  <div class="card-body-d">
						 <p class="content-d color-text-a">
							Sed porttitor lectus nibh, Cras ultricies ligula sed magna dictum porta two.
						 </p>
						 <div class="info-agents color-a">
							<p>
							  <strong>Phone: </strong> +54 356 945234</p>
							<p>
							  <strong>Email: </strong> agents@example.com</p>
						 </div>
					  </div>
					  <div class="card-footer-d">
						 <div class="socials-footer d-flex justify-content-center">
							<ul class="list-inline">
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-facebook" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-twitter" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-instagram" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-pinterest-p" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-dribbble" aria-hidden="true"></i>
								 </a>
							  </li>
							</ul>
						 </div>
					  </div>
					</div>
				 </div>
			  </div>
			  <div class="col-md-4">
				 <div class="card-box-d">
					<div class="card-img-d">
					  <img src="${designPath}/img/agent-1.jpg" alt="" class="img-d img-fluid">
					</div>
					<div class="card-overlay card-overlay-hover">
					  <div class="card-header-d">
						 <div class="card-title-d align-self-center">
							<h3 class="title-d">
							  <a href="agent-single.html" class="link-two">Stiven Spilver
								 <br> Darw</a>
							</h3>
						 </div>
					  </div>
					  <div class="card-body-d">
						 <p class="content-d color-text-a">
							Sed porttitor lectus nibh, Cras ultricies ligula sed magna dictum porta two.
						 </p>
						 <div class="info-agents color-a">
							<p>
							  <strong>Phone: </strong> +54 356 945234</p>
							<p>
							  <strong>Email: </strong> agents@example.com</p>
						 </div>
					  </div>
					  <div class="card-footer-d">
						 <div class="socials-footer d-flex justify-content-center">
							<ul class="list-inline">
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-facebook" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-twitter" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-instagram" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-pinterest-p" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-dribbble" aria-hidden="true"></i>
								 </a>
							  </li>
							</ul>
						 </div>
					  </div>
					</div>
				 </div>
			  </div>
			  <div class="col-md-4">
				 <div class="card-box-d">
					<div class="card-img-d">
					  <img src="${designPath}/img/agent-5.jpg" alt="" class="img-d img-fluid">
					</div>
					<div class="card-overlay card-overlay-hover">
					  <div class="card-header-d">
						 <div class="card-title-d align-self-center">
							<h3 class="title-d">
							  <a href="agent-single.html" class="link-two">Emma Toledo
								 <br> Cascada</a>
							</h3>
						 </div>
					  </div>
					  <div class="card-body-d">
						 <p class="content-d color-text-a">
							Sed porttitor lectus nibh, Cras ultricies ligula sed magna dictum porta two.
						 </p>
						 <div class="info-agents color-a">
							<p>
							  <strong>Phone: </strong> +54 356 945234</p>
							<p>
							  <strong>Email: </strong> agents@example.com</p>
						 </div>
					  </div>
					  <div class="card-footer-d">
						 <div class="socials-footer d-flex justify-content-center">
							<ul class="list-inline">
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-facebook" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-twitter" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-instagram" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-pinterest-p" aria-hidden="true"></i>
								 </a>
							  </li>
							  <li class="list-inline-item">
								 <a href="#" class="link-one">
									<i class="fa fa-dribbble" aria-hidden="true"></i>
								 </a>
							  </li>
							</ul>
						 </div>
					  </div>
					</div>
				 </div>
			  </div>
			</div>
		 </div>
		</section>
		<!--/ Agents End /-->

		<!--/ News Star /-->
		<section class="section-news section-t8">
		 <div class="container">
			<div class="row">
			  <div class="col-md-12">
				 <div class="title-wrap d-flex justify-content-between">
					<div class="title-box">
					  <h2 class="title-a">가장 많이본 스터디 룸</h2>
					</div>
					<div class="title-link">
					  <a href="${pageContext.request.contextPath}/room/list">전체보기
						 <span class="ion-ios-arrow-forward"></span>
					  </a>
					</div>
				 </div>
			  </div>
			</div>
			
			<div id="new-carousel" class="owl-carousel owl-theme owl-arrow gallery-property">
			<c:forEach  var="MainPage_roomInfo" items="${MainPage_roomInfo}">
				<div class="carousel-item-c">
				  <div class="card-box-b card-shadow news-box">
					<div class="img-box-b">
					  <img src="room/room_img/${MainPage_roomInfo.rprofile}" alt="" class="img-b img-fluid" style="width: 350px;height: 330px;">
					</div>
					<div class="card-overlay">
					  <div class="card-header-b">
						 <div class="card-category-b">
							<a href="#" class="category-b text-light">스터디</a>
						 </div>
						 <div class="card-title-b">
							<h2 class="title-2">
							  <a href="${pageContext.request.contextPath}/room/readDetail?rcode=${MainPage_roomInfo.rcode}">${MainPage_roomInfo.name }
								 <br> 리뷰 평점 : ${MainPage_roomInfo.avgScore }</a>
							</h2>
						 </div>
						 <div class="card-date">
							<span class="date-b">${MainPage_roomInfo.addr}</span>
						 </div>
					  </div>
					</div>
				  </div>
				</div>
			  </c:forEach>
			  <!-- 
			  <div class="carousel-item-c">
				 <div class="card-box-b card-shadow news-box">
					<div class="img-box-b">
					  <img src="${designPath}/img/post-7.jpg" alt="" class="img-b img-fluid">
					</div>
					<div class="card-overlay">
					  <div class="card-header-b">
						 <div class="card-category-b">
							<a href="#" class="category-b">Park</a>
						 </div>
						 <div class="card-title-b">
							<h2 class="title-2">
							  <a href="blog-single.html">Park is comming
								 <br> new</a>
							</h2>
						 </div>
						 <div class="card-date">
							<span class="date-b">18 Sep. 2017</span>
						 </div>
					  </div>
					</div>
				 </div>
			  </div>
			  -->
			</div>
		 </div>
		</section>
		<!--/ News End /-->


<!--/ Testimonials Star /-->
		<section class="section-testimonials section-t8 nav-arrow-a">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="title-wrap d-flex justify-content-between">
							<div class="title-box">
								<h2 class="title-a">최다 좋아요 리뷰</h2>
							</div>
						</div>
					</div>
				</div>
				<div id="testimonial-carousel" class="owl-carousel owl-arrow">
					<c:forEach items="${mostLikeReview}" var="mostLikeReview">
						<div class="carousel-item-a">
							<div class="testimonials-box">
								<div class="row">
									<div class="col-sm-12 col-md-6">
										<div class="testimonial-img">
											<a
												href="${pageContext.request.contextPath}/room/readDetail?rcode=${mostLikeReview.rcode}"><img
												src="room/room_img/${mostLikeReview.rprofile}" alt="" class="img-fluid">
											</a>
										</div>
									</div>
									<div class="col-sm-12 col-md-6">
										<div class="testimonial-ico">
											<span class="ion-ios-quote"></span>
										</div>
										<div class="testimonials-content">
											<p class="testimonial-text">${mostLikeReview.review }</p>
										</div>
										<div class="testimonial-author-box">
											<img
												src="${pageContext.request.contextPath}/room/profile/${mostLikeReview.profile}.jpg"
												alt="" class="testimonial-avatar" style="width: 80px; height: 80px;">
											<h5 class="testimonial-author">${mostLikeReview.name }</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<!--/ Testimonials End /-->
		
	</div>
	<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp"/>
	<jsp:include page="/include/script_common.jsp"/>
</body>
</html>