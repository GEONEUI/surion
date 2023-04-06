<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	.askList a{
		width: 22%;
		height: 20rem;
		margin-right: 4%;
		margin-top: 4%;
		color: #000;
	}

	.askList a:last-child {
		margin-right: auto;
	}

	.askList a:nth-child(4n) {
		margin-right: 0px;
	}
	
	.askListA {
		height: 12rem;
		background: #00c7ae;
		border-radius: 0.5rem;
	}

	.askListA img {
		width:100%;
		height: auto;
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
		font-size: 11px;
	}

	.askListP li:nth-child(2){
		margin: 8px 0px 16px
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

</style>
<body>
	<%@ include file="../common/header.jsp" %>

<div class="sec_content">
	<div class="suriSize st">
			<div class="headLine">
			<p>지금 가장 뜨거운 픽! &#128293;</p>
			<div class="askSearch">
				<i class="fa-solid fa-magnifying-glass"></i>
				<input type="search" class="ser" oninput="inputBtn()" placeholder="키워드를 검색해주세요."/>
			</div>
			<button class="hbutton" onclick="location.href='${cpath}/repair/order'">견적 요청</button>
			</div>
	
			<ul class="askList">
				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>
	

				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>

				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>

				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>

				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>

				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>

				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>

				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>

				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>

				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>

				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>

				<a href="#">
					<div class="askListA">
						<img src="https://d2v80xjmx68n4w.cloudfront.net/gigs/xfxYg1679467662.jpg" alt="" />
					</div>
					<div class="askListP">
						<li>이름</li>
						<li>청소기가 고장났어요청소기ㅂㅈㄷㄼㅈㄷㄼㅈㄷㄼㅈㄷㄼㄷㅈㄼㅈㄹㅈㄷㄹ고장났어요청소기가 고장났어요</li>
						<div class="price">
							<div class="price-emoji">&#128489;</div>
							<p>견적 협의</p>
						</div>
					</div>
				</a>
			</ul>

			
	</div>
</div>

<script>

	
	
	
</script>

		<%@ include file="../common/footer.jsp" %>
</body>
</html>