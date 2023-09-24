<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="designPath" value="${pageContext.request.contextPath}/resources/vendor/template-kit" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta content="width=device-width, initial-scale=1.0" name="viewport">
   <jsp:include page="/include/lib_common.jsp"/>
   <title>내 예약 목록</title>
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
                     <h1 class="title-single">내 예약 목록</h1>
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
                     내 예약 목록
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
                              <th scope="col" class="text-center"></th>
                  </tr>
               </thead>
               <tbody>
                  <c:if test="${!empty reserve}">
                  <c:forEach items="${reserve}" var="reserve2">
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
                     <td colspan="8">
                        <p class="txt-empty">예약이 없습니다.</p>
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