<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	var result = '${msg}';
	if (result == 'Fail') {
		alert("이미 신청되었습니다.");
		history.back();
	} else if (result == 'SUCCESS') {
		alert('신청이 완료 되었습니다.');
		window.location = document.referrer; // 새로고침
	} else if (result == 'delete_join') {
		alert('신청이 취소 되었습니다.');
		window.location = document.referrer; // 새로고침
	} else if (result == 'null_join') {
		alert('신청내역이 없습니다.');
		history.back();
	} else if (result == 'Failfull') {
		alert('신청인원이 전부 찼습니다.');
		history.back();
	}
</script>
</head>
<body>
</body>
</html>


