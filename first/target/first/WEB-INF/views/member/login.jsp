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
<h2>로그인하세요.</h2>
<form name="form1" method="post" action="${path}/member/login.do">
<table>
	<tr>
		<td>아이디</td>
		<td><input name="id"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="passwd" name="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인">
		</td>
	</tr>
</table>
</form>
<span style="color : red;">${message}</span>
</body>
</html>