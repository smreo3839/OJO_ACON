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
<title>회원정보수정</title>
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
								<h1 class="title-single">회원정보수정</h1>
								<span class="color-text-a"></span>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div class="container">
				<form class="needs-validation" method="POST">
					<div class="mb-3">
						<label for="uid">아이디</label> <input type="text" name="uid"
							id="uid" value="${member.uid}" class="form-control" readonly>
					</div>

					<div class="mb-3">
						<label for="name">이름</label> <input type="text" name="name"
							id="name" value="${member.name}" class="form-control"
							placeholder="" required autocomplete="off">
					</div>

					<div class="row">
						<div class="col-md-6 pb-3">
							<label for="pwd1">비밀번호</label> <input type="password" name="pwd"
								id="pwd1" value="${member.pwd}" max-length="20"
								class="form-control" placeholder="" required autocomplete="off">
							<div id="pwd-msg1" class="valid-feedback"></div>
						</div>
						<div class="col-md-6 pb-3">
							<label for="pwd2">비밀번호 확인</label> <input type="password"
								name="pwd2" id="pwd2" value="${member.pwd}" max-length="20"
								class="form-control" placeholder="" required autocomplete="off">
							<div id="pwd-msg2" class="valid-feedback"></div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일 <span class="text-muted">(@
								포함하여 적어주세요)</span></label> <input type="email" name="email"
							class="form-control" id="email" value="${member.email}"
							placeholder="ex)you@example.com" autocomplete="off">
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="phone">전화번호 <span class="text-muted">(-
									포함하여 적어주세요)</span></label> <input type="text" name="phone" id="phone"
								value="${member.phone}" class="form-control"
								placeholder="ex)010-0000-0000" autocomplete="off">
						</div>

						<div class="col-md-6 mb-3">
							<label for="gender">성별 ${member.gender}</label>
							<div>
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label
										class="btn btn-success <c:if test="${member.gender eq '남'}">active</c:if>">
										<input type="radio" name="gender" id="option1" value="남"
										autocomplete="off"
										<c:if test="${member.gender eq '남'}">checked</c:if>> 남
									</label> <label
										class="btn btn-success <c:if test="${member.gender eq '여'}">active</c:if>">
										<input type="radio" name="gender" id="option2" value="여"
										autocomplete="off"
										<c:if test="${member.gender eq '여'}">checked</c:if>> 여
									</label>
								</div>
							</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="inputGroupFileProfile">프로필 이미지</label>
						<div class="input-group">
							<input type="hidden" name="profile" id="profile">
							<div class="custom-file">
								<input type="file" class="custom-file-input"
									id="inputGroupFileProfile" name="profile2"> <label
									class="custom-file-label" for="inputGroupFileProfile">Choose
									file</label>
							</div>
						</div>
					</div>

					<hr class="mt-4 mb-4">

					<div class="btn-group-lg text-center">
						<button type="submit" class="btn btn-success" id="submit">정보수정</button>
						<a href="javascript:history.back();" class="btn btn-outline-dark">취소</a>
					</div>
				</form>
				<div class="mt-5 text-right">
					<p class="alert alert-danger" role="alert">
						*탈퇴시 회원의 모든정보는 사라집니다. <a href="#" class="alert-link"
							onclick="execWithdrawal(); return false;">회원탈퇴</a>
					</p>
				</div>
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
		input = document.getElementById("uid").value;
		console.log(input);
		$('#profile').val(input);

		$("#submit").click(function(e) {
			console.log(input);
			var formData = new FormData();
			var inputFile = $("input[name='profile2']");

			var files = inputFile[0].files;

			for (var i = 0; i < files.length; i++) {
				formData.append("uploadFile", files[i]);
				formData.append('username', input);
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
	</script>
	<script>
		$(document).ready(function() {
			//$('#pwd2').trigger('change');
		});

		//회원탈퇴
		function execWithdrawal() {
			if (confirm('회원 탈퇴를 원하십니까?\n*확인시 바로 탈퇴가 되며 되돌릴 수 없습니다.') == true) {
				location.href = '${pageContext.request.contextPath}/member/withdrawal';
			} else {
				return;
			}
		}
		</script>
		
</body>
</html>