<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
	<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<meta charset="UTF-8">
	<title>http://www.blueb.co.kr</title>

<style rel="stylesheet">
body
{
  background-color:#eee
}
.wrap
{
  margin:50px auto 0 auto;
  width:100%;
  display:flex;
  align-items:space-around;
  max-width:1200px;
}
.tile
{
  width:380px;
  height:380px;
  margin:10px;
  background-color:#99aeff;
  display:inline-block;
  background-size:cover;
  position:relative;
  cursor:pointer;
  transition: all 0.4s ease-out;
  box-shadow: 0px 35px 77px -17px rgba(0,0,0,0.44);
  overflow:hidden;
  color:white;
  font-family:'Roboto';

}
.tile img
{
  height:100%;
  width:100%;
  position:absolute;
  top:0;
  left:0;
  z-index:0;
  transition: all 0.4s ease-out;
}
.tile .text
{
/*   z-index:99; */
  position:absolute;
  padding:30px;
  height:calc(100% - 60px);
  height:calc(100% - 60px);
}
.tile h1
{

  font-weight:300;
  margin:0;
  text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
}
.tile h2
{
  font-weight:100;
  margin:20px 0 0 0;
  font-style:italic;
   transform: translateX(200px);
}
.tile p
{
  font-weight:300;
  margin:20px 0 0 0;
  line-height: 25px;
/*   opacity:0; */
  transform: translateX(-200px);
  transition-delay: 0.2s;
}
.animate-text
{
  opacity:0;
  transition: all 0.6s ease-in-out;
}
.tile:hover
{
/*   background-color:#99aeff; */
box-shadow: 0px 35px 77px -17px rgba(0,0,0,0.64);
  transform:scale(1.05);
}
.tile:hover img
{
  opacity: 0.2;
}
.tile:hover .animate-text
{
  transform:translateX(0);
  opacity:1;
}
.dots
{
  position:absolute;
  bottom:20px;
  right:30px;
  margin: 0 auto;
  width:30px;
  height:30px;
  color:currentColor;
  display:flex;
  flex-direction:column;
  align-items:center;
  justify-content:space-around;

}

.dots span
{
    width: 5px;
    height:5px;
    background-color: currentColor;
    border-radius: 50%;
    display:block;
  opacity:0;
  transition: transform 0.4s ease-out, opacity 0.5s ease;
  transform: translateY(30px);

}

.tile:hover span
{
  opacity:1;
  transform:translateY(0px);
}

.dots span:nth-child(1)
{
   transition-delay: 0.05s;
}
.dots span:nth-child(2)
{
   transition-delay: 0.1s;
}
.dots span:nth-child(3)
{
   transition-delay: 0.15s;
}


@media (max-width: 1000px) {
  .wrap {
   flex-direction: column;
    width:400px;
  }
}
</style>
</head>
<body>

<div class="wrap">
<a href="${path}/shop/product_list.do">
<div class="tile">
  <img src="${path}/images/logo01.jpg"/>
  <div class="text">
  <h1>7-Eleven, Inc.</h1>
  <h2 class="animate-text">제휴 할인 및 적립.</h2>
  <p class="animate-text">제휴할인 <br>
  						&nbsp;&nbsp;&nbsp;&nbsp;T-멤버십 1,000원당 100원 할인<br>&nbsp;&nbsp;&nbsp;&nbsp;(골드/VIP등급 기준)<br><br>
  						포인트 적립<br>
  						&nbsp;&nbsp;&nbsp;&nbsp;L.포인트 0.5%
  </p>
<div class="dots">
    <span></span>
    <span></span>
    <span></span>
  </div>
  </div>
 </div>
</a>

<div class="tile">
  <img src="${path}/images/logo02.jpg">
  <div class="text">
  <h1>CU</h1>
  <h2 class="animate-text">제휴 할인 및 적립.</h2>
  <p class="animate-text">제휴할인 <br>
  						&nbsp;&nbsp;&nbsp;&nbsp;T-멤버십 1,000원당 50원 할인
						&nbsp;&nbsp;&nbsp;&nbsp;5,000원당 SK텔레콤 데이터 50MB 적립<br><br>
  						포인트 적립<br>
  						&nbsp;&nbsp;&nbsp;&nbsp;CU 멤버십 1~2% 적립<br>
  						&nbsp;&nbsp;&nbsp;&nbsp;E1 오렌지 포인트 1% 적립

  </p>
<div class="dots">
    <span></span>
    <span></span>
    <span></span>
  </div>
  </div>
 </div>

  <div class="tile">
  <img src="${path}/images/logo03.jpg"/>
  <div class="text">
  <h1>Ministop Co. Ltd.</h1>
  <h2 class="animate-text">제휴 할인 및 적립.</h2>
  <p class="animate-text">&nbsp;&nbsp;&nbsp;&nbsp;KT Olleh/SKT 15% 할인<br><br>
  						포인트 적립<br>
  						&nbsp;&nbsp;&nbsp;&nbsp;OK Cashbag 1%적립 또는  15%할인

  </p>
<div class="dots">
    <span></span>
    <span></span>
    <span></span>
  </div>
  </div>
 </div>
</div>


</div>


</body>
</html>




