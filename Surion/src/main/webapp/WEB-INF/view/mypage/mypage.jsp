<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html lang="ko">
<%@ include file="../common/front_header.jsp" %>
<style>
	body{
		background: #fff !important;
	}

	#my_page_right{
		padding: 35px 30px;
	}


	#navLink a:nth-child(${pageview}){
		color: red !important;
	}
</style>
<body>
<%@ include file="../common/header.jsp" %>
<div class="suriSize">
    <div class="container">
        <div class="row justify-content-between" style="min-height: 500px;">
            <%@ include file="../common/sidebar.jsp" %>
			<div class="col-lg-9" id="my_page_right">
			<c:if test="${pageview == 1}">
				<jsp:include page="./myinfo.jsp"/>
			</c:if>
			 <c:if test="${pageview == 2}">
				<jsp:include page="./myBoard.jsp"/>
			</c:if>
			 <c:if test="${pageview == 3}">
				<jsp:include page="./chatList.jsp"/>
			</c:if>
			<c:if test="${pageview == 4}">
				<jsp:include page="./requsetView.jsp"/>
			</c:if>
			</div>
        </div> <!-- //row -->
    </div> <!-- //container -->
</div><!-- //suriSize -->





</body>

<%@ include file="../common/footer.jsp" %>



</body>
</html>