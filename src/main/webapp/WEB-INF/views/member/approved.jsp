<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<jsp:include page="/include/lib_common.jsp"/>
	<title>STUDY CLUB</title>
</head>
<body class="">
	<jsp:include page="/include/header_common.jsp"/>
	<!-- page-inner:s -->
	<div class="page-inner">
	
		<div class="page-box-m">
			<section class="intro-single">
			  <div class="container">
					<div class="row">
						 <div class="col-md-12 col-lg-12">
							  <div class="title-single-box">
									<h1 class="title-single">이미 인증된 회원입니다</h1>
							  </div>
						 </div>
					</div>
			  </div>
			</section>	
			<div class="text-center">
				<p class="h3 mb-4">가입하신 아이디로 <br>'로그인'후 이용 가능합니다.</p>
				<a href="${pageContext.request.contextPath}/member/login" class="btn btn-b">로그인</a>
			</div>
		</div>
		
	</div>
	<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp"/>
	<jsp:include page="/include/script_common.jsp"/>
</body>
</html>