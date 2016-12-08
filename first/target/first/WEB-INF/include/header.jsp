<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- WEB-INF/views/include/header.jsp -->
    <!-- head 태그 내부에 들어갈 영역 -->
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<style>
body
{
  background-color:#eee
}
#topMenu{			/* topMenu의 ID를 가진 태그의 스타일 지정 */
		 height: 30px; 	/* topMenu의 높이를 30px로 설정(제대로 설정 안하면 아래 내용이 깨짐) */
         width: 100%;  /* topMenu의 넓이를 850px로 설정(제대로 설정 안하면 브라우져 넓이가 좁아지면 깨짐) */
         background-color: #2d2d2d;
	}
	#topMenu ul {           /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
        list-style-type: none;  /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
        margin: 0px;            /* 메인 메뉴 안의 ul의 margin을 없앰 */
        padding: 0px;           /* 메인 메뉴 안의 ul의 padding을 없앰 */
    }
	#topMenu ul li {                 /* topMenu의 ID를 가진 태그 안에 <ul> 태그 안에 <li> 태그의 스타일을 지정 */
         list-style: none;           /* <li> 태그는 위의 이미지처럼 목록을 나타내는 점을 없앤다  */
         color: white;               /* 글씨 색을 흰색으로 설정 */
         background-color: #2d2d2d;  /* 배경색을 진한 회색(RGB(2D,2D,2D)으로 설정 */
         float: left;                /* <li>태그들이 왼쪽에 흐르게 설정(그러면 아래있는 내용은 오른쪽으로 옴) */
         line-height: 30px;          /* 글씨가 가운데로 오도록 설정하기 위해 한줄의 높이를 30px로 설정 */
         vertical-align: middle;     /* 세로 정렬을 가운데로 설정(위의 line-height와 같이 설정 필요함) */
         text-align: center;         /* 글씨 정렬을 가운데로 설정 */
         position: relative;         /* 해당 li 태그 내부의 top/left 포지션 초기화 */
    }
    .menuLink, .subMenuLink {           /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
        text-decoration:none;               /* a 태그의 꾸밈 효과 제거 */
        display: block;                     /* a 태그의 클릭 범위를 넓힘 */
        width: 150px;                       /* 기본 넓이를 150px로 설정 */
        font-size: 12px;                    /* 폰트 사이즈를 12px로 설정 */
        font-weight: bold;                  /* 폰트를 굵게 설정 */
        font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */
    }
    .menuLink {     /* 상위 메뉴의 글씨색을 흰색으로 설정 */
        color: white;
    }
    .topMenuLi:hover .menuLink {    /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
        color: red;                 /* 글씨 색 빨간색 */
        background-color: #4d4d4d;  /* 배경색을 밝은 회색으로 설정 */
    }
    .subMenuLink {          /* 하위 메뉴의 a 태그 스타일 설정 */
        color: #2d2d2d;             /* 글씨 색을 RGB(2D2D2D)로 설정 */
        background-color: white;    /* 배경색을 흰색으로 설정 */
        border: solid 1px black;    /* 테두리를 설정 */
        margin-top: -1px;           /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
        font-family: HY나무B;

    }
    .subMenu {              /* 하위 메뉴 스타일 설정 */
        position: absolute;     /* html의 flow에 영향을 미치지 않게 absolute 설정 */
        height: 0px;            /* 초기 높이는 0px로 설정 */
        overflow: hidden;       /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
        transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
        -webkit-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
        -moz-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
        -o-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
    }
    .topMenuLi:hover .subMenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
        height: 93px;           /* 높이를 93px로 설정 */
    }
    .subMenuLink:hover {        /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
        color: red;                 /* 글씨색을 빨간색으로 설정 */
        background-color: #dddddd;  /* 배경을 RGB(DDDDDD)로 설정 */
    }
	.subMenuRight{
		float : right;
		color: white;

	}
	#topMenu li.menuRight{float:right;}

	#listUl{
		overflow: auto;


		width:100%;
	}
	.listLi{
	font-family: HY나무B;
	 border: 1px solid rgb(215, 215, 215); height: 250px; width: 194px;
	 list-style: none;float: left;
}
	.listLi:hover{
	background-color:#BDBDBD;
}
.listLiAdd{
	 border: 1px solid rgb(215, 215, 215); height: 250px; width: 194px;
	 list-style: none; float: left;
}
.listLiAdd:hover{
background-color:#BDBDBD
}

.cartTable {
    border-collapse: collapse;
    width: 500px;
    font-family: HY나무B;
}

.cartTable th, td {
    text-align: left;
    padding: 8px;
}

.cartTable tr:nth-child(even){background-color: #f2f2f2}

.cartTable th {
    background-color: #4CAF50;
    color: white;
}


</style>