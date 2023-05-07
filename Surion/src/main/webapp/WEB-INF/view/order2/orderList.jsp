<%@page import="com.surion.entity.OrderForm"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<%@ include file="../common/front_header.jsp"%>

<style>
ul {
		padding-left: 0;
	}
	.sec_content {
		width: 100%;
		margin-bottom: 4rem;
	}
	.headLine {
		height: 70px;
		box-sizing: border-box;
		padding-top: 0.7rem;
		display: flex;
		margin-top: 2rem;
		border-radius: 1rem;
		color: #000;
		justify-content: space-between;
	}
	.hbutton {
		width: 18%;
		height: 3rem;
		margin: 0.5rem 0 0 5rem;
		background: #00c7ae;	
		border-style: none;
		border-radius: 0.4rem;
		color: #fff;
	}
	
	.headLine p {
		width: 25%;
		font-size: 1.2rem;
		font-weight: bold;
		padding: 1rem;
	}
	
	.inputBtn {
		font-size: 1.3rem;
		width: 2rem;
		height: 1rem;
		color: #847d7d;
		padding-left: 0.5rem;
		display: none;
	}
	.inputBtn.active {
		display: unset;
	}
	.askList {
		width: 100%;
		display: flex;
		flex-wrap: wrap;
	}
	.repairList {
		width: 22%;
		height: 20rem;
		margin-right: 4%;
		margin-top: 4%;
		color: #000;
	}
	
	.askList div:last-child {
		margin-right: auto;
	}
	.askList div:nth-child(4n) {
		margin-right: 0px;
	}
	
	.askListA {
		height: 192px;
	}
	.askListA img {
		width:100%;
		height: 100%;
		cursor: pointer;
		border-radius: 0.5rem;
	}
	.askListP {
		padding-top: 1rem;
	}
	.askListP li{
		overflow: hidden;
		text-overflow: ellipsis;
		word-break: break-all;
	}
	.askListP li:nth-child(1){
		color: rgb(154, 155, 167);
		font-size: 12px;
	}
	.askListP li:nth-child(2){
		height: 50px;
		margin: 8px 0px 16px
	}
	.orderList {
		width: 22%;
		height: 20rem;
		margin-right: 4%;
		margin-top: 4%;
		color: #000;
	}

.price {
	display: flex;
	justify-content: flex-end;
	font-weight: bold;
}

.price img {
	width: 23px;
	margin-right: 2px;
}

.star {
	display: flex;
	justify-content: flex-end;
	font-weight: bold;
	font-size: 9pt;
}

.askSearch {
	width: 50%;
	height: 2.5rem;
	background: #eeeeee;
	margin: 0.8rem 3rem 0 3.5rem;
	border-radius: 0.5rem;
}

	.ser {
		width: 78%;
		height: 100%;
		margin-left: 1rem;
		border-style: none;
		background: #eeeeee;
	}

	input:focus {
		outline: none;
	}

	.fa-magnifying-glass {
	font-size: 1.5rem;
	color: #ccc;
	padding-left: 1rem;
	}
	.under {
	    display: flex;
   		justify-content: center;
   		margin-top: 3rem;
   		align-items: center;
	}
	.underPage {
		display: flex;
	}
	
	
	.underPage li a {
		padding: 0 2rem 0 2rem;
		font-size: 14px;
	}
	.underPage button {
		padding: 0 2rem 0 2rem;
		font-size: 14px;
	}
	
	.custom-btnn {
		width: 45px;
		height: 40px;
		padding: 7px 6px;
		font-family: 'Lato', sans-serif;
		background: #fff;
		cursor: pointer;
		transition: all 0.3s ease;
		position: relative;
		display: inline-block;
		border-radius: 15px;
		font-weight: bold;
	}
	
	.btn-11 {
	  	overflow: hidden;
	  	transition: all 0.3s ease;
	}
	
	.btn-11:hover {
		background: #00c7ae;
		color: #fff;
	}
	
	.btn-11:before {
	    position: absolute;
	    content: '';
	    display: inline-block;
	    top: -180px;
	    left: 0;
	    width: 30px;
	    height: 100%;
	    background-color: #fff;
	    animation: shiny-btn1 3s ease-in-out infinite;
	}
	
	.btn-11:active{
	  	box-shadow:  4px 4px 6px 0 rgba(255,255,255,.3),
	              -4px -4px 6px 0 rgba(116, 125, 136, .2), 
	    inset -4px -4px 6px 0 rgba(255,255,255,.2),
	    inset 4px 4px 6px 0 rgba(0, 0, 0, .2);
	}
	
	.bold a {
		color: #00c7ae;
	}
	
	.view {
	    font-size: 1rem;
   	 	color: rgb(154, 155, 167);
   	 	align-items: center;
	}
	

	/* 	버튼 */
	.custom-btn {
		width: 80px;
		height: 30px;
		color: #fff;
		border-radius: 25px;
		font-family: 'Lato', sans-serif;
		font-weight: 500;
		background: transparent;
		cursor: pointer;
		transition: all 0.3s ease;
		position: relative;
		display: inline-block;
		outline: none;
		font-size: 12px;
		margin-right: 1rem;
	}

	/* 1 */
	.btn-1 {
		background: rgb(6,14,131);
		background: linear-gradient(0deg, rgb(78 229 181) 0%, #4fc3b3 100%);
		border: none;
	}
	
	.btn-1:hover {
		background: rgb(0,3,255);
		background: linear-gradient(0deg, #ccc 0%, #6c757d 100%);
	}
	
	.category-Btn {
		margin-top: 1rem;
		display: flex;
		align-items: center;
	}
	
	.btn-1.active {
		background: rgb(0,3,255);
		background: linear-gradient(0deg, #ccc 0%, #6c757d 100%);
	}
	

</style>
<body>
	<%@ include file="../common/header.jsp"%>
	
	<div class="sec_content">
		<div class="suriSize st">
		<div class="headLine">
		<p>최신 프로필 목록 리스트! &#128204;</p>
		<form action="orderListSearch" method="get" class="askSearch">
			<i class="fa-solid fa-magnifying-glass"></i>
				<input type="search" class="ser" placeholder="키워드를 검색해주세요." name="keyword" value="${pageMaker.cri.keyword}"/>
		</form>
			<c:choose>
				<c:when test="${result == 1}">
					<button class="hbutton" onclick="alert('이미 업체 등록을 하셨습니다.')">업체 등록</button>
				</c:when>
				<c:when test="${member eq null}">
					<button class="hbutton" onclick="loginCall()">업체 등록</button>
				</c:when>
				<c:when test="${check ==0 && result == 0}">
					<button class="hbutton" onclick="addressCall()">업체 등록</button>
				</c:when>
				<c:otherwise>
					<button class="hbutton" onclick="location.href='${cpath}/order2/orderForm'">업체 등록</button>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="category-Btn">
			<button onclick="typeClick($(this));" class="popular custom-btn btn-1" data-btn="recent">#최신순</button>
			<button onclick="typeClick($(this));" class="recent custom-btn btn-1" data-btn="popular">#인기순</button>
			<button onclick="typeClick($(this));" class="cycle custom-btn btn-1" data-btn="cycle">#자전거</button>
			<button onclick="typeClick($(this));" class="bike custom-btn btn-1" data-btn="bike">#오토바이</button>
			<button onclick="typeClick($(this));" class="Airconditioner custom-btn btn-1" data-btn="Airconditioner">#에어컨</button>
			<button onclick="typeClick($(this));" class="boiler custom-btn btn-1" data-btn="boiler">#보일러</button>
			<button onclick="typeClick($(this));" class="computer custom-btn btn-1" data-btn="computer">#컴퓨터</button>
			<button onclick="typeClick($(this));" class="sound custom-btn btn-1" data-btn="sound">#음향/악기</button>
		</div>
		
			<ul class="askList">
			 <c:forEach items="${list}" var="order">
				<div class="orderList">
					<div class="askListA" onclick="location.href='${cpath}/order2/productDetail?id=${order.id}'">
 						<img src="${cpath}/resources/images/order/${order.img}" alt="" />
					</div>
					<div class="askListP">
						<li>${order.shopName}</li>
						<c:set var="intro" value="${order.intro}" />
						<c:if test="${fn:length(intro) gt 40}">
							<c:set var="intro" value="${fn:substring(intro, 0, 40)}" />
						</c:if>
						<li>${intro} ...</li>
						<div class="price">
							<li>${order.office}</li>
						</div>
						<div class="star">
							<li>★ 0.0 | 조회수&nbsp;${order.readCount}회</li>
						</div>
					</div>
				</div>
				</c:forEach>
			</ul>
			  <ul class="under justify-content-center">
			  	<c:if test="${pageMaker.prev}">
			  		<li><a href="${cpath}/order2/orderList?currentPage=${pageMaker.startPage - 1}" class="custom-btnn btn-11">이전</a></li>
			  	</c:if>
			  	<ul class="underPage">  	
			  	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			  		<c:if test="${pageMaker.cri.currentPage == pageNum}">
			  			<li class="bold active"><a href="${cpath}/order2/orderList?currentPage=${pageNum}">${pageNum}</a></li>
			  		</c:if>
			  		<c:if test="${pageMaker.cri.currentPage != pageNum}">
			  			<li><a href="${cpath}/order2/orderList?currentPage=${pageNum}">${pageNum}</a></li>
			  		</c:if>
			  	</c:forEach>
				</ul>
			    <c:if test="${pageMaker.next}">
			  		<li><a href="${cpath}/order2/orderList?currentPage=${pageMaker.endPage + 1}" class="custom-btnn btn-11">다음</a></li>
			  	</c:if>
			  </ul>
	</div>
</div>
	<script>
	
	var kind;
	var currentPage = 1;
	var startValue;

	
	
	function typeClick(el){
		currentPage = 1;
		$('.btn-1').removeClass('active');
		
		el.addClass('active');
		if(el.hasClass('cycle')){
			kind = "자전거";
		}else if(el.hasClass('bike')){
			kind = "오토바이";
		}else if(el.hasClass('Airconditioner')){
			kind = "에어컨";
		}else if(el.hasClass('boiler')){
			kind = "보일러";
		}else if(el.hasClass('computer')){
			kind = "컴퓨터";
		}else if(el.hasClass('sound')){
			kind = "음향/악기";
		}else if(el.hasClass('recent')){
			kind = "최신순";
		}else if(el.hasClass('popular')){
			kind = "인기순";
		}
		
    	$.ajax({
			 url : '${cpath}/order2/categoryAjax', // 이 주소로 
            type : "post", // 포스트 방식으로 보내는데
            data : {"kind" : kind}, // kind를 kind로 명명하여 보내겠다
            success : orderView,
            error : function(data){
          	 alert('error');
            },//error
		})//ajax
	}

	

    
   
    
    function goAjax(data){
    	
 		
    	currentPage = data;
    	
    	
    	
    	$.ajax({
			 url : '${cpath}/order2/categoryAjax', // 이 주소로 
             type : "post", // 포스트 방식으로 보내는데
             data : {"kind" : kind}, // kind를 kind로 명명하여 보내겠다
             success : orderView,
             error : function(data){
           	 alert('error');
             },//error
		})//ajax
    }
    
  
    
    // 카테고리버튼 html
    function orderView(res){
    	startValue = (currentPage * 12) - 12; 
    	var endValue = startValue + 11;
    	var count = res.length;

    	var disPageNum = 10;
    	var endPage = Math.ceil(currentPage/10) * 10;
    	var StartPage = (endPage - disPageNum) + 1;
    	var realEndPage = Math.ceil(count / 12);
    	
    	if(realEndPage < endPage){
    		endPage = realEndPage;
    	}
    	
    	if(count < endValue){
    		endValue = count-1;
    	}

  
    	var prev = StartPage == 1 ? false : true; 
    	var next = realEndPage > endPage ? true : false;
    	
    	var view = '';
    	var paging = '';
    	var viewImg = '';
    	
    	console.log("startValue" + startValue);
    	console.log("endValue" + endValue);
    	
    	
    	console.log("count" + count);
    	
    	
    	console.log("disPageNum" + disPageNum);
    	console.log("StartPage" + StartPage);
    	console.log("endPage" + endPage);
    	console.log("realEndPage" + realEndPage);
    	console.log("prev" + prev);
    	console.log("next" + next);

    	
    	console.log("--------------------------------------------------------");

		console.log(viewImg);
		

		
				// 페이지 번호
		      	for (var i = startValue; i <= endValue; i++) {
					var imgArr = [];
					var imgArr2 = [];
		      		
		      		
		      		imgArr.push(res[i].img);
		      		
		

		      		
		      		console.log(res[i]);	      		
	
		      		
		      		view += '<div class="orderList">';
		      		view += '<div class="askListA" onclick="location.href=\'${cpath}/order2/productDetail?id=' + encodeURIComponent(res[i].id) + '\'">';
		      		view +='<img src="${cpath}/resources/images/order/'+ imgArr +'">';
		      		view += '</div>';
		      		view += '<div class="askListP">';
		      		view += '<li>' + res[i].shopName + '</li>';
		      		var intro = res[i].intro;
		      		if (intro.length > 40) {
		      		  intro = intro.substring(0, 40) + '...';
		      		}
		      		view += '<li>' + res[i].intro + '</li>';
		      		view += '<div class="price">';
		      		view += '<li>' + res[i].office + '</li>';
		      		view += '</div>';
		      		view += '<div class="star">';
		      		view += '<li>★ 0.0 | 조회수 ' + res[i].readCount + '회</li>';
		      		view += '</div>';
		      		view += '</div>';
		      		view += '</div>';
		      	};
		      	
		      	var prevItem = '';
		      	var nextItem = '';
		      	var pageMaker = '';
		      	var prevNumber = StartPage - 1;
		      	var nextNumber = endPage + 1;
		      	
		      	if(prev){
		      		prevItem = '<li class="page-item"><button type="button" class="page-link " href="${cpath}/order2/orderAjax?pageNum='+prevNumber+'">Previous</button></li>';
		      	}
		      	
		      	if(next){
		      		nextItem = '<li class="page-item"><button type="button" class="page-link btnClick" href="${cpath}/order2/orderAjax?pageNum='+ nextNumber +'">Next</button></li>';
		      	}
		      	
		      	
		      	for(var i=StartPage; i<=endPage ;i++){
		      		if(currentPage == i){
		      			pageMaker+='<li class="bold active"><a class="btnClick" href="${cpath}/order2/orderAjax?pageNum='+ i +'">'+ i +'</button></li>';
		      		}else{
		      			pageMaker+='<li><a class="btnClick" href="${cpath}/order2/orderAjax?pageNum='+ i +'">'+ i +'</button></li>';
		      		}
		      	}
		      	

				
		      	paging+='<ul class="underPage">';
		      	paging+=prevItem;
		      	paging+=pageMaker;
		      	paging+=nextItem;
		      	paging+='</ul>';
		      	
    		
    	$('.askList').html(view);
    	$('.under').html(paging);
    }
    
    $(window).on('click', function(e){
        if($(e.target).hasClass('btnClick')){
            e.preventDefault(); // 기본 이벤트를 막기 위해 필요합니다.
            
            var href = $(e.target).attr('href');
            var btn = $(e.target).data('btn');

            console.log(href);

            $.ajax({
                url:href,
                type:"get",
                success:goAjax,
                error:function(){ alert('error')},
            });
        }
    });
    
	
    	
	
	function addressCall(){
		alert('정비사 등록을 해야 프로필 등록이 가능합니다.');
		location.href="${cpath}/order2/orderJoin";
	}
	function loginCall() {
		alert('로그인을 하셔야 등록 할 수 있습니다.')
		location.href="${cpath}/member/login";
	}
	</script>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>