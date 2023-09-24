<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<jsp:include page="/include/lib_common.jsp" />
<title>마이페이지</title>
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
                     <h1 class="title-single">Mypage</h1>
                     <span class="color-text-a"></span>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <div class="container">
         <div class="row">
            <div class="col-lg-2 mb-2 col-sm-12">
               <div class="list-group">
                              <a href="${pageContext.request.contextPath}/mypage/main" class="list-group-item list-group-item-action list-group-item-info active">마이페이지 </a>
                  <a href="${pageContext.request.contextPath}/mypage/mywish" class="list-group-item list-group-item-action">위시리스트</a>
                  <a href="${pageContext.request.contextPath}/mypage/myRegList" class="list-group-item list-group-item-action">룸 신청내역</a>
                  <a href="${pageContext.request.contextPath}/mypage/mylist" class="list-group-item list-group-item-action">내가쓴 글</a>
                  <a href="${pageContext.request.contextPath}/mypage/viewReserve" class="list-group-item list-group-item-action">내 예약 목록</a>
                  <a href="${pageContext.request.contextPath}/member/modify" class="list-group-item list-group-item-action">회원정보수정</a>
                  <a href="#" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#PointSave">포인트 조회</a>
               </div>
            </div>
            <c:if test="${!empty member}">
               <div class="col-lg-10 col-sm-12">
                  <!-- 회원정보:s -->
                  <div class="row">
                     <div class="col-md-3 pb-3">
                        <div class="agent-avatar-box">
                           <img src="${pageContext.request.contextPath}/room/profile/${userInformation.profile}.jpg" alt="" class="agent-avatar img-fluid">
                           <p class="pt-2 pb-2 text-center">
                              <a href="${pageContext.request.contextPath}/member/modify" class="btn-link">내 정보 수정하기</a>
                           </p>
                        </div>
                     </div>
                     <div class="col-md-9 section-md-t3 mb-5">
                        <div class="agent-info-box">
                           <div class="agent-title">
                              <div class="title-box-d">
                                 <h3 class="title-d">${userInformation.name}<br>${userInformation.uid}<br>
                                 <!-- ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->
										<div class="btn-group-lg pt-3 pr-3 text-left">
											<c:choose>
													<c:when test="${admin eq 1}">
													<button type="button" class="btn btn-success" onclick="location.href='http://192.168.0.14:3500/members'">관리자 페이지</button>
												 </c:when>
												 <c:when test="${admin eq 0}">
												</c:when>
											</c:choose>
										</div>
										<!--  -->
                                 </h3>
                              </div>
                           </div>
                           <div class="agent-content mb-3">
                              <p class="content-d color-text-a">회원소개</p>
                              <div class="info-agents color-a">
                                 <p>
                                    <strong>연락처: </strong> <span class="color-text-a">${userInformation.phone}</span>
                                 </p>
                                 <p>
                                    <strong>가입일자: </strong> <span class="color-text-a"><fmt:formatDate value="${userInformation.regdate}" pattern="yyyy년 MM월 dd일" /></span>
                                 </p>
                                 <p>
                                    <strong>Email: </strong> <span class="color-text-a">${userInformation.email}</span>
                                 </p>
                                 <p>
                                    <strong>성별: </strong> <span class="color-text-a">${userInformation.gender}</span>
                                 </p>
                                 <p>
                                    <strong>프로필: </strong> <span class="color-text-a">${userInformation.profile}</span>
                                 </p>
                                 <p>
                                    <strong>포인트: </strong> <span class="color-text-a">${userInformation.point}</span>
                                 </p>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- //회원정보:e -->
                  <!-- 위시리스트:s -->
                  <div class="row">
                     <div class="col-8">
                        <h3 class="">스터디룸 위시리스트</h3>
                     </div>
                     <div class="col-4 text-right pt-2">
                        <a href="${pageContext.request.contextPath}/mypage/mywish">전체보기</a>
                     </div>
                  </div>
                  <div class="table-responsive mb-5 border-bottom">
                     <table class="table table-hover">
                        <colgroup>
                           <col style="width: 15%;">
                           <col>
                           <col style="width: 15%;">
                           <col style="width: 15%;">
                           <col style="width: 10%;">
                        </colgroup>
                        <thead class="thead-dark">
                           <tr>
                              <th scope="col" class="text-center">이름</th>
                              <th scope="col" class="text-center">주소</th>
                              <th scope="col" class="text-center">룸타입</th>
                              <th scope="col" class="text-center">전화번호</th>
                              <th scope="col" class="text-center">가격</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:if test="${!empty room}">
                              <c:forEach items="${room}" var="room2" begin="0" end="4">
                                 <tr class="row-subject">
                                    <td class="text-center"><a
                                       href="${pageContext.request.contextPath}/room/readDetail?rcode=${room2.rcode}">${room2.name}</a></td>
                                    <td class="text-center">${room2.addr}</td>
                                    <td class="text-center">${room2.rtype}</td>
                                    <td class="text-center">${room2.phone}</td>
                                    <td class="text-center">${room2.prc}</td>
                                 </tr>
                              </c:forEach>
                           </c:if>
                           <c:if test="${empty room}">
                              <tr>
                                 <td colspan="5">
                                    <p class="txt-empty">위시리스트가 없습니다.</p>
                                 </td>
                              </tr>
                           </c:if>
                        </tbody>
                     </table>
                  </div>
                  <!-- //위시리스트:e -->
                  
                  <!-- 스터디룸 신청 내역 :s -->
                  <div class="row">
                  <div class="col-8">
                     <h3>스터디룸 신청 내역</h3>
                  </div>
                  <div class="col-4 text-right pt-2">
                     <a href="${pageContext.request.contextPath}/mypage/myRegList">전체보기</a>
                  </div>
               </div>
               <div class="table-responsive mb-5 border-bottom">
                  <table class="table table-hover">
                     <colgroup>
                        <col style="width:10%;">
                        <col>
                        <col style="width:20%;">
                        <col style="width:15%;">
                        <!-- <col style="width:10%;"> -->
                     </colgroup>
                     <thead class="thead-dark">
                        <tr>
                           <th scope="col" class="text-center">카테고리</th>
                           <th scope="col" class="text-center">제목</th>
                           <th scope="col" class="text-center">작성자</th>
                           <th scope="col" class="text-center">신청날짜</th>
                           <!-- <th scope="col" class="text-center">신청멤버보기</th> -->
                        </tr>
                     </thead>
                     <tbody>
                        <c:if test="${!empty myRegList}">
                        <c:forEach items="${myRegList}" var="rli2" begin="0" end="4">
                        <tr class="row-subject">
                           <td class="text-center">${rli2.cate}</td>
                           <td class="text-center"><a href="${pageContext.request.contextPath}/group/view?gcode=${rli2.gcode}">${rli2.title}</a></td>
                           <td class="text-center">${rli2.name}</td>      
                           <td class="text-center"><fmt:formatDate value="${rli2.regdate}" pattern="yyyy-MM-dd" /></td>
                           <!-- <td class="text-center"><a href="${pageContext.request.contextPath}/mypage/memberlist?gcode=${li2.gcode}">보기</a></td> --> 
                        </tr>
                        </c:forEach>
                        </c:if>
                        <c:if test="${empty myRegList}">
                        <tr>
                           <td colspan="6">
                              <p class="txt-empty">신청한 스터디가 없습니다.</p>
                           </td>
                        </tr>
                        </c:if>
                     </tbody>
                  </table>
               </div>


               <!-- 스터디룸 신청 내역 :e -->
                  <!-- 내가작성한 글:s -->
                  <div class="row">
                     <div class="col-8">
                        <h3>내가 작성한 글</h3>
                     </div>
                     <div class="col-4 text-right pt-2">
                        <a href="${pageContext.request.contextPath}/mypage/mylist">전체보기</a>
                     </div>
                  </div>
                  <div class="table-responsive mb-5 border-bottom">
                     <table class="table table-hover">
                        <colgroup>
                           <col style="width: 10%;">
                           <col style="width: 10%;">
                           <col style="width: 10%;">
                           <col>
                           <col style="width: 20%;">
                           <!-- <col style="width:10%;"> -->
                        </colgroup>
                        <thead class="thead-dark">
                           <tr>
                              <th scope="col" class="text-center">순서</th>
                              <th scope="col" class="text-center">방번호</th>
                              <th scope="col" class="text-center">카테고리</th>
                              <th scope="col" class="text-center">제목</th>
                              <th scope="col" class="text-center">등록일자</th>
                              <!-- <th scope="col" class="text-center">신청멤버보기</th> -->
                           </tr>
                        </thead>
                        <tbody>
                           <c:if test="${!empty li}">
                              <c:forEach items="${li}" var="li2" begin="0" end="4">
                                 <tr class="row-subject">
                                    <td class="text-center">${li2.gcode}</td>
                                    <td class="text-center">${li2.rcode}</td>
                                    <td class="text-center">${li2.cate}</td>
                                    <td class="text-center"><a
                                       href="${pageContext.request.contextPath}/group/view?gcode=${li2.gcode}">${li2.title}</a></td>
                                    <td class="text-center"><fmt:parseDate value='${li2.regdate}' var='regdate' pattern='yyyy-MM-dd HH:mm' />
                           <fmt:formatDate value='${regdate}' pattern='yyyy-MM-dd HH:mm' /></td>
                                    <!-- <td class="text-center"><a href="${pageContext.request.contextPath}/mypage/memberlist?gcode=${li2.gcode}">보기</a></td> -->
                                 </tr>
                              </c:forEach>
                           </c:if>
                           <c:if test="${empty li}">
                              <tr>
                                 <td colspan="6">
                                    <p class="txt-empty">작성한 글이 없습니다.</p>
                                 </td>
                              </tr>
                           </c:if>
                        </tbody>
                     </table>
                  </div>
                  <!-- //내가작성한 글:e -->

                  <!-- 예약목록:s -->
                  <div class="row">
                     <div class="col-8">
                        <h3 class="">최근 내 예약 목록</h3>
                     </div>
                     <div class="col-4 text-right pt-2">
                        <a href="${pageContext.request.contextPath}/mypage/viewReserve">전체보기</a>
                     </div>
                  </div>
                  <div class="table-responsive mb-5 border-bottom">
                     <table class="table table-hover">
                        <colgroup>
                           <col style="width: 10%;">
                           <col>                           
                           <col style="width: 15%;">
                           <col style="width: 10%;">
                           <col style="width: 15%;">
                           <col style="width: 10%;">
                        </colgroup>
                        <thead class="thead-dark">
                           <tr>
                                 <th scope="col" class="text-center">예약번호</th>
                              <th scope="col" class="text-center">가게이름</th>
                              <th scope="col" class="text-center">예약한 날짜</th>
                              <th scope="col" class="text-center">시간</th>
                              <th scope="col" class="text-center">예약된 날짜</th>
                              <th scope="col" class="text-center"></th>                           </tr>
                        </thead>
                        <tbody>
                           <c:if test="${!empty reserve}">
                              <c:forEach items="${reserve}" var="reserve2" begin="0" end="4">
                                 <form method="get" id="roomJoinFrm2"
                           action="${pageContext.request.contextPath}/room/reserve_undo">
                              <input type="hidden" name="rcode" value="${reserve2.rcode}">
                           <input type="hidden" name="ucode" value="${reserve2.ucode}" ></form>
                              <tr class="row-subject">
                                    <td class="text-center">${reserve2.recode}</td>
                                    <td class="text-center"><a
                                       href="${pageContext.request.contextPath}/room/readDetail?rcode=${reserve2.rcode}">${reserve2.name}</a></td>
                                    <td class="text-center"><fmt:formatDate
                                          value="${reserve2.regdate}" pattern="yyyy-MM-dd" /></td>
                                    <td class="text-center"><fmt:formatDate
                                          value="${reserve2.regtime}" pattern="HH:mm" /></td>
                                    <td class="text-center"><fmt:formatDate
                                          value="${reserve2.dateReserve}" pattern="yyyy-MM-dd" /></td>
                                    <td class="text-center">
                                    <button type="button" onclick="doNotReserve();"  class="btn btn-dark">예약 취소</button></td>
                                 </tr>
                                 
                              </c:forEach>
                           </c:if>
                           <c:if test="${empty reserve}">
                              <tr>
                                 <td colspan="6">
                                    <p class="txt-empty">예약이 없습니다.</p>
                                 </td>
                              </tr>
                           </c:if>
                        </tbody>
                     </table>
                  </div>
                  <!-- //예약목록:e -->
               </div>
               <div class="col-12">&nbsp;</div>
            </c:if>
         </div>
      </div>

      <c:if test="${empty member}">
         <script>
            alert('로그인이 필요한 서비스 입니다');
            location.href = '${pageContext.request.contextPath}/member/login';
         </script>
      </c:if>

   </div>
   <!-- Modal Review -->
   <div class="modal fade" id="PointSave" tabindex="-1" role="dialog" aria-labelledby="myReviewLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content" style="width: max-content;">
            <div class="modal-header">
               <h4 class="modal-title" id="myReviewLabel">QR 코드</h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <div id="qrcodeCanvas">
                  <c:if test="${empty Reserve_past}">
                     <div>
                        <h3>예약 내역이 없습니다</h3>
                     </div>
                  </c:if>
                  <c:forEach var="Reserve_past" items="${Reserve_past}">
                     <c:if test="${not empty Reserve_past}">
                        <div style="float: left;">
                           <h6>${Reserve_past.name}</h6>
                           <img src="https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=http%3a%2f%2f192.168.0.18%3a9999%2fojo%2fmypage%2fqrcode%3f${Reserve_past.rcode }%26${Reserve_past.ucode}">
                           <%--    src="https://chart.googleapis.com/chart?cht=qr&chs=200x200&chl=http://localhost:9999/ojo/mypage/qrcode?recode=${reserve_fixed.recode}&${"> --%>
                        </div>
                     </c:if>
                  </c:forEach>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!--// page-inner:e -->
   <jsp:include page="/include/footer_common.jsp" />
   <jsp:include page="/include/script_common.jsp" />
   <script>
   
   function doNotReserve(){
      if(confirm('스터디 룸 예약을 취소하시겠습니까?')==true){
         $('#roomJoinFrm2').submit();
      } else {
         return;
      }
   }   
   
   
   </script>
</body>
</html>