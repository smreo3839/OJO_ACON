<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% request.getAttribute("mailByid"); %>  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<jsp:include page="/include/lib_common.jsp"/>
<title>아이디 찾기</title>
<script>

</script>
</head>

<body class="">

<jsp:include page="/include/header_common.jsp"/>
	<!-- page-inner:s -->
	<div class="page-inner">
	<div id="page-login" class="page-box-m ">
		<div class="page-box-m">
			<section class="intro-single">
			  <div class="container">
					<div class="row">
						 <div class="col-md-12 col-lg-12">
							  <div class="title-single-box">
									<h1 class="title-single">아이디 찾기 결과</h1>
									<span class="color-text-a">해당 이메일에 대한 회원님의 아이디입니다</span>
							  </div>
						 </div>
					</div>
			  </div>
			</section>
			<div class="container">
				<div class="btn-group-sm mt-3">
						<span>${mailByid}</span>
					</div>
					<div class="btn-group-sm mt-3 border-top pt-2">
						<span>로그인 하러 가기</span>
						<a href="${pageContext.request.contextPath}/member/login" class="btn btn-dark ml-2">로그인</a>
					</div>
					<div class="btn-group-sm mt-3">
						<span>비밀번호가 기억이 안나요</span>
						<a href="${pageContext.request.contextPath}/member/searchPw" class="btn btn-dark ml-2">비밀번호 찾기</a>
					</div>

				</div>
				</div>
				</div>
				</div>
				<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp"/>
	<jsp:include page="/include/script_common.jsp"/>
	
</body>
</html>