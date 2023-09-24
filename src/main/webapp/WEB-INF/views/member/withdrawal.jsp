<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<jsp:include page="/include/lib_common.jsp"/>
	<title>회원탈퇴</title>
</head>
<body class="">
	<jsp:include page="/include/header_common.jsp"/>
	<!-- page-inner:s -->
	<div class="page-inner">
	
		<div class="page-box-m">
			<section class="intro-single">
			  <div class="container">
					<div class="row">
						 <div class="col-md-12 col-lg-8">
							  <div class="title-single-box">
									<h1 class="title-single">탈퇴완료</h1>
									<span class="color-text-a">회원탈퇴가 완료 되었습니다.</span>
							  </div>
						 </div>
					</div>
			  </div>
			</section>				
			<div class="text-center">
				<p class="h3 mb-3 font-weight-bold">그동안 이용해주셔서 감사합니다</p>
				<p class="h4 mb-4">다시 서비스를 이용하시려면 '회원가입'을 해주세요</p>
				<a href="${pageContext.request.contextPath}/member/register" class="btn btn-b">회원가입</a>
			</div>
		</div>
		
	</div>
	<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp"/>
	<jsp:include page="/include/script_common.jsp"/>
</body>
</html>