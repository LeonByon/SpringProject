<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp"%>
</head>
<body>
<%@include file="../include/menu.jsp"%>
<h2>상품목록</h2>
<!-- if test="조건식  -->
<!-- location.href= 페이지를 이동시킨다.  -->
<div style="text-align: center;">
<c:if test="${sessionScope.id == 'admin'}">
	<input type="button" value="상품등록" onclick="location.href='${path}/shop/product_write.do'">
</c:if>

<!--톰캑이 관리하는 배포 경로 확인  -->
<%out.println(application.getRealPath("/")); %>

<table align="center" border="1" width="400px;">
	<tr>
		<th>상품ID</th>
		<th>상품명</th>
		<th>가격</th>
	</tr>
<!-- var="개별값" items="리스트"  -->
<c:forEach var="row" items="${list}">
	<tr>
		<td>${row.product_id}</td>
		<td>
			<a href="${path}/shop/product_detail.do?product_id=${row.product_id}">
			<img src="${path}/images/${row.picture_url}" width="100px" height="100px"><br>${row.product_name}
			</a>
		<c:if test="${sessionScope.id == 'admin'}">
			<br>
			<input type="button" value="편집" onclick="location.href='${path}/shop/product_edit.do?product_id=${row.product_id}'"> 
		</c:if>
		</td>
		<td>${row.price}</td>
	</tr>
</c:forEach>
</table>
</div>
</body>
</html>