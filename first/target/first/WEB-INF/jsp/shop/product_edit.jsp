<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script>
function productUpdate(){
	//데이터를 받을 주소 지정
	document.form1.action="/first/shop/product_update.do";
	//폼의 데이터를 서버에 제출
	document.form1.submit();
}
function productDelete(){
	document.form1.action="/first/shop/product_delete.do";
	document.form1.submit();
}
</script>
</head>
<body>
<h2>상품 정보</h2>
<form name="form1" method="post" enctype="multipart/form-data">
<table>

				<tr>
					<td>상품명</td>
					<td><input name="product_name" value="${dto.product_name}"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input name="price" value="${dto.price}"></td>
				</tr>
				<tr>
					<td>비고</td>
					<td><textarea rows="5" cols="60" name="description">${dto.description}</textarea> </td>
				</tr>
				<tr>
					<td>
						<img src="${path}/images/${dto.picture_url}" width="200px" height="200px"><br>
						<input type="file" name="file1">
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<!--키값(상품코드)을 넘겨야 수정, 삭제가 가능함  -->
						<input type="hidden" name="product_id" value="${dto.product_id}">
						<input type="button" value="수정" onclick="productUpdate()">
						<input type="button" value="삭제" onclick="productDelete()">
					</td>
				</tr>
</table>
</form>
</body>
</html>