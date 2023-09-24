<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
		
		<h3> 신청 멤버 내역</h3>
				<div class="table-responsive">
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
						<th scope="col">아이디</th>
						<th scope="col">성별</th>
						<th scope="col">email</th>
						
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty memberin}">
					<c:forEach items="${memberin}" var="memberin2" begin="0" end="4">
					<tr class="row-subject">
						<td>${memberin2.name}</std>
						<td>${memberin2.uid}</td>
						<td>${memberin2.gender}</td>
						<td>${memberin2.email}</td>
					</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty memberin}">
					<tr>
						<td colspan="8">
							<p class="txt-empty">아직 신청한 멤버가 없어요.</p>
						</td>
					</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		</div>
		
</body>
</html>