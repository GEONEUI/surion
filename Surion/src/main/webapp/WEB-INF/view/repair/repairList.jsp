<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		margin: 8px 0px 16px
	}

	.price {
		display: flex;
		justify-content: flex-end;
		font-weight: bold;
		font-size: 1.1rem;
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

</style>
<body>
	<%@ include file="../common/header.jsp" %>

<div class="sec_content">
	<div class="suriSize st">
			<div class="headLine">
			<p>최신 의뢰 목록 리스트! &#128204;</p>
			<div class="askSearch">
				<i class="fa-solid fa-magnifying-glass"></i>
				<input type="search" class="ser" oninput="inputBtn()" placeholder="키워드를 검색해주세요."/>
			</div>
			<button class="hbutton" onclick="location.href='${cpath}/repair/repairForm'">견적 요청</button>
			</div>
	
			<ul class="askList">
			<c:forEach var="list" items="${list}">
				<div class="repairList">
					<div class="askListA" onclick="location.href='${cpath}/repair/repairDetail?idx=${list.idx}'">
						<img src="${cpath}/resources/images/${fn:split(list.image, 'h')[1]}" alt="공백" />
					</div>
					<div class="askListP">
						<li>${list.title}</li>
						<li>${list.content}</li>
						<div class="price">
							<p>&nbsp${list.estimate}원 ~</p>
						</div>
					</div>
				</div>
			</c:forEach>
			</ul>
			
	</div>
</div>
	







<script>





</script>

		<%@ include file="../common/footer.jsp" %>
</body>
</html>