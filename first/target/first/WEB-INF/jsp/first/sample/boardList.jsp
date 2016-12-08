<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value='/css/searchui.css'/>">
</head>
<body>
<div class="d1">
	<form id="search" name="search">
	<select name="keyField" size="1">
		<option value="CREA_ID" <c:if test="${'CREA_ID'==keyField }"> selected</c:if>> 이름 </option>
		<option value="TITLE" <c:if test="${'TITLE'==keyField }"> selected</c:if>> 제목 </option>
		<option value="CONTENTS" <c:if test="${'CONTENTS'==keyField }"> selected</c:if>> 내용 </option>
	</select>
	<input type="text" name="keyWord" value="${keyWord}" placeholder="검색어 입력">
	<button onclick="#this" id="searchc"></button>
	</form>
</div>

<table class="board_list" style="margin:auto;">
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="15%"/>
        <col width="20%"/>
    </colgroup>
    <thead>
        <tr>
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
                <th scope="col">별점</th>
                <th scope="col">작성자</th>
                <th scope="col">조회수</th>
                <th scope="col">작성일</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${fn:length(list) > 0}">
                <c:forEach items="${list}" var="row" varStatus="status">
                    <tr>
                            <td>${row.IDX }</td>
                            <td class="title">
                                <a href="#this" name="title">${row.TITLE }</a>
                                <input type="hidden" id="IDX" value="${row.IDX}">
                            </td>
                            <td>
								<p class="star_rating">
		                            <c:forEach begin="1" end="${row.STAR}" step="1">
										<a href="#" class="on">★</a>
									</c:forEach>
								</p>
                            </td>
                            <td>${row.CREA_ID}</td>
                            <td>${row.HIT_CNT }</td>
                            <td>${row.CREA_DTM }</td>
                        </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>
<div id="pagin">
<c:if test="${not empty paginationInfo}">
	<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="fn_search"/>
</c:if>
<input type="hidden" id="currentPageNo" name="currentPageNo"/>
</div>
<br/>
<div id="btn">
<a href="#this" class="btn" id="write">글쓰기</a>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script>
	$(document).ready(function(){
		$("#write").on("click", function(e){
			e.preventDefault();
			fn_openBoardWrite();
		});

		$("a[name='title']").on("click", function(e){
			e.preventDefault();
			fn_openBoardDetail($(this));
		});

		$("#searchc").on("click", function(e){
			e.preventDefault();
			fn_searchList($(this));
		});
	});


	function fn_openBoardWrite(){
		if("${sessionScope.id}" != ""){
 		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/sample/openBoardWrite.do' />");
		comSubmit.submit();
		}else{
			alert('로그인이 필요합니다.');
		}
	}

	function fn_openBoardDetail(obj){
		if("${sessionScope.id}" != ""){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/sample/openBoardDetail.do' />");
		//jQuert를 이용하여 선택된 <a> 태그의 부모 노드 내에서 num 이라는 값을 가진 태그를 찾아서, 그 태그의 값을 가져오도록 한다.
		comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
		comSubmit.addParam("flag", true);
		comSubmit.submit();
		}else{
			alert('로그인이 필요합니다.');
		}
	}

	function fn_search(pageNo){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
		comSubmit.addParam("currentPageNo", pageNo);
		comSubmit.submit();
	}

	function fn_searchList(obj){
		if (document.search.keyWord.value == "") {
            alert("검색어를 입력하세요.");
            document.search.keyWord.focus();
            return;
        }
 		var comSubmit = new ComSubmit("search");
		comSubmit.setUrl("<c:url value='/sample/searchList.do' />");
		comSubmit.submit();
	}
</script>
</body>
</html>