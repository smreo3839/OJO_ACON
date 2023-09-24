<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--/ footer Star /-->
<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				 <nav class="nav-footer">
					<ul class="list-inline">
					  <li class="list-inline-item">
						<a href="${pageContext.request.contextPath}">Home</a>
					  </li>
					  <li class="list-inline-item">
						<a href="${pageContext.request.contextPath}/room/list">StudyRoom</a>
					  </li>
					  <li class="list-inline-item">
						<a href="${pageContext.request.contextPath}/group/list">Community</a>						 
					  </li>
					</ul>
				 </nav>
				<div class="socials-a">
					<ul class="list-inline">
					  <li class="list-inline-item">
						 <a href="#">
							<i class="fa fa-facebook" aria-hidden="true"></i>
						 </a>
					  </li>
					  <li class="list-inline-item">
						 <a href="#">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						 </a>
					  </li>
					  <li class="list-inline-item">
						 <a href="#">
							<i class="fa fa-instagram" aria-hidden="true"></i>
						 </a>
					  </li>
					  <li class="list-inline-item">
						 <a href="#">
							<i class="fa fa-pinterest-p" aria-hidden="true"></i>
						 </a>
					  </li>
					  <li class="list-inline-item">
						 <a href="#">
							<i class="fa fa-dribbble" aria-hidden="true"></i>
						 </a>
					  </li>
					</ul>
				</div>
				<div class="copyright-footer">
					<p class="copyright color-text-a">
					  &copy;
					  <span class="color-a">STUDY CLUB</span> All Rights Reserved.
					</p>
				</div>			
				<div class="credits">
					<!--
					  All the links in the footer should remain intact.
					  You can delete the links only if you purchased the pro version.
					  Licensing information: https://bootstrapmade.com/license/
					  Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=EstateAgency
					-->
					Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
				</div>
			</div>
		</div>
	</div>
</footer>
<!--/ Footer End /-->

<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
<div id="preloader"></div>

<c:if test="${loginSucces eq true}">
<script>
	alert('${member.name}님 로그인 되었습니다!');
</script>
</c:if>