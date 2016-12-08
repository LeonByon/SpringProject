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

<h2>상품 정보</h2>
<table>
	<tr>
		<td>
			<img src="${path}/images/${dto.picture_url}">
		</td>
		<td align="center">
			<table>
				<tr>
					<td>상품명</td>
					<td>${dto.product_name}</td>
				</tr>
				<tr>
					<td>가격</td>
					<td>${dto.price}</td>
				</tr>
				<tr>
					<td>비고</td>
					<td>${dto.description}</td>
				</tr>

			</table>
		</td>
	</tr>
</table>
</body>
</html>