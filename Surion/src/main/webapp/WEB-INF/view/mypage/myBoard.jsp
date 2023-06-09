<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
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
	
	.custom-btn {
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
	
	#myBoard {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	}
</style>
<body>
<div id='myBoard'>
	<c:forEach var="list" items="${myBorList}">
				<div class="repairList mb-5">
					<div class="askListA" onclick="location.href='${cpath}/repair/repairDetail?idx=${list.idx}'">
						<img src="${cpath}/resources/repairImages/${fn:split(list.image, 'h')[1]}" alt="공백" />
					</div>
					<div class="askListP pb-5">
						<ul>
							<li>${list.title}</li>
							<li>${list.content}</li>
						</ul>
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
</div>
</body>
