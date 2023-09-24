<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="click-closed"></div>

<!--/ Form Search Star /-->
<div class="box-collapse">
	<div class="title-box-d">
		<h3 class="title-d">검색</h3>
	</div>
	<span class="close-box-collapse right-boxed ion-ios-close"></span>
	<div class="box-collapse-wrap form">
		<form class="form-a">
			<div class="row">
				<div class="col-md-12 mb-2">
					<div class="form-group">
						<label for="Type">Keyword</label>
						<input type="text" class="form-control form-control-lg form-control-a" placeholder="Keyword">
					</div>
				</div>
				<div class="col-md-6 mb-2">
					<div class="form-group">
						<label for="Type">Type</label>
						<select class="form-control form-control-lg form-control-a" id="Type">
							<option>All Type</option>
							<option>For Rent</option>
							<option>For Sale</option>
							<option>Open House</option>
						</select>
					</div>
				</div>
				<div class="col-md-6 mb-2">
					<div class="form-group">
						<label for="city">City</label>
						<select class="form-control form-control-lg form-control-a" id="city">
							<option>All City</option>
							<option>Alabama</option>
							<option>Arizona</option>
							<option>California</option>
							<option>Colorado</option>
						</select>
					</div>
				</div>
				<div class="col-md-6 mb-2">
					<div class="form-group">
						<label for="bedrooms">Bedrooms</label>
						<select class="form-control form-control-lg form-control-a" id="bedrooms">
							<option>Any</option>
							<option>01</option>
							<option>02</option>
							<option>03</option>
						</select>
					</div>
				</div>
				<div class="col-md-6 mb-2">
					<div class="form-group">
						<label for="garages">Garages</label>
						<select class="form-control form-control-lg form-control-a" id="garages">
							<option>Any</option>
							<option>01</option>
							<option>02</option>
							<option>03</option>
							<option>04</option>
						</select>
					</div>
				</div>
				<div class="col-md-6 mb-2">
					<div class="form-group">
						<label for="bathrooms">Bathrooms</label>
						<select class="form-control form-control-lg form-control-a" id="bathrooms">
							<option>Any</option>
							<option>01</option>
							<option>02</option>
							<option>03</option>
						</select>
					</div>
				</div>
				<div class="col-md-6 mb-2">
					<div class="form-group">
						<label for="price">Min Price</label>
						<select class="form-control form-control-lg form-control-a" id="price">
							<option>Unlimite</option>
							<option>$50,000</option>
							<option>$100,000</option>
							<option>$150,000</option>
							<option>$200,000</option>
						</select>
					</div>
				</div>
				<div class="col-md-12">
					<button type="submit" class="btn btn-b">Search Property</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!--/ Form Search End /-->

<!--/ Nav Star /-->
<nav id="navTop" class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
	<div class="container">
		<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault" aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
			<span></span>
			<span></span>
			<span></span>
		</button>
		<a class="navbar-brand text-brand" href="${pageContext.request.contextPath}">AllStudy <span class="color-b">Club</span></a>
		<button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-expanded="false">
			<span class="fa fa-search" aria-hidden="true"></span>
		</button>
		<div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
			<ul class="navbar-nav">
				<li class="nav-item nav-home">
					<a class="nav-link" href="${pageContext.request.contextPath}"><i class="fa fa-home"></i> Home</a>
				</li>
				<li class="nav-item nav-room">
					<a class="nav-link" href="${pageContext.request.contextPath}/room/list"><i class="fa fa-book"></i> StudyRoom</a>
				</li>
				<li class="nav-item nav-group">
					<a class="nav-link" href="${pageContext.request.contextPath}/group/list"><i class="fa fa-comments"></i> Community</a>
				</li>
				<li class="nav-item dropdown nav-mypage nav-member">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fa fa-user-circle"></i> Member
					</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<c:if test="${member != null}">
							<div class="pt-2 pr-3 mb-3 pl-3" title="${member.uid}">
								<i class="fa fa-user"></i> ${member.name}
								<hr>
							</div>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/main">마이페이지</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/member/modify">정보수정</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
						</c:if>
						<c:if test="${member == null}">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/member/login" onclick="alert('로그인이 필요한 서비스입니다.');">마이페이지</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/member/login">로그인</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/member/register">회원가입</a>
						</c:if>
					</div>
				</li>
			</ul>
		</div>
		<button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-expanded="false">
			<span class="fa fa-search" aria-hidden="true"></span>
		</button>
	</div>
</nav>
<!--/ Nav End /-->