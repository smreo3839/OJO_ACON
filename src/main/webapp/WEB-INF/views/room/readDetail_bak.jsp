<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

	<title>스터디룸 상세페이지</title>

	<!-- Favicons-->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/vendor/bootstrap2/favicon.ico" type="image/x-icon">

	<!-- Radio and check inputs -->
	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap2/css/skins/square/grey.css" rel="stylesheet">

	<!-- Range slider -->
	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap2/css/ion.rangeSlider.css" rel="stylesheet">

	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap2/css/ion.rangeSlider.skinFlat.css" rel="stylesheet">
	 
	<!-- CSS -->
	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap2/css/slider-pro.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap2/css/date_time_picker.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap2/css/owl.carousel.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap2/css/owl.theme.css" rel="stylesheet">
	<!-- CSS -->
	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap2/css/readDetail.css" rel="stylesheet" type='text/css'>
	
	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap2/css/base.css" rel="stylesheet">

	<link href="${pageContext.request.contextPath}/resources/vendor/template-kit/css/style.css" rel="stylesheet">
	<!-- <!-- Google web fonts -->
	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Gochi+Hand' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/bootstrap2/css/js-load.css" media="screen">
	<script type="text/javascript" src="https://nanati.me/common/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap2/js/js-load.js"></script>
</head>

<body class="bg-white">

  <section class="parallax-window" data-parallax="scroll" data-image-src="${Room_infoVo.rprofile}"
	 data-natural-width="1400" data-natural-height="470">
	 <div class="parallax-content-2">
		<div class="container">
		  <div class="row">
			 <div class="col-md-8 col-sm-8">
				<!-- 총 평점 -->
				<span class="rating">
				  <fmt:parseNumber value="${RoomDetailDTO.avgScore}" integerOnly="true" var="scInt" />
				  <fmt:parseNumber value="${RoomDetailDTO.avgScore*10%10}" integerOnly="true" var="scDec" />
				  <c:forEach var="sc" begin="1" end="${scInt}" step="1">
					 <i class="icon-star voted"></i>
				  </c:forEach>
				  <c:forEach var="sc" begin="${scInt}" end="4" step="1" varStatus="status">
					 <c:if test="${scDec == 0}">
						<i class="icon-star-empty"></i>
					 </c:if>
					 <c:if test="${scDec > 0}">
						<c:if test="${status.first}">
						  <i class="icon-star-half-alt voted"></i>
						</c:if>
						<c:if test="${!status.first}">
						  <i class="icon-star-empty"></i>
						</c:if>
					 </c:if>
				  </c:forEach>
				</span>
				<!-- //총 평점 -->
				<h1>${Room_infoVo.name }</h1>
				<span>${Room_infoVo.addr }</span>
			 </div>
			 <div class="col-md-4 col-sm-4">
				<div id="price_single_main" class="hotel"></div>
			 </div>
		  </div>
		</div>
	 </div>
  </section>
  <!-- End section -->

  <div class="collapse" id="collapseMap">
	 <div id="map" class="map"></div>
  </div>
  <!-- End Map -->

  <div class="container margin_60">
	 <div class="row">
		<div class="col-md-8" id="single_tour_desc">
		  <div id="single_tour_feat">
			 <ul>
				<li><i class=" icon_set_1_icon-59"></i>카페</li>
				<li><i class="icon_set_1_icon-86"></i>Free Wifi</li>
				<li><i class="icon_set_1_icon-47"></i>흡연금지</li>
				<li><i class="icon_set_1_icon-58"></i>식사</li>
				<li><i class=" icon_set_1_icon-83"></i>시간당 3000원</li>
				<li><i class="icon_set_1_icon-27"></i>주차장</li>
			 </ul>
		  </div>

		  <div class="row">
			 <div class="col-md-3">
				<h3>Rooms Types</h3>
			 </div>
			 <div class="col-md-9">
				<h4>Single Room</h4>
				<p>Lorem ipsum dolor sit amet, at omnes deseruisse pri. Quo
				  aeterno legimus insolens ad. Sit cu detraxit constituam, an mel
				  iudico constituto efficiendi.</p>
			 </div>
			 <!-- End col-md-9  -->
		  </div>
		  <!-- End row  -->
		  <!-- 				<p class="visible-sm visible-xs">
			<a class="btn_map" data-toggle="collapse" href="#collapseMap"
			aria-expanded="false" aria-controls="collapseMap">View on map</a>
			</p> -->
		  <!-- Map button for tablets/mobiles -->
		  <H1>${resourcePath}</H1>
		  <div id="Img_carousel" class="slider-pro">
			 <div class="sp-slides">

				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.rprofile}">
				</div>
				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.thumb}">
				</div>
				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.thdetail01}">
				</div>
				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.thdetail02}">
				</div>

				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.thdetail03}">
				</div>

				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.thdetail04}">
				</div>

				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.thdetail05}">
				</div>

				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.thdetail06}">
				</div>

				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.thdetail07}">
				</div>

				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.thdetail08}">
				</div>
				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.thdetail09}">
				</div>
				<div class="sp-slide">
				  <img alt="" class="sp-image" src="../src/css/images/blank.gif" data-src="${Room_infoVo.thdetail010}">
				</div>
			 </div>
			 <div class="sp-thumbnails">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.rprofile}">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.thumb}">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.thdetail01}">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.thdetail02}">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.thdetail03}">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.thdetail04}">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.thdetail05}">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.thdetail06}">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.thdetail07}">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.thdetail08}">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.thdetail09}">
				<img alt="" class="sp-thumbnail" src="${Room_infoVo.thdetail010}">
			 </div>
		  </div>
		  <hr>
		  <div class="row">
			 <div class="col-md-3">
				<h3>Reviews</h3>
				<a href="#" class="btn btn-success add_bottom_30" data-toggle="modal" data-target="#myReview"
				  onclick="idCheck();">리뷰
				  쓰기</a>
			 </div>
			 <c:if test="${empty roomContent}">
				<div class="text-center mt-5 mb-5">
				  <h2 class="pt-5 pb-5">리뷰가 없습니다.</h2>
				</div>
			 </c:if>
			 <c:if test="${!empty roomContent}">
				<div class="col-md-9">
				  <div id="score_detail">
					 <h2>리뷰 총 평점</h2>
					 <span>${RoomDetailDTO.avgScore}</span>
					 <small style="font-weight: bold;">(Based on ${RoomDetailDTO.reviewCount} reviews)</small>
				  </div>
				  <hr>
				  <div id="contents">
					 <div id="js-load" class="main">
						<c:forEach var="roomContent" items="${roomContent}">
						  <c:if test="${roomContent.ucode eq sessionScope.member.ucode }">
							 <div class="review_strip_single lists__item js-load">
								<c:if test="${roomContent.ucode eq sessionScope.member.ucode }">
								  <button type="button" class="close" data-dismiss="modal" aria-label="Close"
									 onclick="idCheck2();" style="position: absolute; right: 0; top: 0; z-index: 100;">
									 <span aria-hidden="true">&times;</span>
								  </button>
								</c:if>
								<img src="profile/${roomContent.profile}.jpg" alt="" class="img-circle"
								  style="width: 80px; height: 80px;">
								<small>- ${roomContent.regdate } -</small>
								<h4>${roomContent.name}</h4>
								<div class="rating">
								  <c:forEach begin="1" end="${roomContent.score}" step="1">
									 <i class="icon_set_1_icon-81 voted"></i>
								  </c:forEach>
								  <c:forEach begin="${roomContent.score}" end="4" step="1">
									 <i class="icon_set_1_icon-81"></i>
								  </c:forEach>
								</div>
								<p style="font-weight: bold;">"${roomContent.review}"</p>
								<div class="carousel magnific-gallery">
								  <c:forEach var="imgVo" items="${imgVo}">
									 <c:if test="${imgVo.ucode eq roomContent.ucode}">
										<div class="item" style="height: 70px;">
										  <a href="upload/${imgVo.uploadPath }/${imgVo.uuid}_${imgVo.fileName}"><img src="upload/${imgVo.uploadPath }/${imgVo.uuid}_${imgVo.fileName}"></a>
										</div>
									 </c:if>
								  </c:forEach>
								</div>
								<!-- End review strip -->
							 </div>
						  </c:if>
						</c:forEach>
						<c:forEach var="roomContent" items="${roomContent}">
						  <c:if test="${roomContent.ucode ne sessionScope.member.ucode }">
							 <div class="review_strip_single lists__item js-load">
								<ig src="profile/${roomContent.profile}.jpg" alt="" class="img-circle" style="width: 80px; height: 80px;">
								<small>- ${roomContent.regdate } -</small>
								<h4>${roomContent.name}</h4>
								<div class="rating">
								  <c:forEach begin="1" end="${roomContent.score}" step="1">
									 <i class="icon_set_1_icon-81 voted"></i>
								  </c:forEach>
								  <c:forEach begin="${roomContent.score}" end="4" step="1">
									 <i class="icon_set_1_icon-81"></i>
								  </c:forEach>
								  <span><button class="w3-button w3-black w3-round" id="rec_update"
										onclick="rec_update(${roomContent.rvcode});">
										<i class="fa fa-heart" style="font-size: 16px; color: red"></i> &nbsp;<span
										  id="${roomContent.rvcode}"></span> 좋아요
									 </button> </span>
								</div>
								<p style="font-weight: bold;">"${roomContent.review}"</p>
								<div class="carousel magnific-gallery">
								  <c:forEach var="imgVo" items="${imgVo}">
									 <c:if test="${imgVo.ucode eq roomContent.ucode}">
										<div class="item" style="height: 70px;">
										  <a href="upload/${imgVo.uploadPath }/${imgVo.uuid}_${imgVo.fileName}"><img
												src="upload/${imgVo.uploadPath }/${imgVo.uuid}_${imgVo.fileName}"></a>
										</div>
									 </c:if>
								  </c:forEach>
								</div>
								<!-- End review strip -->

							 </div>
						  </c:if>
						</c:forEach>
						<div id="js-btn-wrap" class="btn-wrap">
						  <a href="javascript:;" class="button">더보기</a>
						</div>
					 </div>
				  </div>
				</div>
			 </c:if>
		  </div>
		  <!--End  single_tour_desc-->
		</div>
		<aside class="col-md-4">
		  <p class="hidden-sm hidden-xs">
			 <a class="fix-color btn_map1 btn btn-success btn-block" data-toggle="collapse" href="#collapseMap"
				aria-expanded="false" aria-controls="collapseMap">View on map</a>
		  </p>
		  <p class="hidden-sm hidden-xs">
			 <a class="btn_map1 btn btn-success btn-block" data-toggle="collapse" onclick="PreviousRoom()"
				aria-expanded="false" aria-controls="collapseMap">룸 리스트</a>
		  </p>

		  <c:choose>
			 <c:when test="${userCode ne null }">
				<span>스터디룸 예약 지금 하세요!</span>
				<br>
				<form method="post" id="roomJoinFrm" action="${pageContext.request.contextPath}/room/reserve_join">
				  <input type="hidden" name="rcode" value="${Room_infoVo.rcode}">
				  <input type="hidden" name="ucode" value="${userCode}">
				  <div class="form-group">
					 Date : <input type="text" id="dp" name="dateReserve" class="date-pick form-control"
						data-date-format="mm/dd/yyyy" required>
				  </div>
				  <input type="submit" value="스터디룸 예약" class="btn btn-success" onclick="$('#btnReserve').submit();">
				  <button type="button" onclick="doNotReserve();" class="btn btn-dark">예약신청 취소</button>
				</form>
				<button id="btnReserve" type="button" onclick="doReserve();" class="btn btn-primary"
				  style="display: none"></button>
			 </c:when>
			 <c:when test="${userCode eq null}">
			 </c:when>
		  </c:choose>
		</aside>
		<form method="get" id="roomJoinFrm2" action="${pageContext.request.contextPath}/room/reserve_undo">
		  <input type="hidden" name="rcode" value="${Room_infoVo.rcode}">
		  <input type="hidden" name="ucode" value="${userCode}">
		</form>
		<!--End row -->
	 </div>

  </div>
  <!--End container -->

  <div id="toTop"></div>
  <!-- Back to top button -->
  <div id="overlay"></div>
  <!-- Mask on input focus -->

  <!-- Modal Review -->
  <div class="modal fade" id="myReview" tabindex="-1" role="dialog" aria-labelledby="myReviewLabel" aria-hidden="true">
	 <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			 </button>
			 <h4 class="modal-title" id="myReviewLabel">Write your review</h4>
		  </div>
		  <div class="modal-body">
			 <div id="message-review"></div>
			 <div id="page-review-write">
				<div class="jb-wrap">
				  <div class="jb-image">
					 <img src="${Room_infoVo.rprofile }" alt="">
				  </div>
				  <div class="jb-text">
					 <p>${Room_infoVo.name }</p>
				  </div>
				</div>
				<form id="reviewForm" role="form" method="post" onsubmit="alert('리뷰가 등록되었습니다');">
				  <input type="hidden" name="rcode" value="${Room_infoVo.rcode}">
				  <input type="hidden" name="ucode" value="${sessionScope.member.ucode}"> <input type="hidden"
					 name="regdate" value="">
				  <!-- 평점 선택:s -->
				  <div class="collapse" id="collapseFilters">
					 <div class="filter_type">
						<h6>Star Category</h6>
						<ul>
						  <li><label> <input type="radio" value="5" name="score" checked="checked"> <span class="rating">
								  <i class="icon_set_1_icon-81 voted"></i> <i class="icon_set_1_icon-81 voted"></i> <i
									 class="icon_set_1_icon-81 voted"></i> <i class="icon_set_1_icon-81 voted"></i> <i
									 class="icon_set_1_icon-81 voted"></i>
								</span></label></li>
						  <li><label> <input type="radio" value="4" name="score"> <span class="rating"> <i
									 class="icon_set_1_icon-81 voted"></i> <i class="icon_set_1_icon-81 voted"></i> <i
									 class="icon_set_1_icon-81 voted"></i> <i class="icon_set_1_icon-81 voted"></i> <i
									 class="icon_set_1_icon-81"></i>
								</span>
							 </label></li>
						  <li><label> <input type="radio" value="3" name="score"> <span class="rating"> <i
									 class="icon_set_1_icon-81 voted"></i> <i class="icon_set_1_icon-81 voted"></i> <i
									 class="icon_set_1_icon-81 voted"></i> <i class="icon_set_1_icon-81"></i> <i
									 class="icon_set_1_icon-81"></i>
								</span>
							 </label></li>
						  <li><label><input type="radio" value="2" name="score"><span class="rating"> <i
									 class="icon_set_1_icon-81 voted"></i> <i class="icon_set_1_icon-81 voted"></i> <i
									 class="icon_set_1_icon-81"></i> <i class="icon_set_1_icon-81"></i> <i
									 class="icon_set_1_icon-81"></i>
								</span> </label></li>
						  <li><label><input type="radio" value="1" name="score"> <span class="rating"> <i
									 class="icon_set_1_icon-81 voted"></i> <i class="icon_set_1_icon-81"></i> <i
									 class="icon_set_1_icon-81"></i> <i class="icon_set_1_icon-81"></i> <i
									 class="icon_set_1_icon-81"></i>
								</span> </label></li>
						</ul>
					 </div>
				  </div>
				  <!-- //평점 선택:e -->

				  <div class="form-group mb-3">
					 <textarea name="review" rows="5" cols="30" class="form-control" placeholder="내용 입력"></textarea>
				  </div>
				</form>
				<div class="mb-3">
				  <label for="inputGroupFileProfile">이미지 등록</label>
				  <div class="input-group">
					 <div class="custom-file">
						<input type="file" name="uploadFile" class="custom-file-input" id="inputReviewImg" multiple> <label
						  class="custom-file-label" for="inputReviewImg">Choose
						  file</label>
					 </div>
				  </div>
				</div>
			 </div>
			 <div class="bigPictureWrapper">
				<div class="bigPicture"></div>
			 </div>
			 <div class="uploadResult">
				<ul></ul>
			 </div>
			 <div class="btn-group-lg pt-3 pb-3 text-center">
				<button type="button" class="btn btn-primary  btn-success add_bottom_30" id="btn_write">리뷰
				  쓰기</button>
			 </div>
		  </div>
		</div>
	 </div>
  </div>
  <!-- End modal review -->
  <!-- Modal Review -->
  <div class="modal fade" id="PointSave" tabindex="-1" role="dialog" aria-labelledby="myReviewLabel" aria-hidden="true">
	 <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			 </button>
			 <h4 class="modal-title" id="myReviewLabel">Write your review</h4>
		  </div>
		  <div class="modal-body">
			 <div id="qrcodeCanvas">
				<img alt="" src="https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=http://192.168.0.64:9889/ojo/">
				<img alt="" src="https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=http://192.168.0.64:9889/ojo/">
				<img alt="" src="https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=http://192.168.0.64:9889/ojo/">
			 </div>
		  </div>
		</div>
	 </div>
  </div>
  <!-- <a href="#" class="back-to-top" style="display: inline;"><i
class="fa fa-chevron-up"></i></a> -->
  <!-- Common scripts -->
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap2/js/jquery-1.11.2.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap2/js/common_scripts_min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap2/js/functions.js"></script>

  <!-- Specific scripts -->
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap2/js/icheck.js"></script>
  <script>
	 $('input').iCheck({
		checkboxClass: 'icheckbox_square-grey',
		radioClass: 'iradio_square-grey'
	 });

  </script>
  <!-- Date and time pickers -->
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap2/js/jquery.sliderPro.min.js"></script>
  <script type="text/javascript">
	 $(document).ready(function ($) {
		$('#Img_carousel').sliderPro({
		  width: 960,
		  height: 500,
		  fade: true,
		  arrows: true,
		  buttons: false,
		  fullScreen: false,
		  smallSize: 500,
		  startSlide: 0,
		  mediumSize: 1000,
		  largeSize: 3000,
		  thumbnailArrows: true,
		  autoplay: false
		});
	 });

  </script>
  <!-- Date and time pickers -->
  <!-- koki -->
  <%-- <script
src="${pageContext.request.contextPath}/resources/vendor/bootstrap2/js/bootstrap-datepicker.js"></script> --%>
  <script>
//$('input.date-pick').datepicker('setDate', 'today');
// koki
  </script>
  <!-- Map -->
  <%-- <script
src="${pageContext.request.contextPath}/resources/vendor/bootstrap2/js/infobox.js"></script> --%>

  <!-- 지도를 표시할 div와 지도 옵션으로 지도를 생성합니다 -->
  <script type="text/javascript"
	 src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94c54d1595d711b9b39e3795e0c25ab9&libraries=services"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap2/js/map.js"></script>
  <script>
	 //map 실행
	 $('#collapseMap').on('shown.bs.collapse', function (e) {
		mapOp('${Room_infoVo.addr}', '${Room_infoVo.name}');
		$('html, body').animate({
		  scrollTop: $('#collapseMap').offset().top
		}, 600);
	 });

  </script>



  <!-- Carousel -->
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap2/js/owl.carousel.min.js"></script>
  <script>
	 $(document).ready(function () {
		$(".carousel").owlCarousel({
		  items: 4,
		  itemsDesktop: [1199, 3],
		  itemsDesktopSmall: [979, 3]
		});
	 });

  </script>
  <!--Review modal validation -->
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap2/assets/validate.js"></script>
  <script>
	 //submit 버튼을 누를시  <input type="hidden">업로드 된 파일들의 정보가 ReviewVo의 imgdataList로 수집
	 var formObj = $("#reviewForm");

	 $("#btn_write").on("click", function (e) {
		e.preventDefault();
		console.log("#btn_write 버튼 누를시 log");
		console.log("submit clicked");

		var str = "";

		$(".uploadResult ul li").each(function (i, obj) {
		  console.log("hidden submit");
		  var jobj = $(obj);
		  var rcode = ${ Room_infoVo.rcode };
		  var ucode = ${ sessionScope.member.ucode };

		  str += "<input type='hidden' name='imgdataList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
		  str += "<input type='hidden' name='imgdataList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
		  str += "<input type='hidden' name='imgdataList[" + i + "].fileName' value='" + jobj.data("filename") + "'>";
		  str += "<input type='hidden' name='imgdataList[" + i + "].rcode' value='" + rcode + "'>";
		  str += "<input type='hidden' name='imgdataList[" + i + "].ucode' value='" + ucode + "'>";

		});
		console.log(str);
		formObj.append(str).submit(); //form 태그가 submit 될떄 이미지 데이터도 같이 전송됨 
	 });

	 function showImage(fileCallPath) {

		$(".bigPictureWrapper").css("display", "flex").show();

		$(".bigPicture").html("<img src='${pageContext.request.contextPath}/display?fileName=" + fileCallPath + "'>").animate({
		  width: '100%',
		  height: '100%'
		}, 1000);

		$(".bigPictureWrapper").on("click", function (e) {
		  $(".bigPicture").animate({
			 width: '0%',
			 height: '0%'
		  }, 1000);
		  setTimeout((e) => {
			 $(this).hide();
		  }, 1000);
		});
	 }


	 var regex = new RegExp("(.*?)\.(JPG|PNG|JPEG|jpg|png|jpeg)$");
	 var maxSize = 5242880; //5MB

	 function checkExtension(fileName, fileSize) {

		if (fileSize >= maxSize) {
		  alert("파일 사이즈 초과");
		  return false;
		}

		if (!regex.test(fileName)) {
		  alert("이미지만 업로드할 수 있습니다.");
		  return false;
		}
		return true;
	 }
	 $('#inputReviewImg').change(function (e) {

		var formData = new FormData();
		var rcode = ${ Room_infoVo.rcode };
		var ucode = ${ sessionScope.member.ucode };
		console.log(ucode);
		var inputFile = $("input[name='uploadFile']");

		var files = inputFile[0].files;

		for (var i = 0; i < files.length; i++) {
		  if (!checkExtension(files[i].name, files[i].size)) {
			 return false;
		  }
		  formData.append("uploadFile", files[i]);
		  formData.append("rcode", rcode);
		  formData.append("ucode", ucode);
		}

		$.ajax({
		  url: '${pageContext.request.contextPath}/uploadAjaxAction',
		  processData: false,
		  contentType: false,
		  //'data: {"formData" : formData, "rcode" : rcode},
		  data: formData,
		  type: 'POST',
		  dataType: 'json',
		  success: function (result) {
			 console.log(result);
			 showUploadResult(result); //업로드 결과 처리 함수 
		  }
		}); //$.ajax
	 });

	 function showUploadResult(uploadResultArr) {
		/* 업로드된 파일 보여주기 */
		if (!uploadResultArr || uploadResultArr.length == 0) {
		  return;
		}
		var uploadUL = $(".uploadResult ul");

		var str = "";
		$(uploadResultArr).each(function (i, obj) {
		  var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		  var originPath = obj.uploadPath + "\\" +
			 obj.uuid + "_" + obj.fileName;
		  console.log(originPath);

		  originPath = originPath.replace(new RegExp(/\\/g), "/");

		  str += "<li data-path='" + obj.uploadPath + "'";
		  str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'";
		  str += " >";
		  str += "<div>";
		  str += "<span> " + obj.fileName + "</span>";
		  str += "<button type='button' data-file=\'" + fileCallPath + "\' ";
		  str += "data-type='image' class='close' aria-label='Close'> <span aria-hidden='true'>&times;</span> <i class='fa fa-times'></i></button><br>";
		  str += "<a href=\"javascript:showImage(\'";
		  str += originPath;
		  str += "\')\">";
		  str += "<img src='${pageContext.request.contextPath}/display?fileName=";
		  str += fileCallPath;
		  str += "'>";
		  str += "</a></div></li>";
		});
		uploadUL.append(str);
	 }
	 $(".uploadResult").on("click", "button", function (e) { //파일 삭제 버튼 

		console.log("delete file");

		var targetFile = $(this).data("file");

		var targetLi = $(this).closest("li");

		$.ajax({
		  url: '${pageContext.request.contextPath}/deleteFile',
		  data: {
			 fileName: targetFile
		  },
		  dataType: 'text',
		  type: 'POST',
		  success: function (result) {
			 alert(result);
			 targetLi.remove();
		  }
		}); //$.ajax
	 });
	 $(document).ready(function () {
		//라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
		$('input[type="checkbox"][name="score"]').click(function () {
		  //클릭 이벤트 발생한 요소가 선택 상태일 경우
		  //체크된 요소 확인후 복수개 선택되있을 경우 체크 해제
		  if ($(this).prop('checked') &&
			 $('input[type="checkbox"][name="score"]:checked').size() > 1) {
			 $(this).prop('checked', false);
			 alert('두개 이상 선택할 수 없습니다.');
		  }
		});
	 });
  </script>
  <script>
	 function idCheck() {
		var id = '${sessionScope.member.ucode}';
		var count = ${ RoomDetailDTO.review_ucode };
		if (id == "") {
		  alert('로그인이 필요한 서비스 입니다.');
		  location.href = '${pageContext.request.contextPath}/member/login';
		} else if (count != 0) {
		  alert('한 스터디룸 게시판에 글을 한번 이상 쓸수 없다');
		  history.go(0);
		}
	 }
	 /* >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> */
	 function idCheck2() {
		location.href = "${pageContext.request.contextPath}/room/removeReview?rcode=${Room_infoVo.rcode }";
	 }
	 function PreviousRoom() {
		location.href = "${pageContext.request.contextPath}/room/list";
	 }
	 /* >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> */

	 function doReserve() {
		if (confirm('스터디 룸을 예약 하시겠습니까?') == true) {
		  $('#roomJoinFrm').submit();
		} else {
		  return;
		}
	 }

	 function doNotReserve() {
		if (confirm('스터디 룸 예약을 취소하시겠습니까?') == true) {
		  $('#roomJoinFrm2').submit();
		} else {
		  return;
		}
	 }
	 //////////koki
	 /*  $("#dp").datepicker({  
	 numberOfMonths : [2,3]     
	 ,dateFormat: "yy년 mm월 dd일"
	 });    
	 
	 
	 //$('#dp').datepicker('setDate', 'today'); */
	 // 추천버튼 클릭시(추천 추가 또는 추천 제거)
	 function rec_update(rvcode) {
		$.ajax({
		  url: "${pageContext.request.contextPath}/room/RecUpdate",
		  type: "POST",
		  data: {
			 rvcode: rvcode,
			 ucode: '${sessionScope.member.ucode}',
			 rcode: '${Room_infoVo.rcode}'
		  },
		  complete: function () {
			 console.log('a');
			 recCount(rvcode);
		  }
		})
	 }
	 // 게시글 추천수
	 function recCount(rvcode) {
		var rv = rvcode;
		console.log(rvcode);
		$.ajax({
		  url: "${pageContext.request.contextPath}/room/RecCount",
		  type: "POST",
		  data: {
			 rvcode: rvcode
		  },
		  success: function (count) {
			 $("#" + rv).html(count);
			 console.log("#" + rv);
		  },
		})
	 };
	 var list = ${ Allreview_like };
	 $(list).each(function (index, value) {
		recCount(value);
	 });		
  </script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
  <script>
	 $('#dp').datepicker('setDate', 'today'); 
  </script>
</body>

</html>