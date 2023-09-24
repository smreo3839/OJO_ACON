<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<jsp:include page="/include/lib_common.jsp"/>
	<title>그룹 모집 리스트</title>
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
							<h1 class="title-single">스터디그룹</h1>
							<span class="color-text-a">스터디그룹 모집 커뮤니티</span>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="container">
			<div class="row col-8">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<select id="searchOp" class="custom-select" name="searchType">
							<option value="">전체</option>
							<option value="title"
								<c:out value="${cri.searchType == 'title'? 'selected':''}"/>>제목</option>
							<option value="cate"
								<c:out value="${cri.searchType == 'cate'? 'selected':''}"/>>카테고리</option>
							<option value="content" 
								<c:out value="${cri.searchType == 'content'? 'selected':''}"/>>내용</option>
						</select>
					</div>
					<input type="text" name="keyword" id="keywordInput" class="form-control" value='${cri.keyword}'>
					<div class="input-group-append">
						<button id='searchBtn' class="btn btn-success">Search</button>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table table-hover">
					<caption style="display:none;">그룹 모집 게시물 리스트</caption>
					<colgroup>
						<col style="width:10%;">
						<col style="width:10%;">
						<col style="width:10%;">
						<col>
						<col style="width:10%;">
						<col style="width:10%;">
						<col style="width:15%;">
					</colgroup>
					<thead class="thead-dark">
						<tr>
							<th scope="col">순서</th>
							<th scope="col">방번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">인원수</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일자</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty list}">
						<c:forEach items="${list}" var="list">
						<tr class="row-subject">
							<td>${list.gcode}</std>
							<td>${list.rcode}</td>
							<td>${list.cate}</td>
							<td><a href="${pageContext.request.contextPath}/group/view?gcode=${list.gcode}">${list.title}</a></td>
							<td>${list.cnt}명</td>
							<td>
								${list.uid}<br>
								<!-- (${fn:substring(list.m_name,0,1)}***) -->
							</td>
							<td><fmt:parseDate value='${list.regdate}' var='regdate' pattern='yyyy-MM-dd'/>
								<fmt:formatDate value="${regdate}" pattern="yyyy년 MM월 dd일"/>
							</td>
						</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty list}">
						<tr>
							<td colspan="8">
								<p class="txt-empty">모집 글이 없습니다.</p>
							</td>
						</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			
			<!-- 페이징:s -->
			<div class="text-center">
				<nav class="pagination-a" style="display:inline-block">
					<ul class="pagination justify-content-end">
					<c:if test="${pageMaker.prev }">
						<li class="page-item">
							<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }" class="page-link">
								<span class="ion-ios-arrow-back"></span>
							</a>
						</li>
					</c:if>
					<c:forEach begin = "${pageMaker.startPage }" end = "${pageMaker.endPage }" var="idx">
					<li class="page-item <c:out value="${pageMaker.cri.page ==idx? 'active':''}"/>">
						<a href = "list${pageMaker.makeSearch(idx)}" class="page-link">${idx }</a>
					</li>
					</c:forEach>
					<c:if test = "${pageMaker.next && pageMaker.endPage>0 }">
						<li class="page-item">
							<a href = "list${pageMaker.makeSearch(pageMaker.endPage +1) }" class="page-link">
								<!--&raquo;-->
								<span class="ion-ios-arrow-forward"></span>
							</a>
						</li>
					</c:if>
					</ul>
				</nav>
			</div>
			<!-- //페이징:e -->
			
			<div class="btn-group-lg text-right">
				<a href="${pageContext.request.contextPath}/group/register" class="btn btn-b">글쓰기</a>
			</div>			
		</div>
		
	</div>
	<!--// page-inner:e -->
	<jsp:include page="/include/footer_common.jsp"/>
	<jsp:include page="/include/script_common.jsp"/>
	<script>
	$(document).ready(function(){
		var rowsCnt = $('table tbody tr').length;
		$('table tbody tr').each(function(idx){
			$(this).find('td:first-child').text((rowsCnt-idx));
		});
	
		$('#searchBtn').on('click', function(event) {
			self.location = "list"
				+ '${pageMaker.makeQuery(1)}'
				+ "&searchType="
				+ $("#searchOp option:selected").val()
				+ "&keyword=" + $('#keywordInput').val();
		});
	});
	</script>	
</body>
</html>