<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<table class="board_view">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>게시글 상세</caption>
        <tbody>
            <tr>
                <th scope="row">글 번호</th>
                <td>${map.IDX }</td>
                <th scope="row">조회수</th>
                <td>${map.HIT_CNT }</td>
            </tr>
            <tr>
                <th scope="row">작성자</th>
                <td>${map.CREA_ID }</td>
                <th scope="row">작성시간</th>
                <td>${map.CREA_DTM }</td>
            </tr>
            <tr>
               	<th scope="row">별점</th>
               	<td colspan="3">
               		<p class="star_rating">
                           <c:forEach begin="1" end="${map.STAR}" step="1">
							<a href="#" class="on">★</a>
						</c:forEach>
					</p>
               	</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${map.TITLE}</td>
            </tr>
            <tr>
                <td colspan="4">${map.CONTENTS}</td>
            </tr>
            <tr>
            	<th scope="row">첨부파일</td>
            	<td colspan="3">
            		<c:forEach var="row" items="${list}">
            			<div>
            			<input type="hidden" id="IDX" value="${row.IDX}">
            			<a href="#this" name="file">${row.ORIGINAL_FILE_NAME}</a>
            			(${row.FILE_SIZE}kb)
            			</div>
            		</c:forEach>
            	</td>
            </tr>
        </tbody>
	</table>

	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>

	<p>&nbsp;</p>
	<div style="border: 1px solid; width: 600px; padding: 5px">
		<form name="frm" id="frm">
	        <input type="hidden" id="IDX" value="${map.IDX}">
	       	 작성자: <input type="hidden" id = "REWRITER" name="REWRITER" size="20" maxlength="20" value="${sessionScope.id}">${sessionScope.id}<br/>
	        <textarea name="RECONTENT" id="RECONTENT" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
	        <a href="#this" class="btn" id="rewrite">저장</a>
		</form>
	</div>

	<c:forEach var="relist" items="${relist}" varStatus="status">
	    <div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;">
	    	<input type="hidden" id="RENO" value="${relist.RENO}">
	    	<input type="hidden" id="REWRITER2" value="${relist.REWRITER}">
	        <div>${relist.REWRITER}</div>
	        <div>${relist.REINDATE}</div>
	        <div id="reply${relist.RENO}">${relist.RECONTENT}</div>
	        <br/>
	        <a href="#this" class="btn" id="redelete" name="redelete">삭제</a>
	        <a href="#this" class="btn" id="reUpForm" name="reUpForm">수정</a>
	    </div>
	</c:forEach>

	<div id="replyDiv" style="width: 99%; display:none">
		<form name="frm2" id="frm2">
			<input type="hidden" name="BRDNO" value="${map.IDX}">
			<input type="hidden" name="RENO">
			<textarea rows="3" cols="60" maxlength="500" name="RECONTENT"></textarea>
			<a href="#this" class="btn" id="reUpSave">저장</a>
			<a href="#this" class="btn" id="reUpCancel">취소</a>
		</form>
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script>

		$(document).ready(function(){
			$("#list").on("click",function(e){
				e.preventDefault();
				fn_openBoardList();
			});

			$("#update").on("click",function(e){
				e.preventDefault();
				fn_openBoardUpdate();
			});

			$("a[name='file']").on("click", function(e){ //파일 이름
				e.preventDefault();
				fn_downloadFile($(this));
			});

			$("#rewrite").on("click", function(e){
				e.preventDefault();
				fn_reInsert();
			});

			$("a[name='redelete']").on("click", function(e){
				var rewriter = $(this).parent().find("#REWRITER2").val();
				e.preventDefault();
				fn_reDelete($(this),rewriter);
			});

			$("a[name='reUpForm']").on("click", function(e){
				e.preventDefault();
				var rewriter = $(this).parent().find("#REWRITER2").val();
				fn_reUpForm($(this),rewriter);
			});

			$("#reUpSave").on("click", function(e){
				e.preventDefault();
				fn_reUpSave();
			});

			$("#reUpCancel").on("click", function(e){
				e.preventDefault();
				fn_reUpCancel();
			});
		});

		function fn_openBoardList(){
 			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
			comSubmit.submit();
		}

		function fn_openBoardUpdate(){
			if(${sessionScope.id eq map.CREA_ID} || ${sessionScope.id eq "Admin"}){
            var idx = "${map.IDX}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
            comSubmit.addParam("IDX", idx);
			comSubmit.submit();
			}else{
				alert('권한이 없습니다.');
			}
		}

		function fn_downloadFile(obj){
			var idx = obj.parent().find("#IDX").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/common/downloadFile.do' />");
			comSubmit.addParam("IDX",idx);
			comSubmit.submit();
		}

		function fn_reInsert(){

		    if (frm.RECONTENT.value=="") {
		        alert("댓글 내용을 입력해주세요.");
		        frm.RECONTENT.focus();
		        return;
		    }

			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/sample/reInsert.do' />");
			comSubmit.addParam("IDX",idx);
			comSubmit.submit();
		}

		function fn_reDelete(obj,rewriter){
			if("${sessionScope.id}" == rewriter || ${sessionScope.id eq "Admin"}){
			var idx = "${map.IDX}";
			var reno = obj.parent().find("#RENO").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/deleteRelist.do' />");
			comSubmit.addParam("RENO",reno);
			comSubmit.addParam("IDX",idx);
			comSubmit.submit();
			}else{
				alert('권한이 없습니다.');
			}
		}

		var updateReno = updateRecontent = null;
		function fn_reUpForm(obj,rewriter){
			if("${sessionScope.id}" == rewriter || ${sessionScope.id eq "Admin"}){
			var reno = obj.parent().find("#RENO").val();
			var form = document.frm2;
			var reply = document.getElementById("reply"+reno);
			var replyDiv = document.getElementById("replyDiv");
			replyDiv.style.display = "";

			if(updateReno){
				document.body.appendChild(replyDiv);
				var oldReno = document.getElementById("reply"+updateReno);
				oldReno.innerText = updateRecontent;
			}

			form.RENO.value = reno;
			form.RECONTENT.value = reply.innerText;
			reply.innerText = "";
			reply.appendChild(replyDiv);
			updateReno = reno;
			updateRecontent = form.RECONTENT.value;
			form.RECONTENT.focus();
			}else{
				alert('권한이 없습니다.');
			}
		}

		function fn_reUpSave(){

		    if (frm2.RECONTENT.value=="") {
		        alert("댓글 내용을 입력해주세요.");
		        frm2.RECONTENT.focus();
		        return;
		    }

			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit("frm2");
			comSubmit.setUrl("<c:url value='/sample/reInsert.do' />");
			comSubmit.addParam("IDX",idx);
			comSubmit.submit();
		}

		function fn_reUpCancel(){
			var form = document.form2;
			var replyDiv = document.getElementById("replyDiv");
			document.body.appendChild(replyDiv);
			replyDiv.style.display = "none";

			var oldReno = document.getElementById("reply"+updateReno);
			oldReno.innerText = updateRecontent;
			updateReno = updateRecontent = null;
		}
	</script>
</body>
</html>