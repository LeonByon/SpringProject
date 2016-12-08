<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--core tag 선언문  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- set var="변수명" value="값" -->
<!-- pageContext.request.contextPath
컨텍스트 이름을 리턴(request.getContextPath()와 같음) -->
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!-- /WEB-INF/view/include/menu.jsp -->
<!-- 상단메뉴 구성 -->
<div id="topMenu" style="text-align:center;">
<ul>
	<li class="topMenuLi"><a class="menuLink" href="${path}/main.do">HOME</a></li>
	<li>|</li>
	<li class="topMenuLi"><a class="menuLink" href="${path}/guestbook/list.do">편의점</a></li>
	<li>|</li>
	<li class="topMenuLi"><a class="menuLink" href="${path}/shop/product_list.do">주문</a>

		<ul class="subMenu">
			<li><a class="subMenuLink" href="${path}/shop/product_list.do">상품관리</a></li>
			<li><a class="subMenuLink" href="${path}/shop/cart_list.do">장바구니</a></li>
		</ul>
	</li>
	<li>|</li>
	<li class="topMenuLi"><a class="menuLink" href="#">게시판</a>
		<ul class="subMenu">
			<li><a class="subMenuLink" href="${path}/shop/product_list.do">자게이</a></li>
			<li><a class="subMenuLink" href="${path}/sample/openBoardList.do">정보공유게이</a></li>
		</ul>
	</li>
	<li>|</li>

	<!--로그인  -->
	<c:choose>
	<c:when test="${sessionScope.id == null}">
		<!--세션 변수 id값이 없을 때  -->
		<li class="menuRight"><a class="subMenuRight" href="#">회원가입</a>	</li>
		<li class="menuRight">|</li>
		<li class="menuRight"><a class="subMenuRight" href="${path}/member/login.do">로그인</a>	</li>
	</c:when>
	<c:otherwise>
		<!-- 세셩 변수 id값이 있을 때  -->
		<li class="menuRight"><a class="subMenuRight" href="${path}/member/logout.do">로그아웃</a></li>
		<li class="menuRight">[ ${sessionScope.id}님 로그인중... ]</li>
	</c:otherwise>
</c:choose>
</ul>
</div>

<hr>
<%-- ${path}는 web04이다
	프로잭트의 이름이 변경되어도 경로까지 안바꾸어도 됨  --%>