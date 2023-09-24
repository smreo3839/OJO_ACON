<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="designPath"
	value="${pageContext.request.contextPath}/resources/vendor/template-kit"
	scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<jsp:include page="/include/lib_common.jsp" />
<title>글 보기</title>
</head>
<body class="">
	<jsp:include page="/include/header_common.jsp" />
	<!-- page-inner:s -->
	<div class="page-inner">

		<section class="intro-single">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-lg-8">
						<div class="title-single-box">
							<h1 class="title-single">${view.title}</h1>
							<span class="color-text-a">조회수 : ${view.cnt}</span>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="container">
			<table class="table">
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 40%;">
					<col style="width: 10%;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">그룹 번호</th>
						<td>${view.gcode}</td>
						<th scope="row">회원 번호</th>
						<td>${view.ucode}</td>
					</tr>
					<tr>
						<th scope="row">카테고리</th>
						<td>${view.cate}</td>
						<th scope="row">등록일</th>
						<td>
							<fmt:parseDate value='${view.regdate}' var='regdate' pattern='yyyy-MM-dd' />
							<fmt:formatDate value="${regdate}" pattern="yyyy년 MM월 dd일" />
						</td>
					</tr>
					<tr>
						<th scope="row">그룹신청</th>
						<td>${scnt}명 / ${cnt}명</td>
						<th scope="row">&nbsp;</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="pt-5 pb-5">${view.content}</div>
							<div class="btn-group-lg pt-3 pr-3 text-right">
								<c:choose>
									 <c:when test="${userCode ne null && view.ucode ne userCode }">
										<span class="pb-3">그룹에 참여하고 싶다면 '그룹신청'을 하세요!</span><br>
										<button type="button" class="btn btn-success" onclick="doGroupJoin();">그룹신청</button>
										<button type="button" class="btn btn-outline-dark" onclick="doNotGroupJoin();">그룹신청취소</button>
									 </c:when>
									 <c:when test="${userCode eq null || view.ucode eq userCode}">
									 </c:when>
								</c:choose>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<hr class="pb-4">
			<div class="btn-group-lg text-right">
				<!-- 
				<button type="button" onclick="location.href='modify?gcode=${view.gcode}'" class="btn btn-outline-dark">수정하기</button>
				<button type="button" onclick="execDelete(${view.gcode});" class="btn btn-outline-dark">삭제하기</button>
				<button type="button" onclick="location.href='list'" class="btn btn-dark">목록보기</button>
				-->
				<c:choose>
					<c:when test="${userCode == view.ucode}">
						<button type="button"
							onclick="location.href='modify?gcode=${view.gcode}'"
							class="btn btn-outline-dark">수정하기</button>
						<button type="button" onclick="execDelete(${view.gcode});"
							class="btn btn-outline-dark">삭제하기</button>
					</c:when>
					<c:when test="${userCode != view.ucode}">
					</c:when>
				</c:choose>
				<button type="button" onclick="location.href='list'"
					class="btn btn-dark">목록보기</button>

				<form method="post" id="groupJoinFrm"
					action="${pageContext.request.contextPath}/group/join">
					<input type="hidden" name="gcode" value="${view.gcode}"> <input
						type="hidden" name="ucode" value="${userCode}">
				</form>
				<form method="get" id="groupJoinFrm2"
					action="${pageContext.request.contextPath}/group/cancel">
					<input type="hidden" name="gcode" value="${view.gcode}"> <input
						type="hidden" name="ucode" value="${userCode}">
				</form>
			</div>
		</div>

	</div>
	<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp" />
	<jsp:include page="/include/script_common.jsp" />
	<script>
		function execDelete(gcode) {
			if(confirm('삭제하시겠습니까?') == true) {
				location.href='remove?gcode='+gcode;	
			} else {
				retu
			}
		}
		
		function doGroupJoin(){
			if(confirm('그룹을 신청하시겠습니까?')==true){
				$('#groupJoinFrm').submit();
			} else {
				return;
			}
		}
		
		function doNotGroupJoin(){
			if(confirm('그룹을 신청 취소하시겠습니까?')==true){
				$('#groupJoinFrm2').submit();
			} else {
				return;
			}
		}
	</script>
</body>
</html>