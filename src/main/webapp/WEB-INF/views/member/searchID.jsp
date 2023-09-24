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
									<h1 class="title-single">아이디 찾기</h1>
									<span class="color-text-a">아래 이메일을 입력하시면 ID를 찾아드립니다</span>
							  </div>
						 </div>
					</div>
			  </div>
			</section>
			<div class="container">
				<form class="needs-validation" method="post" >
				
						<label for="name">이름<span class="text-muted"></span></label>
						<input type="text" name="name" class="form-control" id="name" required placeholder="이름" autocomplete="off">
					
					<div class="mb-3">
						<label for="email">이메일 <span class="text-muted">(@ 포함하여 적어주세요)</span></label>
						<input type="email" name="email" class="form-control" required id="email" placeholder="ex) you@example.com" autocomplete="off">
					</div>
										
					<hr class="mt-4 mb-4">
	
					<div class="btn-group-lg text-center">
						<button type="submit" id="findId" class="btn btn-success">아이디 찾기</button>
					</div>
				</form>

				</div>
				</div>
				</div>
				</div>
				<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp"/>
	<jsp:include page="/include/script_common.jsp"/>
</body>
</html>