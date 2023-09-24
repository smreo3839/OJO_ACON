<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<jsp:include page="/include/lib_common.jsp"/>
	<title>스터리룸 위시리스트</title>
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
							<h1 class="title-single">스터디룸 위시리스트</h1>
							<span class="color-text-a"></span>
						</div>
					</div>
					<div class="col-md-12 col-lg-4">
					  <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
					    <ol class="breadcrumb">
					      <li class="breadcrumb-item">
					        <a href="${pageContext.request.contextPath}/mypage/main">마이페이지</a>
					      </li>
					      <li class="breadcrumb-item active" aria-current="page">
							스터디룸 위시리스트
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
							<th scope="col">이름</th>
							<th scope="col">주소</th>
							<th scope="col">룸타입</th>
							<th scope="col">전화번호</th>
							<th scope="col">가격</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty room}">
						<c:forEach items="${room}" var="room2" begin="0" end="4">
						<tr class="row-subject">
							<td><a href="${pageContext.request.contextPath}/room/list?rcode=${room2.rcode}">${room2.name}</a></td>
							<td>${room2.addr}</td>
							<td>${room2.rtype}</td>
							<td>${room2.phone}</td>
							<td>${room2.prc}</td>
						</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty room}">
						<tr>
							<td colspan="8">
								<p class="txt-empty">찜 목록이 없습니다.</p>
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