<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="designPath"
	value="${pageContext.request.contextPath}/resources/vendor/template-kit"
	scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<jsp:include page="/include/lib_common.jsp" />
<title>회원가입</title>
</head>
<body class="">
	<jsp:include page="/include/header_common.jsp" />
	<!-- page-inner:s -->
	<div class="page-inner">

		<div class="page-box-m">
			<section class="intro-single">
				<div class="container">
					<div class="row">
						<div class="col-md-12 col-lg-8">
							<div class="title-single-box">
								<h1 class="title-single">회원가입</h1>
								<span class="color-text-a">양식에 맞게 정보를 입력하여 회원가입을 해주세요</span>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div class="container">
				<form class="needs-validation" method="post"
					enctype="multipart/form-data">
					<div class="mb-2">
						<label for="uid">아이디</label> <input type="text" name="uid"
							id="uid" value="" class="form-control" placeholder="" required
							autocomplete="off">
							<div class="result">					
							<span class="msg"></span>
					</div>
					</div>

					<div class="mb-3">
						<label for="name">이름</label> <input type="text" name="name"
							id="name" value="" class="form-control" placeholder="" required
							autocomplete="off">
					</div>

					<div class="row">
						<div class="col-md-6 pb-3">
							<label for="pwd1">비밀번호</label> <input type="password" name="pwd"
								id="pwd1" value="" max-length="20" class="form-control"
								placeholder="" required autocomplete="off">
							<div id="pwd-msg1" class="valid-feedback"></div>
						</div>
						<div class="col-md-6 pb-3">
							<label for="pwd2">비밀번호 확인</label> <input type="password"
								name="pwd2" id="pwd2" value="" max-length="20"
								class="form-control" placeholder="" required autocomplete="off">
							<div id="pwd-msg2" class="valid-feedback"></div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일 <span class="text-muted">(@
								포함하여 적어주세요)</span></label> <input type="email" name="email"
							class="form-control" id="email" placeholder="ex) you@example.com"
							autocomplete="off">
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="phone">전화번호 <span class="text-muted">(-
									포함하여 적어주세요)</span></label> <input type="text" name="phone" id="phone" value=""
								class="form-control" placeholder="ex) 010-0000-0000" required
								autocomplete="off">
						</div>

						<div class="col-md-6 mb-3">
							<label for="gender">성별</label>
							<div>
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-success active"> <input
										type="radio" name="gender" id="option1" value="남"
										autocomplete="off" checked> 남
									</label> <label class="btn btn-success"> <input type="radio"
										name="gender" id="option2" value="여" autocomplete="off">
										여
									</label>
								</div>
							</div>
						</div>
					</div>
				<div class="mb-3">
						<label for="inputGroupFileProfile">프로필 이미지</label>
						<div class="input-group">
							<input type="hidden" name="profile" id="profile" >
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="inputGroupFileProfile" name="profile2">
								<label class="custom-file-label" for="inputGroupFileProfile">Choose file</label>
							</div>
						</div>				
					</div>	
						<hr class="mt-4 mb-4">

						<div class="btn-group-lg text-center">
							<button type="submit" class="btn btn-success" id="submit" disabled="disabled">가입하기</button>
							<a href="${pageContext.request.contextPath}"
								class="btn btn-outline-dark">취소</a>
						</div>
				</form>
			</div>
		</div>

	</div>
	<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp" />
	<jsp:include page="/include/script_common.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/js/memberFormValidation.js"></script>
	<script>
	input = '';
	$("#uid").change(function(){
		input = document.getElementById("uid").value;
		console.log(input);
		  $('#profile').val(input);
		});


			$("#submit").click(function(e) {
				console.log(input);
				var formData = new FormData();
				var inputFile = $("input[name='profile2']");

				var files = inputFile[0].files;

				for (var i = 0; i < files.length; i++) {
					formData.append("uploadFile", files[i]);
					formData.append('username',input);
				}

				$.ajax({
					url : '${pageContext.request.contextPath}/UploadProfile',
					processData : false,
					contentType : false,
					//'data: {"formData" : formData, "rcode" : rcode},
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
					}
				}); //$.ajax
			})
			
			$('#uid').keyup(function(){
		var query = { uid : $('#uid').val()};
		
		$.ajax({
			url : '${pageContext.request.contextPath}/member/check_id',
			type: 'POST',
			data : query,
			success : function(data) {
			
				if(data == 1) {
					$('.result .msg').text("사용 불가")
					$('.result .msg').attr("style", "color:#f00")
					$('#submit').attr("disabled","disabled");
			}else {
					$('.result .msg').text("사용 가능")
					$('.result .msg').attr("style", "color:#00f")
					$('#submit').removeAttr("disabled");
			}
			if($('#uid').val() =="")
				{
					$('.result .msg').text("")
				
				}
			}
		});
	})
			
			
			
	</script>
</body>
</html>