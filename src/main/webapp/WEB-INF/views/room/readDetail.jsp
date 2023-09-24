<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<jsp:include page="/include/lib_common.jsp"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/date_time_picker.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/js-load.css" media="screen">
	<title>스터디룸 상세 페이지</title>
</head>
<body class="">
	<jsp:include page="/include/header_common.jsp"/>
	<!-- page-inner:s -->
	<div class="page-inner">

		<section class="intro-single">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-lg-8">
						<div class="title-single-box">
							<!-- 총 평점 -->
							<span class="rating">
							  <fmt:parseNumber value="${RoomDetailDTO.avgScore}" integerOnly="true" var="scInt" />
							  <fmt:parseNumber value="${RoomDetailDTO.avgScore*10%10}" integerOnly="true" var="scDec" />
							  <c:forEach var="sc" begin="1" end="${scInt}" step="1">
								 <i class="fa fa-star"></i>
							  </c:forEach>
							  <c:forEach var="sc" begin="${scInt}" end="4" step="1" varStatus="status">
								 <c:if test="${scDec == 0}">
									<i class="fa fa-star-o"></i>
								 </c:if>
								 <c:if test="${scDec > 0}">
									<c:if test="${status.first}">
									  <i class="fa fa-star-half-o"></i>
									</c:if>
									<c:if test="${!status.first}">
									  <i class="fa fa-star-o"></i>
									</c:if>
								 </c:if>
							  </c:forEach>
							</span>
							<!-- //총 평점 -->
							<h1 class="title-single">${Room_infoVo.name}</h1>
							<span class="color-text-a">
								${Room_infoVo.addr}
							</span>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="property-single nav-arrow-b">
			<div class="container">
				<div class="row justify-content-between">
					<!-- 이미지:s -->
					<div class="col-md-4 col-lg-8 mb-2">
						<div id="property-single-carousel" class="owl-carousel owl-arrow gallery-property mb-2">
							<c:if test="${Room_infoVo.rprofile ne null}"><div class="carousel-item-b"><img src="room_img/${Room_infoVo.rprofile}" alt="스터디룸 이미지"></div></c:if>
							<c:if test="${Room_infoVo.thdetail01 ne null}"><div class="carousel-item-b"><img src="room_img/${Room_infoVo.thdetail01}" alt="스터디룸 이미지1"></div></c:if>
							<c:if test="${Room_infoVo.thdetail02 ne null}"><div class="carousel-item-b"><img src="room_img/${Room_infoVo.thdetail02}" alt="스터디룸 이미지2"></div></c:if>
							<c:if test="${Room_infoVo.thdetail03 ne null}"><div class="carousel-item-b"><img src="room_img/${Room_infoVo.thdetail03}" alt="스터디룸 이미지3"></div></c:if>
							<c:if test="${Room_infoVo.thdetail04 ne null}"><div class="carousel-item-b"><img src="room_img/${Room_infoVo.thdetail04}" alt="스터디룸 이미지4"></div></c:if>
							<c:if test="${Room_infoVo.thdetail05 ne null}"><div class="carousel-item-b"><img src="room_img/${Room_infoVo.thdetail05}" alt="스터디룸 이미지5"></div></c:if>
							<c:if test="${Room_infoVo.thdetail06 ne null}"><div class="carousel-item-b"><img src="room_img/${Room_infoVo.thdetail06}" alt="스터디룸 이미지6"></div></c:if>
							<c:if test="${Room_infoVo.thdetail07 ne null}"><div class="carousel-item-b"><img src="room_img/${Room_infoVo.thdetail07}" alt="스터디룸 이미지7"></div></c:if>
							<c:if test="${Room_infoVo.thdetail08 ne null}"><div class="carousel-item-b"><img src="room_img/${Room_infoVo.thdetail08}" alt="스터디룸 이미지8"></div></c:if>
							<c:if test="${Room_infoVo.thdetail09 ne null}"><div class="carousel-item-b"><img src="room_img/${Room_infoVo.thdetail09}" alt="스터디룸 이미지9"></div></c:if>
							<c:if test="${Room_infoVo.thdetail010 ne null}"><div class="carousel-item-b"><img src="room_img/${Room_infoVo.thdetail010}" alt="스터디룸 이미지10"></div></c:if>
						</div>
					</div>
					<!-- 이미지:e -->
					<!-- 예약:s -->
					<div class="col-md-8 col-lg-4 mb-2">
						<form method="post" id="roomJoinFrm" action="${pageContext.request.contextPath}/room/reserve_join">
							<input type="hidden" name="rcode" value="${Room_infoVo.rcode}">
							<input type="hidden" name="ucode" value="${userCode}">
							<div class="property-summary color-a">
								<div class="title-box-d">
									<h3 class="title-d">스터디룸 예약</h3>
								</div>
								<div class="row pb-2 border-bottom">
									<div class="col-5 pt-2">
										<strong>예약날짜</strong>
									</div>
									<div class="col-7">
										<div class="input-group">
											<input type="text" id="dp" name="dateReserve" class="date-pick form-control" data-date-format="mm/dd/yyyy" required>
											<div class="input-group-append">
												<span class="input-group-text">
													<i class="fa fa-calendar" aria-hidden="true"></i>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row mt-2 pb-2 border-bottom">
									<div class="col-5">
										<strong>예약자</strong>
									</div>
									<div class="col-7">
										<c:out value="${member.name}">로그인시 자동 입력</c:out>
									</div>
								</div>
								<div class="row mt-2 pb-2 border-bottom">
									<div class="col-5">
										<strong>연락처</strong>
									</div>
									<div class="col-7">
										<c:out value="${member.phone}">로그인시 자동 입력</c:out>
									</div>
								</div>
								<div class="row mt-2 pb-2 border-bottom">
									<div class="col-5 pt-2">
										<strong>예약인원</strong>
									</div>
									<div class="col-7">
										<select name="cnt" class="form-control">
											<option value="0">선택</option>
											<option value="1">1명</option>
											<option value="2">2명</option>
											<option value="3">3명</option>
											<option value="4">4명</option>
											<option value="5">5명</option>
											<option value="6">6명</option>
											<option value="7">7명</option>
											<option value="8">8명</option>
										</select>
									</div>
								</div>
								<div class="row mt-2 pb-2 border-bottom">
									<div class="col-5">
										<strong>매장전화</strong>
									</div>
									<div class="col-7">
										${Room_infoVo.phone}
									</div>
								</div>
								<div class="row mt-2 pb-2 border-bottom">
									<div class="col-5">
										<strong>주소</strong>
									</div>
									<div class="col-7">
										${Room_infoVo.addr}
										<span class="btn btn-sm btn-outline-success btn-block mt-2" onclick="viewMap();"><i class="fa fa-map-o" aria-hidden="true"></i>지도보기</span>
									</div>
								</div>
							</div>
						</form>
						<form method="get" id="roomJoinFrm2" action="${pageContext.request.contextPath}/room/reserve_undo">
							<input type="hidden" name="rcode" value="${Room_infoVo.rcode}">
							<input type="hidden" name="ucode" value="${userCode}">
						</form>
						<div class="row pt-2 pb-2">
							<c:if test="${!empty member}">
								<div class="col-md-6 col-sm-12 mb-2">
									<input type="button" value="예약하기" class="btn btn-success btn-lg btn-block" onclick="doReserve();">
								</div>
								<div class="col-md-6 col-sm-12 mb-2">
									<button type="button" onclick="doNotReserve();" class="btn btn-dark btn-lg btn-block">예약취소</button>
								</div>
							</c:if>
							<c:if test="${empty member}">
								<div class="col-md-6 col-sm-12 mb-2">
									<input type="button" value="예약하기" class="btn btn-success btn-lg btn-block" onclick="alert('로그인 후 이용하실 수 있습니다.');">
								</div>
								<div class="col-md-6 col-sm-12 mb-2">
									<button type="button" onclick="alert('로그인 후 이용하실 수 있습니다.');" class="btn btn-dark btn-lg btn-block">예약취소</button>
								</div>
							</c:if>
						</div>
						<div class="color-a">
							<p>
								<strong class="text-danger">예약만 하시고 매장에서 현장결제</strong>하세요.<br>
								<strong class="text-danger">QR코드를 통해 포인트</strong>를 적립할 수 있습니다.
							</p>
						</div>
					</div>
					<!-- //예약:e -->
				</div>
				<!-- 상세설명:s -->
				<div class="row">
					<div class="col-12 pt-3">
						<div class="title-box-d">
							<h3 class="title-d">시설 옵션</h3>
						</div>
						<div id="info-picktogram" class="pb-5">
							<ul>
								<li class="<c:if test='${Room_optVo.air}'>text-success</c:if> <c:if test='${!Room_optVo.air}'>text-black-50</c:if>">
									<i class="fa fa-refresh" aria-hidden="true"></i>공기청정기
								</li>
								<li class="<c:if test='${Room_optVo.projector}'>text-success</c:if> <c:if test='${!Room_optVo.projector}'>text-black-50</c:if>">
									<i class="fa fa-video-camera" aria-hidden="true"></i>프로젝터
								</li>
								<li class="<c:if test='${Room_optVo.printer}'>text-success</c:if> <c:if test='${!Room_optVo.printer}'>text-black-50</c:if>">
									<i class="fa fa-print" aria-hidden="true"></i>프린터
								</li>
								<li class="<c:if test='${Room_optVo.board}'>text-success</c:if> <c:if test='${!Room_optVo.board}'>text-black-50</c:if>">
									<i class="fa fa-desktop" aria-hidden="true"></i>화이트보드
								</li>
								<li class="<c:if test='${Room_optVo.wifi}'>text-success</c:if> <c:if test='${!Room_optVo.wifi}'>text-black-50</c:if>">
									<i class="fa fa-wifi" aria-hidden="true"></i>인터넷/WIFI
								</li>
								<li class="<c:if test='${Room_optVo.smoking}'>text-success</c:if> <c:if test='${!Room_optVo.smoking}'>text-black-50</c:if>">
									<i class="fa fa-ban" aria-hidden="true"></i>흡연실
								</li>
								<li class="<c:if test='${Room_optVo.drink}'>text-success</c:if> <c:if test='${!Room_optVo.drink}'>text-black-50</c:if>">
									<i class="fa fa-coffee" aria-hidden="true"></i>음료
								</li>
								<li class="<c:if test='${Room_optVo.food}'>text-success</c:if> <c:if test='${!Room_optVo.food}'>text-black-50</c:if>">
									<i class="fa fa-cutlery" aria-hidden="true"></i>음식물 반입
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- //상세설명:e -->
				<!-- //가게 정보:s -->
				<div class="row">
					<div class="col-12 pt-3">
						<div class="title-box-d">
							<h3 class="title-d">공간 소개</h3>
						</div>
					<p class="p_intro">
						${Room_infoVo.information }
					</p>
					</div>
				</div>
				<!-- //가게 정보:e -->
				<div class="row">
					<!-- 지도:s -->
					<div class="col-12 mb-5 mt-5">
						<div class="title-box-d">
							<h3 class="title-d">${Room_infoVo.name} 위치</h3>
						</div>
						<div id="wrapMap">
							<div id="map" class="map"></div>
						</div>
						<h5 class="text-center pt-2"><i class="fa fa-map-marker" aria-hidden="true"></i> 주소 : ${Room_infoVo.addr}</h5>
					</div>
					<!-- //지도:e -->

					<!-- 리뷰 작성(modal):s -->
					<div class="modal fade" id="myReview" tabindex="-1" role="dialog" aria-labelledby="myReviewLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header justify-content-between">
									<h4 class="modal-title" id="myReviewLabel">리뷰 작성하기</h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<i class='fa fa-times'></i>
									</button>
								</div>
								<div class="modal-body">
									<div id="message-review"></div>
									<div id="page-review-write">
										<form id="reviewForm" role="form" method="post" onsubmit="alert('리뷰가 등록되었습니다');">
											<input type="hidden" name="rcode" value="${Room_infoVo.rcode}">
											<input type="hidden" name="ucode" value="${member.ucode}">
											<input type="hidden" name="regdate" value="">
											<!-- 평점 선택:s -->
											<div id="collapseFilters">
												<div class="filter_type">
													<h6>${Room_infoVo.name}</h6>
													<div class="btn-group mb-3" role="group" aria-label="Button group with nested dropdown">
														<button type="button" class="btn btn-outline-dark" id="select_rating">평점 선택</button>
														<div class="btn-group" role="group">
															<button id="btnGroupDrop2" type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
															<div class="dropdown-menu text-warning" aria-labelledby="btnGroupDrop2" x-placement="bottom-start">
																<label for="rating5" class="dropdown-item">
																	<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
																</label>
																<label for="rating4" class="dropdown-item">
																	<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i>
																</label>
																<label for="rating3" class="dropdown-item">
																	<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
																</label>
																<label for="rating2" class="dropdown-item">
																	<i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
																</label>
																<label for="rating1" class="dropdown-item">
																	<i class="fa fa-star"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i><i class="fa fa-star-o"></i>
																</label>
															</div>
														</div>
														<div class="invisible">
															<input type="radio" name="score" value="5" id="rating5" autocomplete="off">
															<input type="radio" name="score" value="4" id="rating4" autocomplete="off">
															<input type="radio" name="score" value="3" id="rating3" autocomplete="off">
															<input type="radio" name="score" value="2" id="rating2" autocomplete="off">
															<input type="radio" name="score" value="1" id="rating1" autocomplete="off">
														</div>
													</div>
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
													<input type="file" name="uploadFile" class="custom-file-input" id="inputReviewImg" multiple>
													<label class="custom-file-label" for="inputReviewImg">파일 선택</label>
												</div>
											</div>
										</div>
									</div>
									<div class="uploadResult">
										<ul></ul>
									</div>
									<div class="btn-group-lg pt-3 pb-3 text-center">
										<button type="button" class="btn btn-success" id="btn_write">리뷰 쓰기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="bigPictureWrapper">
						<div class="bigPicture"></div>
					</div>
					<!-- //리뷰 작성(modal):e -->

					<!-- 리뷰:s -->
					<div class="col-12 pt-5 pb-5 mb-5">
						<div class="row">
							<div class="col-8">
								<div class="title-box-d">
									<h3 class="title-d">리뷰 (${RoomDetailDTO.reviewCount})</h3>
								</div>
							</div>
							<div class="col-4 text-right pt-2">
								<c:if test="${!empty member && RoomDetailDTO.review_ucode < 1}">
									<button class="btn btn-success btn-lg" data-toggle="modal" data-target="#myReview">리뷰쓰기</button>
								</c:if>
								<c:if test="${empty member || RoomDetailDTO.review_ucode > 0}">
									<button class="btn btn-success btn-lg" onclick="idCheck(); return false;">리뷰쓰기</button>
								</c:if>
							</div>
						</div>
						 <!-- 리스트:s -->
						 <div class="box-comments" id="box-review">
							<!-- 리뷰 없을때:s -->
							<c:if test="${empty roomContent}">
								<div class="text-center mt-5 mb-5">
									<h4 class="pt-5 pb-5">작성된 리뷰가 없습니다.</h4>
								</div>
							</c:if>
							<!-- //리뷰 없을때:e -->
							<!-- 리뷰 있을때:s -->
							<c:if test="${!empty roomContent}">
							<ul class="list-comments" id="js-load">
								<c:forEach var="roomContent" items="${roomContent}">
									<li class="list-item js-load <c:if test='${roomContent.ucode eq member.ucode}'>my-item</c:if>">
										<span class="btn-close" title="삭제" onclick="revieDelete();">
											<i class="fa fa-trash-o" aria-hidden="true"></i>
										</span>
										<div class="comment-avatar"><img src="profile/${roomContent.profile}.jpg"></div>
										<div class="comment-details">
											<div class="row justify-content-between">
												<h4 class="col-lg-7 col-md-6 col-sm-5 comment-author">${roomContent.name}</h4>
												<div class="col-lg-3 col-md-6 col-sm-7 rating text-right">
													<fmt:parseNumber value="${RoomDetailDTO.avgScore}" integerOnly="true" var="reviewInt" />
													<fmt:parseNumber value="${RoomDetailDTO.avgScore*10%10}" integerOnly="true" var="reviewDec" />
													<c:forEach var="sc" begin="1" end="${reviewInt}" step="1">
														<i class="fa fa-star"></i>
													</c:forEach>
													<c:forEach var="sc" begin="${reviewInt}" end="4" step="1" varStatus="status">
														<c:if test="${reviewDec == 0}">
															<i class="fa fa-star-o"></i>
														</c:if>
														<c:if test="${reviewDec > 0}">
															<c:if test="${status.first}">
																<i class="fa fa-star-half-o"></i>
															</c:if>
															<c:if test="${!status.first}">
																<i class="fa fa-star-o"></i>
															</c:if>
														</c:if>
													</c:forEach>
												  <span><button class="w3-button w3-black w3-round" id="rec_update"
										onclick="rec_update(${roomContent.rvcode});">
										<i class="icon-thumbs-up" style="font-size: 16px; color: red"></i> &nbsp;<span
										  id="${roomContent.rvcode}"></span> 좋아요
									 </button> </span>
												</div>
											</div>
											<span>${roomContent.regdate}</span>
											<p class="comment-description">
												<i class="fa fa-comment-o" aria-hidden="true"></i>
												${roomContent.review}
											</p>
											<!-- 리뷰첨부이미지:s -->
											<c:if test="${!empty imgVo}">
											<div class="review-img owl-theme owl-carousel owl-arrow gallery-property mb-2">
												<c:forEach var="imgVo" items="${imgVo}">
													<c:if test="${imgVo.ucode eq roomContent.ucode}">
														<div class="item">
															<a href="upload/${imgVo.uploadPath }/${imgVo.uuid}_${imgVo.fileName}"><img src="upload/${imgVo.uploadPath }/${imgVo.uuid}_${imgVo.fileName}"></a>
														</div>
													</c:if>
												</c:forEach>
											</div>
											</c:if>
											<!-- //리뷰첨부이미지:e -->
										</div>
									</li>
								</c:forEach>
								<div id="js-btn-wrap" class="text-center pt-3 pb-3">
									<button class="btn btn-success btn-lg js-btn">더보기</button>
								</div>
							</ul>
							</c:if>
							<!-- //리뷰 있을때:e -->
						 </div>
						 <!-- //리스트:e -->
					</div>
					<!-- //리뷰:e -->

				</div>
			</div>
		</section>

	</div>
	<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp"/>
	<jsp:include page="/include/script_common.jsp"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/js-load.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
	<!-- 지도를 표시할 div와 지도 옵션으로 지도를 생성 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=94c54d1595d711b9b39e3795e0c25ab9&libraries=services"></script>
	<script type="text/javascript" src="${designPath}/js/map.js"></script>
	<script>
		$(document).ready(function(){
			// map 실행
			mapOp('${Room_infoVo.addr}', '${Room_infoVo.name}');

			// datepicker
			$('#dp').datepicker('setDate', 'today');

			// 평점선택
			$('input[id^=rating][type=radio]').on('change', function(e){
				var icon = '';
				for(var i = 0; i < $(this).val(); i++){
					icon += '<i class="fa fa-star"></i>';
				}
				for(var i = $(this).val(); i < 5; i++){
					icon += '<i class="fa fa-star-o"></i>';
				}
				$('#select_rating').html(icon);
			});

			// 리뷰 이미지
			$('.review-img').owlCarousel({
				loop: false,
				margin: 10,
				responsive: {
					0: {
						items: 3,
					},
					769: {
						items: 4,
					},
					992: {
						items: 5,
					}
				}
			});
		});

		// 지도위치이동
		function viewMap() {
			var pos = $('#wrapMap').parent().offset().top - $('#navTop').innerHeight() - 50;
			$('html, body').animate({'scrollTop' : pos + 'px'}, 800);
		}

		function idCheck() {
			var id = '${member.ucode}';
			var name = '${member.name}';
			var count = '${RoomDetailDTO.review_ucode}';
			if (id == '') {
				alert('로그인이 필요한 서비스 입니다.');
				location.href = '${pageContext.request.contextPath}/member/login';
			} else if (count != 0) {
				alert(name + '님은 이미 리뷰를 작성하셨습니다.\n리뷰는 한번만 작성가능합니다.');
			}
		}

		function revieDelete() {
			if(confirm('해당 리뷰를 삭제 하시겠습니까?')) {
				location.href = "${pageContext.request.contextPath}/room/removeReview?rcode=${Room_infoVo.rcode}";
			}
		}
		function PreviousRoom() {
			location.href = "${pageContext.request.contextPath}/room/list";
		}

		// 예약하기
		function doReserve() {
			if(confirm('스터디 룸을 예약 하시겠습니까?')) {
				$('#roomJoinFrm').submit();
			}
		}
		// 예약취소하기
		function doNotReserve() {
			if(confirm('스터디 룸 예약을 취소하시겠습니까?')) {
				$('#roomJoinFrm2').submit();
			}
		}

		//submit 버튼을 누를시 <input type="hidden">업로드 된 파일들의 정보가 ReviewVo의 imgdataList로 수집
		$('#btn_write').on('click', function(e) {
			e.preventDefault();

			//빈내용 체크
			if($('textarea[name=review]').val() == "") {
				alert('내용을 입력해주세요');
				$('textarea[name=review]').focus();
				return;
			}

			var str = "";
			$('.uploadResult ul li').each(function(idx, obj) {
				//console.log("hidden submit");
				var $obj = $(obj);
				var rcode = '${Room_infoVo.rcode}';
				var ucode = '${sessionScope.member.ucode}';

				str += "<input type='hidden' name='imgdataList[" + idx + "].uuid' value='" + $obj.data("uuid") + "'>";
				str += "<input type='hidden' name='imgdataList[" + idx + "].uploadPath' value='" + $obj.data("path") + "'>";
				str += "<input type='hidden' name='imgdataList[" + idx + "].fileName' value='" + $obj.data("filename") + "'>";
				str += "<input type='hidden' name='imgdataList[" + idx + "].rcode' value='" + rcode + "'>";
				str += "<input type='hidden' name='imgdataList[" + idx + "].ucode' value='" + ucode + "'>";
			});
			//console.log(str);
			$("#reviewForm").append(str).submit(); //form 태그가 submit 될떄 이미지 데이터도 같이 전송됨 
		});

		//이미지 확대
		function showImage(fileCallPath) {
			var cover = $('.bigPictureWrapper');
			var zoomImg = cover.find('.bigPicture');

			zoomImg.html('<img src=\'${pageContext.request.contextPath}/display?fileName=' + fileCallPath + '\'>');
			cover.addClass('is-show');

			cover.on('click', function(e) {
				$(this).removeClass('is-show');
			});
		}

		var regex = new RegExp("(.*?)\.(JPG|PNG|JPEG|jpg|png|jpeg)$");
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if(!regex.test(fileName)) {
				alert("이미지만 업로드할 수 있습니다.");
				return false;
			}
			return true;
		}

		$('#inputReviewImg').change(function(e) {
			var formData = new FormData();
			var rcode = '${Room_infoVo.rcode}';
			var ucode = '${sessionScope.member.ucode}';
			//console.log(ucode);
			var inputFile = $('input[name=\'uploadFile\']');

			var files = inputFile[0].files;

			for(var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append('uploadFile', files[i]);
				formData.append('rcode', rcode);
				formData.append('ucode', ucode);
			}

			$.ajax({
				url: '${pageContext.request.contextPath}/uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType: 'json',
				success: function (result) {
					//console.log(result);
					showUploadResult(result); //업로드 결과 처리 함수 
				}
			}); //$.ajax
		});

		//업로드 결과 처리
		function showUploadResult(uploadResultArr) {
			if(!uploadResultArr || uploadResultArr.length < 1) return;

			var uploadUL = $(".uploadResult ul");
			var str = "";

			$(uploadResultArr).each(function(idx, obj) {
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
				//console.log(originPath);

				originPath = originPath.replace(new RegExp(/\\/g), "/");

				str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.image + "'>";
				str += "<div>";
				str += "<p class=\"filename mb-2\"> " + obj.fileName + "</p>";
				str += "<a href=\"javascript:showImage(\'";
				str += originPath;
				str += "\')\">";
				str += "<img src='${pageContext.request.contextPath}/display?fileName=";
				str += fileCallPath;
				str += "'></a>";
				str += "<button type='button' data-file=\'" + fileCallPath + "\' ";
				str += "data-type='image' class='btn btn-block btn-sm btn-outline-dark btn-close mt-2' aria-label='Close'><i class='fa fa-times'></i> 삭제</button>";
				str += "</div></li>";
			});
			uploadUL.append(str);
		}

		//파일 삭제 버튼클릭
		$('.uploadResult').on('click', '.btn-close', function(e) {
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
					targetLi.remove();
				}
			}); //$.ajax
		});
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
</body>
</html>