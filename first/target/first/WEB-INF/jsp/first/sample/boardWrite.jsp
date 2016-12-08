<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
				</tr>
				<tr>
					<th scope="row">글쓴이</th>
					<td><input type="hidden" id="CREA_ID" name="CREA_ID" class="wdp_90" value="${sessionScope.id}"></input>${sessionScope.id}</td>
				</tr>

				<tr>
					<th scope="row">별점</th>
					<td>
						<p class="star_rating">
						    <a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						    <a href="#" class="on">★</a>
						    <a href="#">★</a>
						    <a href="#">★</a>
						</p>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="fileDiv">
			<p>
				<input type="file" name="file" name="file_0">
				<a href="#this" class="btn" id="delete" name="delete">삭제</a>
			</p>
		</div>

		<br/><br/>
		<a href="#this" class="btn" id="addFile">파일 추가</a>
		<a href="#this" class="btn" id="write" >작성하기</a>
		<a href="#this" class="btn" id="list" >목록으로</a>
	</form>

	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script>
	//파일의 크기나 유효성 검사도 하지 않았으며, 추가할 수 있는 파일의 개수도 제한하지 않았다.
	//또한 파일의 전송에 따라서 파일의 순서가 바뀔수도 있기 때문에, 첨부파일의 순서를 지정하는 작업도 필요하다.
		if(${sessionScope.id eq null}){
			alert("누구냐 넌");
			location.href = '/first/member/login.do';
		}
		var gfv_count = 1;

		$(document).ready(function(){
			$("#write").on("click", function(e){
				e.preventDefault();
				fn_insertBoard();
			});
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			$("#addFile").on("click", function(e){
				e.preventDefault();
				fn_addFile();
			});
			$("a[name='delete']").on("click", function(e){
				e.preventDefault();
				fn_deleteFile($(this));
			});
			$( ".star_rating a" ).click(function() {
			     $(this).parent().children("a").removeClass("on");
			     $(this).addClass("on").prevAll("a").addClass("on");
			     return false;
			});
		});

		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
			comSubmit.submit();
		}

		function fn_insertBoard(){

		    if (frm.TITLE.value=="") {
		        alert("글 제목을 입력해주세요.");
		        frm.TITLE.focus();
		        return;
		    }
		    if (frm.CONTENTS.value=="") {
		        alert("글 내용을 입력해주세요.");
		        frm.CONTENTS.focus();
		        return;
		    }
		    var starVal = $('.on').length;
 			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/sample/insertBoard.do' />");
			comSubmit.addParam("STAR",starVal);
			comSubmit.submit();
		}

		function fn_addFile(){
			var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e){
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}

		function fn_deleteFile(obj){
			obj.parent().remove();
		}
	</script>
</body>
</html>