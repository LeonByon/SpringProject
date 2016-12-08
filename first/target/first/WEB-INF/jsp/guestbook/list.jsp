<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/header.jsp"%>
</head>
<body>
<%@include file="../include/menu.jsp"%>
<c:forEach var="row" items="${items}">
<table border="1" style="width:600px;">
	<tr>
		<td>이름</td>
		<td>${row.name}</td>
		<td>날짜</td>
		<td>${row.post_date}</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td colspan="3">${row.email}</td>
	</tr>
	<tr>
		<td colspan="4">${row.content}</td>
	</tr>
	<tr>
		<td conspan="4">
		비밀번호
		<input type="password" name="passwd">
		<input type="submit" value="수정/삭제">
		</td>
	</tr>
</table>
</c:forEach>
</body>
</html>