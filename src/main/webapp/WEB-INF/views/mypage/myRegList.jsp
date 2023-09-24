<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<jsp:include page="/include/lib_common.jsp"/>
	<title>스터디룸 신청 내역</title>
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
							<h1 class="title-single">스터디룸 신청 내역</h1>
							<span class="color-text-a">내 스터디룸 신청 내역입니다.</span>
						</div>
					</div>
					<div class="col-md-12 col-lg-4">
					  <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
					    <ol class="breadcrumb">
					      <li class="breadcrumb-item">
					        <a href="${pageContext.request.contextPath}/mypage/main">마이페이지</a>
					      </li>
					      <li class="breadcrumb-item active" aria-current="page">
							스터디룸 신청 내역
					      </li>
					    </ol>
					  </nav>
					</div>					 
				</div>
		  </div>
		</section>
	
		<div class="container">
			<div class="table-responsive border-bottom">
				<table class="table table-hover">
					<colgroup>
						<col style="width:;">
						<col style="width:;">
						<col style="width:;">
						<col style="width:;">
						<col style="width:;">
						<col style="width:;">
						<col style="width:;">
						<col style="width:;">
					</colgroup>
					<thead class="thead-dark">
						<tr>
							<th scope="col">순서</th>
							<th scope="col">방번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">인원수</th>
							<th scope="col">회원번호</th>
							<th scope="col">등록일자</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty li}">
						<c:forEach items="${li}" var="li2">
						<tr class="row-subject">
							<td>${li2.gcode}</std>
							<td>${li2.rcode}</td>
							<td>${li2.cate}</td>
							<td><a href="${pageContext.request.contextPath}/room/list?gcode=${li2.rcode}">${li2.title}</a></td>
							<td>${li2.cnt}</td>
							<td>${li2.ucode}</td>
							<td>${li2.regdate}</td>
						</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty li}">
						<tr>
							<td colspan="8">
								<p class="txt-empty">작성한 글이 없습니다.</p>
							</td>
						</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp"/>
	<jsp:include page="/include/script_common.jsp"/>
</body>
</html>