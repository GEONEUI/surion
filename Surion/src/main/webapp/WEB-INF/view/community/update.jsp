<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html lang="ko">
<%@ include file="../common/front_header.jsp"%>
<style>
    body {
        background: #fff !important;
    }

    #my_page_right {
        padding: 35px 30px;
    }

    #navLink a:nth-child($ {
            pageview
        }

    ) {
        color: red !important;
    }

    .subject {
        display: flex;
        padding: 27px 0;
        justify-content: space-between;
    }

    .option_subject {
        height: 3.5rem;
        padding: 1rem 0;
        background-color: #fff;
    }

    .pick_picture {
        height: 3.5rem;
        background-color: lightgray;
    }

    .insert_title {
        width: 100%;
        padding: 1.25rem 5px;
        margin-top: 15px;
    }

    .option {
        display: flex;
        height: 62.97px;
        margin-top: 15px;
    }

    .option_service,
    .option_loc {}

    .text {
        padding: 0 5px;
        color: gray;
        width: 100%;
        margin-top: 15px;
    }

    .form-control {
        text-align: center;
    }

    .form-control option {
        text-align: center;
    }

    .pick_picture {
        align-items: center;
        display: flex;
        padding-top: 5px;
    }

    .pick_picture i {
        align-items: center;
        margin-left: 10px;
        font-size: 20px;
    }

    .height {
        height: 100%;
        width: 150px;
        margin-right: 15px;
        cursor: pointer;
        background: #198754;
        color: #fff;
    }

    .pick_picture input {
        width: 100%;
        cursor: pointer;
        display: flex;
        align-items: center;
    }
    
	label i{
		margin-right:15px;
	}


    .bg {
        background: #00c7ae;
    }
    
    .fileName{
    	margin-right:10px;
    }
</style>a
<script>
    //선택한 것 보여주기
    function change() {

        var values = document.getElementById('test').value;
        document.getElementById('show').value = values;
    }
</script>

<body>
	${comm }
    <%@ include file="../common/header.jsp"%>
    <div class="suriSize">
        <div class="container">
            <div class="row justify-content-between" style="min-height: 500px;">
                <div class="col-lg-12" id="my_page_right">
                    <!-- 커뮤니티 글 등록 -->
                    <form action="${cpath}/community/update" method="post" enctype="multipart/form-data">
                        <!-- 주제선택 -->
                        <div class="d-flex justify-content-between mb-3">
                            <div class="pull-right">
                                <select class="form-control height bg" name="comm_list">
                                    <option value="0">(재선택) 주제</option>
                                    <option value="궁금해요">궁금해요</option>
                                    <option value="얼마예요">얼마예요</option>
                                    <option value="고수찾아요">고수찾아요</option>
                                    <option value="함께해요">함께해요</option>
                                </select>
                            </div>
                            <input type="submit" value="수정완료" class="btn btn-primary">
                        </div>
                        <div class="pick_picture">
                            <label for="file"><i class="fa-solid fa-camera"></i></label> <span class="fileName">${comm.img}</span>
                            <input id="file" type="file" name="img">
                        </div>
                        <input type="text" class="insert_title" placeholder="제목을 입력해주세요." name="title" value="${comm.title}"/>
                        <div class="option">
                            <div class="option_service">
                                <!-- (선택) 서비스 <i class="fa-regular fa-chevron-down"></i> -->
                                <select class="form-control height bg" name="suri_list">
                                    <option value="미정">(재선택) 서비스</option>
                                    <option value="자전거">자전거</option>
                                    <option value="오토바이">오토바이</option>
                                    <option value="에어컨">에어컨</option>
                                    <option value="보일러">보일러</option>
                                    <option value="컴퓨터">컴퓨터</option>
                                    <option value="이어폰/기타 등 음향">이어폰/기타 등 음향</option>
                                    <option value="기타">기타</option>
                                </select>
                            </div>
                        </div>
                        <input type="hidden" value="${member.id}" name="id">
                        <input type="hidden" value="${comm.idx}" name="idx">
                        <textarea id="myTextarea" maxlength="500" class="text" rows="15" placeholder="내용은 500자 까지 입력하실 수 있습니다." name="content">${comm.content}</textarea>
                    </form>
                </div>
                <!-- //row -->
            </div>
            <!-- //container -->
        </div>
        <!-- //suriSize -->
    </div>

    <script>
        const textarea = document.getElementById('myTextarea');


        textarea.addEventListener('input', function() {
            const textLength = textarea.value.length;

            if (textLength > 500) {
                textarea.value = textarea.value.slice(0, 100); // 글자수가 제한을 초과하면 초과 부분은 잘라냄
            }
        });
    </script>

<%@ include file="../common/footer.jsp"%>

</body>

</html>