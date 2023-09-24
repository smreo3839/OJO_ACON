<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<jsp:include page="/include/lib_common.jsp"/>
	<title>Login</title>
</head>
<body class="">
	<jsp:include page="/include/header_common.jsp"/>
	<!-- page-inner:s -->
	<div class="page-inner">

		<div id="page-login" class="page-box-m <c:if test="${msg eq false}">is-login-fail</c:if>">
			<section class="intro-single">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-lg-8">
							<div class="title-single-box">
								<h1 class="title-single">Login</h1>
								<span class="color-text-a">가입된 아이디로 로그인</span>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div class="container">
				<form method="post" class="form-signin">
					<c:if test="${msg eq false}">
					<div class="alert alert-danger mt-1 mb-3">로그인 실패!<br>아이디와 비밀번호를 확인해 주세요!</div>
					</c:if>
					<div class="mb-2">
						<label for="inputEmail" class="sr-only">아이디</label>
						<input type="text" id="inputUid" name="uid" class="form-control" placeholder="아이디" required autocomplete="off">
					</div>
					<div class="mb-2">
						<label for="inputPwd" class="sr-only">비밀번호</label>
						<input type="password" id="inputPwd" name="pwd" class="form-control" placeholder="비밀번호" required autocomplete="off">
					</div>
	
					<!-- 
					<div class="form-group mt-2 mb-4">
					  <div class="custom-control custom-checkbox">
					    <input type="checkbox" name="userIdSave" class="custom-control-input" id="userIdSave" checked="">
					    <label class="custom-control-label" for="userIdSave">아이디 저장</label>
					  </div>
					</div>
					 -->
					
					<button class="btn btn-lg btn-b btn-block" type="submit">LOGIN</button>
					<div class="btn-group-sm mt-3 border-top pt-3">
						<span>아직 회원이 아니신가요?</span>
						<a href="${pageContext.request.contextPath}/member/register" class="btn btn-dark ml-3">회원가입</a>
					</div>
					<div class="btn-group-sm mt-3">
						<span>ID가 기억이 안나요</span>
						<a href="${pageContext.request.contextPath}/member/searchID" class="btn btn-dark ml-2">이메일로 아이디 찾기</a>
					</div>
					<div class="btn-group-sm mt-3">
						<span>비밀번호가 기억이 안나요</span>
						<a href="${pageContext.request.contextPath}/member/searchPw" class="btn btn-dark ml-2">비밀번호 찾기</a>
					</div>
				</form>
			</div>
		</div>
		
	</div>
	<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp"/>
	<jsp:include page="/include/script_common.jsp"/>
</body>
</html>