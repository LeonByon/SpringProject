<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp"%>
<script>
//cartDel('5') 5번 레코드라 삭제된
function cartDel(idx){
		//확인 버튼을 누르면 true, 취소 버튼을 누르면 false
	if(confirm("삭제할까요?")){
		//location.href="이동할 주소";
		location.href= "/web04/shop/cart_del.do?idx="+idx;
	}
}
function cartDelAll(){
	if(confirm("장바구니를 비울까요?")){
		location.href= "/web04/shop/cart_del_all.do";
	}
}
</script>
</head>
<body>
<%@include file="../include/menu.jsp"%>
<h2>장바구니</h2>
<!--${items.size()} 레코드수  -->
<c:if test="${items.size() ==0 }">
	장바구니가 비었습니다.
</c:if>
<c:if test="${items.size() > 0 }">
<input type="button" value="장바구니 비우기" onclick="cartDelAll()">
<table border="1">
	<tr>
		<th>상품명</th>
		<th>단가</th>
		<th>수량</th>
		<th>금액</th>
		<th>&nbsp;</th> <!--공백  -->
	</tr>
	
	<!-- Controller에서 list를 담은 model의 변수 값이 items이므로 태그안의 items값은 ${items}가 된다.  그래서 list에 있는 첫번채 래코드 두번째래코드..를 for문으로 출력
		결국 ${items}에 들어있는 것은 DTO이기 때문에 bean이 호출됨
	-->
	<c:set var="total" value="0"></c:set>
	<c:forEach var="row" items="${items}">
		<c:set var="total" value="${total + row.money}"/>
		<tr>
			<td>${row.product_name}</td>
			<td>${row.price}</td>
			<td>${row.amount}</td>
			<td>${row.money}</td>
			<td><input type="button" value="삭제" onclick="cartDel('${row.idx}')"></td>
		</tr>
	</c:forEach>
	
	<tr>
		<td colspan="5">
			합계금액 : ${total}<br>
		<c:set var="fee" value="0"></c:set>
	<c:choose>
		<c:when test="${total >= 20000}">
			<c:set var="fee" value="0" />
		</c:when>
		<c:otherwise>
			<c:set var="fee" value="2500" />
		</c:otherwise>
	</c:choose>
			배송료 : ${fee}<br>
			결제금액 : ${total + fee}
		</td>
	</tr>
</table>
</c:if>
</body>
</html>