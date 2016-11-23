<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id="frm">
		<table class="board_view">
			<colgroup>
				<col width="15%"/>
				<col width="35%"/>
				<col width="15%"/>
				<col width="35%"/>
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>
						${map.NUM }
						<input type="hidden" id="NUM" name="NUM" value="${map.NUM }">
					</td>
					<th scope="row">조회수</th>
					<td>${map.VIEWS }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.NAME }</td>
					<th scope="row">작성시간</th>
					<td>${map.INDATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<input type="text" id="TITLE" NAME="TITLE" CLASS="wdp_90" value="${map.TITLE }"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="CONTENT" NAME="CONTENT">${map.CONTENT}</textarea>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>

<a href="#this" class="btn" id="list">목록으로</a>
<a href="#this" class="btn" id="update">저장하기</a>
<a href="#this" class="btn" id="delete">삭제하기</a>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script>
	$(document).ready(function(){
		$("#list").on("click",function(e){
			e.preventDefault();
			fn_openBoardList();
		});

		$("#update").on("click", function(e){
			e.preventDefault();
			fn_updateBoard();
		});

		$("#delete").on("click", function(e){
			e.preventDefault();
			fn_deleteBoard();
		});
	});

	function fn_openBoardList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
		comSubmit.submit();
	}

	function fn_updateBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/sample/updateBoard.do' />");
		comSubmit.submit();
	}

	function fn_deleteBoard(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/sample/deleteBoard.do' />");
		comSubmit.addParam("NUM",$("#NUM").val());
		comSubmit.submit();
	}
</script>
</html>