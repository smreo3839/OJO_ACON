<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<jsp:include page="/include/lib_common.jsp"/>
	<title>스터디룸 찾기</title>
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
							<h1 class="title-single">StudyRoom</h1>
							<span class="color-text-a">조건에 맞는 스터디룸 찾기</span>
						</div>
					</div>
				</div>
			</div>
		</section>		
		<div class="container">
			<div class="row col-8">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<select id="searchOp" name="searchType" class="custom-select">
							<option value="n"
								<c:out value="${cri.searchType == null?'selected':''}"/>>카테고리</option>
							<option value="addr"
								<c:out value="${cri.searchType eq 'addr'?'selected':''}"/>>지역</option>
							<option value="name"
								<c:out value="${cri.searchType eq 'name'?'selected':''}"/>>스터디룸</option>
							<option value="rcode"
								<c:out value="${cri.searchType eq 'rcode'?'selected':''}"/>>글번호</option>
						</select>
					</div>
					<input type="text" name="keyword" id="keywordInput" class="form-control" value='${cri.keyword}'>
					<div class="input-group-append">
						<button id='searchBtn' class="btn btn-success">Search</button>
					</div>
				</div>
			</div>
			<c:if test="${empty list}">
			<div class="text-center mt-5 mb-5">
				<h2 class="pt-5 pb-5">결과값이 없습니다.</h2>
			</div>
			</c:if>
			<c:if test="${!empty list}">
			<div class="grid room-list">
				<div class="row">
					<c:forEach var="Room_infoVo" items="${list}">
					<div class="col-md-4 item${Room_infoVo.rcode}">
						<div class="card-box-b card-shadow news-box">
							<div class="img-box-b thumb-img">
								<img src="room_img/${Room_infoVo.rprofile}" alt="" class="img-b img-fluid" style="width: 350px;height: 330px;">
							</div>
							<div class="card-overlay">
								<c:if test="${!empty member}">
									<span class="add-wish" data-status="empty" data-rcode="${Room_infoVo.rcode}" data-ucode="${member.ucode}">
										<i class="fa fa-heart-o"></i>
									</span>
								</c:if>
								<div class="card-header-b">
									<div class="card-category-b">
										<a href="#" class="category-b text-light">${Room_infoVo.rtype}</a>
									</div>
									<div class="card-title-b">
										<h2 class="title-2">
											<a href="${pageContext.request.contextPath}/room/readDetail${pageMaker.makeSearch(pageMaker.cri.page)}&rcode=${Room_infoVo.rcode}">
												${Room_infoVo.name}
											</a>
										</h2>
									</div>
									<div class="card-date">
										<span class="date-b">${Room_infoVo.addr}</span><br>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<!-- 리스트 페이징:s -->
			<div class="text-center">	
				<nav class="pagination-a" style="display:inline-block">
					<ul class="pagination justify-content-end">
					<c:if test="${pageMaker.prev}">
						<li class="page-item"><!-- disabled -->
							<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }" class="page-link">
								<span class="ion-ios-arrow-back"></span>
							</a>
						</li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li class="page-item <c:out value="${pageMaker.cri.page ==idx? 'active':''}"/>">
							<a href="list${pageMaker.makeSearch(idx)}" class="page-link">${idx}</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="page-item">
							<a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }" class="page-link">
								<span class="ion-ios-arrow-forward"></span>
							</a>
						</li>
					</c:if>
					</ul>
				</nav>
			</div>
			<!-- 리스트 페이징:e -->
			</c:if>			
		</div>
		
	</div>
	<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp"/>
	<jsp:include page="/include/script_common.jsp"/>
	<script>
		$(document).ready(function() {
			// 검색
			$('#searchBtn').on('click', function(event) {
				self.location = "list"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("#searchOp option:selected").val()
					+ "&keyword=" + $('#keywordInput').val();
			});
			
			// 임시 임의이미지 매칭
			function imgLoad() {
				var imgSrc = new Array();

				imgSrc[0] = '${designPath}/img/property-1.jpg';
				imgSrc[1] = '${designPath}/img/property-2.jpg';
				imgSrc[2] = '${designPath}/img/property-3.jpg';
				imgSrc[3] = '${designPath}/img/property-4.jpg';
				imgSrc[4] = '${designPath}/img/property-5.jpg';
				imgSrc[5] = '${designPath}/img/property-6.jpg';

				$('.thumb-img img').each(function(idx){
					$(this).attr('src', imgSrc[idx]);
				});
			}

			//imgLoad();

			// 위시 추가&삭제
			$('.room-list .add-wish').on('click', function(e){
				var obj = $(this);
				var wishData = {
					ucode : obj.attr('data-ucode'),
					rcode : obj.attr('data-rcode'),
					status : obj.attr('data-status')
				}
				
				$.ajax({
					url: '${pageContext.request.contextPath}/room/wish',
					type:'post',
					data : wishData,
					success : function(data) {
						console.log('성공');
						addWish(obj, wishData.status);				
					}
				});
			});
			
			function addWish(obj, status) {
				if(status == 'empty') {
					obj.attr('data-status', 'full').children().addClass('fa-heart').removeClass('fa-heart-o');
				} else {
					obj.attr('data-status', 'empty').children().addClass('fa-heart-o').removeClass('fa-heart');
				}
			}			
		});	
	</script>
</body>
</html>