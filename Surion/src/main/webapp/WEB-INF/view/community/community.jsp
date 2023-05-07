<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<%@ page import="java.util.*"%>
<!DOCTYPE html>

<html lang="ko">
<%@ include file="../common/front_header.jsp"%>
<style>
body {
	background: #fff !important;
}

.ylist{
	border:2px solid #ccc;
	border-radius:12px;
	padding:30px 25px;
}

#my_page_right {
	padding: 35px 30px;
}

#write_right{
	display:flex;
	justify-content:flex-end;
	margin-bottom:15px;
}

#frm{
	margin-bottom:30px;
}

.media-body h6{
	font-size:19px;
}
</style>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="suriSize">
		<div class="container">
			<div class="row justify-content-between" style="min-height: 500px;">
				<div class="col-lg-12" id="my_page_right">
					<c:if test="${!empty member}">
						<div id="write_right">
							<a href="${cpath}/community/write" role="button" class="btn btn-sm btn-primary">글쓰기</a>
						</div>
					</c:if>
					<c:if test="${empty member}">
						<div id="write_right">
							<span style="color:red;">글작성을 위해서는 로그인이 필요합니다.</span>
						</div>
					</c:if>
				<div class="card-body">
					<table class="table table-hover table-bordered">
						<tr>
							<td width="15%">카테고리</td>
							<td width="50%">제목</td>
							<td width="10%" align="middle">글쓴이</td>
							<td width="15%" align="middle">작성일</td>
							<td width="10%" align="middle">조회수</td>
						</tr>
						<c:forEach items="${lst}" var="list">
							<tr>
								<td width="15%">${list.comm_list}</td>
								<td width="50%"><a href="${cpath}/community/detail?idx=${list.idx}">${list.title}</a></td>
								<td width="10%" align="middle">${list.id}</td>
								<td width="15%" align="middle">${fn:split(list.indate, " ")[0]}</td>
								<td width="10%" align="middle">${list.readcount}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				
						
				</div>
				<!-- //row -->
			</div>
			<!-- //container -->
		</div>
		<!-- //suriSize -->
	</div>
	<c:if test="${!empty msg}">
		<script>
			alert('${msg}');
		</script>
	</c:if>
	
</body>

<%@ include file="../common/footer.jsp"%>



</body>
</html>


