<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<%@ include file="../common/front_header.jsp" %>
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
		margin: 8px 0px 16px;
	}

	.price {
		display: flex;
		font-weight: bold;
		font-size: 1.1rem;
		justify-content: space-between;
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
		display: flex;
		align-items: center;
	}

	.ser {
		width: 87%;
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
	<%@ include file="../common/header.jsp" %>
<div class="sec_content">
	<div class="suriSize st">
		<div class="headLine">
		<p>최신 의뢰 목록 리스트! &#128204;</p>
			<form action="repairListSearch" method="get" class="askSearch">
				<i class="fa-solid fa-magnifying-glass"></i>
					<input type="search" class="ser" placeholder="키워드를 검색해주세요." name="keyword" value="${paging.keyword}"/>
			</form>
			<c:choose>
				<c:when test="${!empty member.id && empty member.address}">
					<button class="hbutton" onclick="addressCall()">견적 요청</button>
				</c:when>
				<c:when test="${!empty member.id}">
					<button class="hbutton" onclick="location.href='${cpath}/repair/repairForm'">견적 요청</button>
				</c:when>
				<c:when test="${empty member.id}">
					<button class="hbutton" onclick="alert('로그인이 필요합니다.')">견적 요청</button>
				</c:when>
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
			<c:forEach var="list" items="${list}">
				<div class="repairList">
					<div class="askListA" onclick="location.href='${cpath}/repair/repairDetail?idx=${list.idx}'">
						<img src="${cpath}/resources/repairImages/${fn:split(list.image, 'h')[1]}" alt="공백" />
					</div>
					<div class="askListP">
						<li>${list.title}</li>
						<li>${list.content}</li>
						<div class="price">
							<c:if test="${list.estimate eq '협의'}">
								<p class="view"><fmt:formatNumber value="${list.readCount}" pattern="#,###"/>회</p>
								<p>견적&nbsp${list.estimate}</p>
							</c:if>
							<c:if test="${list.estimate ne '협의'}">
								<p class="view"><fmt:formatNumber value="${list.readCount}" pattern="#,###"/>회</p>
								<p><fmt:formatNumber value="${list.estimate}" pattern="#,###"/>원 ~</p>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</ul>
		<div class="under">
			<c:if test="${paging.prev}">
				<a href="${cpath}/repair/repairList?pageNum=${paging.startNum - 1}" class="custom-btnn btn-11">이전</a>
			</c:if>
			<ul class="underPage">
				<c:forEach begin="${paging.startNum}" end="${paging.endNum}" var="i">
					<c:if test="${paging.currentPage == i}">
						<li class="bold"><a href="${cpath}/repair/repairList?pageNum=${i}">${i}</a></li>
					</c:if>
					
					<c:if test="${paging.currentPage != i}">
						<li><a href="${cpath}/repair/repairList?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
			</ul>
			<c:if test="${paging.next}">
				<a href="${cpath}/repair/repairList?pageNum=${paging.endNum + 1}" class="custom-btnn btn-11">다음</a>
			</c:if>
		</div>
	</div>
</div>
	




<script>

	var type = '${type}';
	var kind;
	var currentPage = 1;
	var startValue;


	
	if(type == 1){
		$(".cycle").trigger('click');
	}else if(type == 2){
		$(".bike").trigger('click');
	}else if(type == 3){
		$('.Airconditioner').trigger('click');
	}else if(type == 4){
		$('.boiler').trigger('click');
	}else if(type == 5){
		$('.computer').trigger('click');
	}else if(type == 6){
		$('.sound').trigger('click')
	}
	
	
	function typeClick(el){
		currentPage = 1;
		$('.btn-1').removeClass('active');
		
		el.addClass('active');
		if(el.hasClass('cycle')){
			kind = 1;
		}else if(el.hasClass('bike')){
			kind = 2;
		}else if(el.hasClass('Airconditioner')){
			kind = 3;
		}else if(el.hasClass('boiler')){
			kind = 4;
		}else if(el.hasClass('computer')){
			kind = 5;
		}else if(el.hasClass('sound')){
			kind = 6;
		}else if(el.hasClass('recent')){
			kind = 7;
		}else if(el.hasClass('popular')){
			kind = 8;
		}
		
    	$.ajax({
			 url : '${cpath}/repair/categoryAjax', // 이 주소로 
            type : "post", // 포스트 방식으로 보내는데
            data : {"kind" : kind}, // kind를 kind로 명명하여 보내겠다
            success : repairView,
            error : function(data){
          	 alert('error');
            },//error
		})//ajax
	}

	
	
	function addressCall(){
		alert('주소를 입력해야 견적 요청이 가능합니다.');
		location.href="${cpath}/mypage/myinfo";
	}
	

    
   
    
    function goAjax(data){
    
    	
    	currentPage = data;
    	
    	
    	$.ajax({
			 url : '${cpath}/repair/categoryAjax', // 이 주소로 
             type : "post", // 포스트 방식으로 보내는데
             data : {"kind" : kind}, // kind를 kind로 명명하여 보내겠다
             success : repairView,
             error : function(data){
           	 alert('error');
             },//error
		})//ajax
    }
    
  
    
    // 카테고리버튼 html
    function repairView(res){
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

    	
  

		console.log(viewImg);
		

		
				// 페이지 번호
		      	for (var i = startValue; i <= endValue; i++) {
					var imgArr = [];
					var imgArr2 = [];
		      		
		      		
		      		imgArr.push(res[i].image);
		      		
		      		imgArr2 = imgArr.map((key)=>{
		      		    return key.split("h")[1];
		      		})

		      		
		      		console.log(res[i].image);	      		
	
		      		
	      			view+='<div class="repairList">';
	      			view+='<div class="askListA">';
	      			view+='<img src="${cpath}/resources/repairImages/'+ imgArr2 +'">';
	      			view+='</div>';
	      			view+='<div class="askListP">';
	      			view+='<li>'+res[i].title+'</li>';
	      			view+='<li>'+res[i].content+'</li>';
	      			view+='<div class="price">';
	      			view+='<p class="view">협의</p>';
	      			view+='<p></p>';
	      			view+='</div>';
	      			view+='</div>';
	      			view+='</div>';
		      	};
		      	
		      	var prevItem = '';
		      	var nextItem = '';
		      	var pageMaker = '';
		      	var prevNumber = StartPage - 1;
		      	var nextNumber = endPage + 1;
		      	
		      	if(prev){
		      		prevItem = '<li class="page-item"><button type="button" class="page-link btnClick" href="${cpath}/repair/repairAjax?pageNum='+prevNumber+'">Previous</button></li>';
		      	}
		      	
		      	if(next){
		      		nextItem = '<li class="page-item"><button type="button" class="page-link btnClick" href="${cpath}/repair/repairAjax?pageNum='+ nextNumber +'">Next</button></li>';
		      	}
		      	
		      	
		      	for(var i=StartPage; i<=endPage ;i++){
		      		if(currentPage == i){
		      			pageMaker+='<li class="page-item"><button type="button" class="active page-link btnClick" href="${cpath}/repair/repairAjax?pageNum='+ i +'">'+ i +'</button></li>';
		      		}else{
		      			pageMaker+='<li class="page-item"><button type="button" class="page-link btnClick" href="${cpath}/repair/repairAjax?pageNum='+ i +'">'+ i +'</button></li>';
		      		}
		      		
		      	}
		      	
		      	
		      	

		      	paging+='<ul class="pagination justify-content-center">';
		      	paging+=prevItem;
		      	paging+=pageMaker;
		      	paging+=nextItem;
		      	paging+='</ul>';
		      	
    		
    	$('.askList').html(view);
    	$('.under').html(paging);
    }
    
    $(window).on('click', function(e){
    	if($(e.target).hasClass('btnClick')){
    		var href = $(e.target).attr('href');
    		var btn = $(e.target).data('btn');

    		$.ajax({
    			url:href,
    			type:"get",
    			success:goAjax,
    			error:function(){ alert('error')},
    		})
    		
    		
    	}
    
    })
    
	
   
    
    
</script>

		<%@ include file="../common/footer.jsp" %>
</body>
</html>