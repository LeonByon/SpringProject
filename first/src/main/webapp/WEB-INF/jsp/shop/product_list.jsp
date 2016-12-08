<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<h2 style="text-align:center;">상품목록</h2>

<div style="text-align: center;">

<!--톰캑이 관리하는 배포 경로 확인  -->
<%out.println(application.getRealPath("/")); %>
<!-- 서버는 프로젝트를 서버에 올릴때 임시파일(temp)를 만들어서 publishing한다.
	이를 해제하고 실제 경로의 프로젝트를 publishing하기 위해서는
	실행시키는 server를 더블클릭 -> server options에 server modules without publishing를 체크
	임시파일은 서버를 종료하면 사라진다.
	임시파일에 파일을 저장하면 사라지기 때문  -->


<!-- var="개별값" items="리스트"  -->
	<ul id="listUl">
<c:forEach var="row" items="${list}">
		<li class="listLi">
		<input type="hidden" value="${row.product_id}">

			<img src="${path}/images/${row.picture_url}" width="150px" height="150px"><br>${row.product_name}<br>


		${row.price}원
		<!-- 장바구니에 담기  --><br>
				<c:if test="${sessionScope.id != null}">
				<tr>
					<td>
						<form name="form1" method="post" action="${path}/shop/cart_add.do">
							<input type="hidden" name="product_id" value="${row.product_id}">

							<select name="amount">
								<c:forEach begin="1" end="10" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							<input  type="image" src="${path}/images/cart.png"  style="margin: 0px; padding: 0px;">
						</form>
					</td>
				</tr>
				</c:if>
		<!--  -->
		<c:if test="${sessionScope.id == 'Admin'}">

			<input  type="image" src="${path}/images/edit.png"  onclick="location.href='${path}/shop/product_edit.do?product_id=${row.product_id}'">
		</c:if>
		</li>
</c:forEach>

	<li class="listLiAdd">
		<!-- if test="조건식  -->
		<!-- location.href= 페이지를 이동시킨다.  -->
		<c:if test="${sessionScope.id == 'Admin'}">
		<a href="${path}/shop/product_write.do">
		<br><img src="${path}/images/plus.png" width="180px" height="180px"><br>상품등록
		</a>
		</c:if>
	</li>
</ul>

</div>
</body>
</html>