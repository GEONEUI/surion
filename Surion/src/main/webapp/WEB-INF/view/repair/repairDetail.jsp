<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<%@ include file="../common/front_header.jsp" %>
<style>
	.content {
		width: 100%;
		display: flex;
		justify-content: space-between;
	    margin-bottom: 3rem;
	}
	
	.mainImg {
		width: 55%;
		height: 25rem;
	}
	
	.mainImg img {
		width: 100%;
		height: 100%;
		border-radius: 1rem;
	}
	
	.mainContent {
		width: 40%
	}
	
	.mainContent h3 {
		font-weight: 500;
	    margin: 0 0 8px;
	    color: #303441;
	    font-size: 20px;
	    word-break: keep-all;
	    line-height: 1.5;
	}
	
	.subTitle {
		display: flex;
		margin-bottom: 1rem;	
	    font-size: 14px;
	    color: rgb(85, 89, 105);
	    align-items: center;
	}
	
	.subTitle li:nth-child(1) {
		font-size: 1.2rem;
		color: #00c7ae;
		font-weight: bold;
		font-style: italic;
		margin-right: 6px;
	}
	
	.subTitle2 {
		font-size: 14px;
	    color: rgb(85, 89, 105);
		display: flex;
	    margin-bottom: 1rem;
	}
	
	.ContentDetail {
		border: 1px solid #ede8e8;
		font-size: 1.1rem;
 	    padding: 2rem;
	}
	
	.explain {
		height: 164px;
	}
	
	.ContentDetail li {
		height: 24px;
		color: #303441;
	}
	
	
	.nikname {
		display: flex;
		margin-bottom: 1rem;
	}
	
	.nikname li:nth-child(1) {
		font-weight: bold;
		margin-right: 1rem;	
	}
	
	.sBtn {
		width: 100%;
		height: 3rem;
		background: #00c7ae;	
		border-style: none;
		border-radius: 0.4rem;
		color: #fff;
	}
	
	.propose {
		padding-top: 22px;
		margin-top: 2.8rem;
		height: 5rem;
	    border: 1px solid #ede8e8;
		color: rgb(122, 122, 122);
	    line-height: 1.3;
	    font-size: 1.5rem;
	    font-weight: 400;
	    text-align: center;
	}
</style>
<body>
	<%@ include file="../common/header.jsp" %>

<div class="sec_content">
	<div class="suriSize st">
		<div class="content">
			<div class="mainImg">
				<img src="https://cdn.gameple.co.kr/news/photo/202104/158913_164540_441.jpg" alt=""> 
				<p class="propose">&#128680;의뢰자의 요청 내용을 확인 후 제안해 주세요.</p>
			</div>
			<div class="mainContent">
				<div>
					<h3>디아블로2 소서리스 키우는 법 알려주세요.</h3>
					<ul class="subTitle">
						<li>Surion<li>
						<li>이 제공하는 견적 요청 목록 &#128504;<li>
					</ul>
					<ul class="subTitle2">
						<li>에어컨 &nbsp > &nbsp</li>
						<li>가스충전 &nbsp > &nbsp</li>
						<li>방문수리</li>
					</ul>
					<div class="ContentDetail">
						<ul class="nikname">
							<li>의뢰자 :</li>
							<li>건의짱짱123</li>
						</ul>
						
						<p class="explain">안녕하세요 지금 소서리스 래더 90에서 레벨업이 막혔는데 도와주실 분 구합니다.
							최소한 짭밥 10년 이상 차만 지원해주시면 감사드리겠습니다.
						</p>
						<ul class="nikname">
							<li>작업 요청일 : </li>
							<li>2023-04-10</li>
						</ul>
						<ul class="nikname">
							<li>견적 : </li>
							<li>협의</li>
						</ul>
						<button class="sBtn">제안하기</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>


<script>

	
	
</script>

		<%@ include file="../common/footer.jsp" %>
</body>
</html>