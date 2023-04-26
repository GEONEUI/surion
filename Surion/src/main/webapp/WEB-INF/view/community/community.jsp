<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<%@ include file="../common/communiSidebar.jsp"%>
				<div class="col-lg-9" id="my_page_right">
					<div id="write_right">
						<a href="#" role="button" class="btn btn-sm btn-primary">글쓰기</a>
					</div>
					<!-- 검색 -->
					<form id="frm" method="post" name="search" action="searchbbs.jsp">
						<table class="pull-right">
							<tr>
								<td><input type="text" class="form-control"
									placeholder="키워드와 #태그 모두 검색할 수 있어요." name="searchText"></td>
								<!-- <td><button type="submit" class="btn btn-success">검색</button></td> -->
							</tr>

						</table>
					</form>
					<!-- //검색 -->


					<div class="ylist">
						<div class="contentpicture d-flex justify-content-between mb-3">
							<div class="media-body">
							<h6>유리교체 비용 궁금합니다.</h6>
								<table class="table table-striped">
									<p class="text-secondary">내용 내용 내용</p>
								</table>
							</div>
							<img src="${cpath}/resources/images/d.jpg" alt="썸네일" width="100" height="100">
						</div>
						<div class="d-flex justify-content-between">
							<div class="icon">
								<span class="d-none d-sm-inline-block me-3"> <i class="fa-light fa-thumbs-up"></i> 19</span>
								<span class="like"><i class="far fa-comment ml-2"></i> 3</span>
							</div>
							<span class="text-secondary font-weight-bold">13 minutes ago</span>
						</div>
					</div>
							
							
							
				</div>
				<!-- //row -->
			</div>
			<!-- //container -->
		</div>
		<!-- //suriSize -->
	</div>
</body>

<%@ include file="../common/footer.jsp"%>



</body>
</html>


