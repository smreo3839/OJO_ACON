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
		//history.back();
	} else if (result == 'null_join') {
		alert('신청내역이 없습니다.');
		history.back();
	} else if (result == 'Failfull') {
		alert('방이 마감되었습니다.');
		history.back();
	} else if (result == 'DoNotDelete') {
		alert('일정기간이 지나 예약 취소 불가 합니다.');
		history.back();
	} else if (result == 'FailThree') {
		alert('이미 신청하신 스터디룸이 세개 존재합니다. 스터디룸 예약은 세개까지만 예약 가능합니다. 마이페이지에서 확인하세요!');
		location.href = '${pageContext.request.contextPath}/mypage/main';
		//history.back();
	} else if (result == 'PastdayNotReserve') {
		alert('선택하신 날짜에는 예약을 하실 수 없습니다.');
		history.back();
	}
</script>
</head>
<body>
</body>
</html>


