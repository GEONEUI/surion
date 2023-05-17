<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<style>
    .usec_header {
        background: #fff !important;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 99;
        box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 3px, rgba(0, 0, 0, 0.24) 0px 1px 2px;
    }

    .uinner {
        width: 1200px;
        margin: 0 auto;
        padding: 0 16px;
    }

    .uheader_top {
        display: flex;
        align-items: center;
        justify-content: space-between;
        height: 8vh;
        position: relative;
    }

    .unav1,
    .unav2 {
        display: flex;
        align-items: center;
        margin-bottom: 0;
        padding: 0;
    }

    .unav1 li {
        margin-right: 20px;
    }

    .unav1 li img {
        cursor: pointer;
        width: 50px;
        height: 50px;
        border-radius: 50%;
    }

    .unav1 li:nth-child(2) {
        margin-right: 10px;
    }

    .unav1 li:last-child {
        margin-right: 0;
    }

    .unav1 li a {
        display: block;
        padding: 10px 24px;
        font-size: 15px;
    }

    .unav1 li:last-child a {
        background: #00c7ae;
        border-radius: 4px;
        color: #fff;
    }

    .uheader_bottom {
        height: 5vh;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .uheader_bottom .unav2 {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .uheader_bottom .unav2 li {
        margin-right: 45px;
    }

    .uheader_bottom .unav2 li a {
        display: block;
    }

    .uheader_bottom p {
        font-size: 14px;
        margin-bottom: 0;
    }


    .ubold {
        font-weight: bold;
    }



    /* search */
    .search {}

    .search form {
        display: flex;
        justify-content: center;
    }

    .search form input {
        border-radius: 20px 0 0 20px;
        width: 220px;
        height: 40px;
        border: 1px solid #ccc;
        border-right: 0;
        outline: none;
        font-size: 14px;
        padding-left: 15px;
        color: #666;
    }

    .search form button {
        width: 60px;
        height: 40px;
        border-radius: 0 20px 20px 0;
        border-left: none;
        background: #fff;
        border: 1px solid #ccc;
        border-left: 0;
        outline: none;
    }

    .search i {
        font-size: 15px;
        color: #444;
    }


    .myinfo {
        width: 240px;
        background: #fff;
        box-shadow: rgba(0, 0, 0, 0.25) 0px 0.0625em 0.0625em, rgba(0, 0, 0, 0.25) 0px 0.125em 0.5em, rgba(255, 255, 255, 0.1) 0px 0px 0px 1px inset;
        position: absolute;
        top: 70px;
        right: -30px;
        z-index: 999;
    }



    .mybox {
        padding: 20px 30px;
    }

    .mybox p {
        font-size: 17px;
        margin-bottom: 30px;

    }

    .mybox ul {}

    .mybox ul li {
        margin-bottom: 20px;
    }


    .mybox ul li:last-child {
        margin-bottom: 0;
    }

    .mybox ul li a {
        font-size: 16px;
        color: #5c5c5c;
    }

    .myinfo {
        display: none;
    }

    .myinfo .logout {
        display: block;
        text-align: center;
        padding: 12px 0;
        background: #efefef;
        color: #525252;

    }

    .myinfo.active {
        display: block;
    }
</style>

<div class="usec_header">
    <div class="uheader">
        <div class="uinner">
            <div class="uheader_top">
                <h1><a href="${cpath}/"><img src="${cpath}/resources/images/logo.png" alt="로고"></a></h1>
                <c:if test="${empty member}">
                    <ul class="unav1">
                        <li><a href="javascript:gologin2()">엔지니어 등록</a></li>
                        <li><a href="javascript:gologin()">로그인</a></li>
                        <li><a href="javascript:gojoin()">무료 회원가입</a></li>
                    </ul>
                </c:if>
                <c:if test="${!empty member}">
                    <ul class="unav1">
                        <c:if test="${member.office eq ''}">
                            <li><a href="javascript:gomechanic()" style="background: #00c7ae; border-radius: 4px; color: #fff;">엔지니어 등록</a></li>
                        </c:if>
                        <c:if test="${member.office ne ''}">
                            <c:choose>
                                <c:when test="${result == 1}">
                                    <li><a href="javascript:alert('이미 업체 등록을 하셨습니다.')" style="background: #00c7ae; border-radius: 4px; color: #fff;">업체 등록</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${cpath}/order2/orderForm" style="background: #00c7ae; border-radius: 4px; color: #fff;">업체 등록</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${member.imgurl eq null}">
                            <li onclick="goProfile();"><img src="${cpath}/resources/images/default.png"></li>
                        </c:if>
                        <c:if test="${member.imgurl ne null}">
                            <li onclick="goProfile();"><img src="${cpath}/resources/images/${member.imgurl}"></li>
                        </c:if>
                    </ul>
                    <!--  내 정보 모탈창  -->
                    <div class="myinfo">
                        <div class="mybox">
                            <p>${member.id} &nbsp 고객님</p>
                            <ul>
                                <li><a href="${cpath}/mypage/myinfo?pageview=4"><i class="fa-solid fa-money-bill-wave" style="color: #525252; margin-right:10px;"></i>받은 견적</a></li>
                                <li><a href="${cpath}/mypage/myinfo"><i class="fa-solid fa-circle-user" style="color: #525252; margin-right:10px;"></i> 마이페이지</a></li>
                            </ul>
                        </div>
                        <a class="logout" href="${cpath}/member/logout">로그아웃</a>
                    </div>
                </c:if>
            </div>
            <div class="uheader_bottom">
                <ul class="unav2">
                    <li><a href="#" class="ubold">전체카테고리</a></li>
                    <li><a href="${cpath}/repair/repairList">의뢰목록</a></li>
                    <li><a href="${cpath}/order2/orderList">엔지니어</a></li>
                    <li><a href="${cpath}/community/board">커뮤니티</a></li>
                    <li id="reviewBtn"><a href="javascript:void()">리뷰테스트</a></li>
                </ul>
                <p>원하는 서비스를 못 찾겠다면, <span class="ubold">프로젝트 의뢰</span>하세요! ></p>
            </div>
        </div>
    </div>

</div>

<style>
    .sec_review {
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.5);
        position: fixed;
        top: 0;
        left: 0;
        z-index: 999;
        display: none;
        align-items: center;
        justify-content: center;

    }


    .sec_review.active {
        display: flex;
    }

    .review {
        padding: 20px 30px 20px 30px;
        background: #fff;
        border-radius: 12px;
    }

    .review p {
        text-align: center;
        margin-bottom: 5px !important;
        font-size: 22px;
        font-weight: bold;
    }

    .review h2 {
        text-align: center;
        padding: 15px 0;
        font-size: 22px;
    }

    .review_close {
        display: flex;
        justify-content: flex-end;

    }

    .review_close a {
        font-size: 23px;
        font-weight: bold;
    }

    .star-rating {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 15px 0 17px 0;
    }

    .star-rating .star {
        font-size: 30px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .preview-item img{
    	width:50px;
    }
    
</style>
<div class="sec_review">
    <div class="review">
        <div class="review_close">
            <a href="javascript:review_close();">X</a>
        </div>
        <p>자전거고수
        <p>
        <h2>이 업체를 추천하시겠어요?</h2>
        <form method="post" enctype="multipart/form-data" action="/review/upload">
            <input type="file" name="files" id="upload-input" accept=".jpg,.png,.jpeg" onchange="checkFile(this)" multiple> <br>
            <div id="preview-container"></div>
            <div class="star-rating">
                <span class="star" data-value="1">&#9734;</span> <span class="star" data-value="2">&#9734;</span> <span class="star" data-value="3">&#9734;</span>
                <span class="star" data-value="4">&#9734;</span> <span class="star" data-value="5">&#9734;</span>
            </div>
            <textarea id="review-text" name="content" rows="4" cols="50" placeholder="리뷰내용을 입력해주세요"></textarea>
            <input type="hidden" name="score" id="score"> <input type="hidden" name="memberId" value="${member.id}"> <input type="hidden" name="mechanicId" value="${mechanic.id}"> <input type="hidden" name="orderId" value="${orderForm.id}"> <br>
            <input type="submit" value="작성완료" class="btn btn-primary btn-sm">
        </form>
    </div>
</div>


<script>
    //이미지 업로드
    $(function () {
        // 업로드할 파일 객체 배열
        var filesArray = [];

        // file input 변경 시, 미리보기 이미지 업데이트
        $('#upload-input').on('change', function () {
            var files = $(this)[0].files;
            $('#preview-container').empty(); // 기존 미리보기 이미지 제거
            filesArray = []; // 기존 파일 객체 배열 초기화
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                filesArray.push(file); // 파일 객체 배열에 추가
                var reader = new FileReader();
                reader.onload = function (e) {
                    var img = $('<img>').attr('src', e.target.result).addClass('preview-image');
                    var removeBtn = $('<button>').text('Remove').addClass('preview-remove');
                    var preview = $('<div>').addClass('preview-item').append(img).append(removeBtn);
                    $('#preview-container').append(preview);
                }
                reader.readAsDataURL(file);
            }
        });

        // remove 버튼 클릭 시, 미리보기 이미지와 파일 제거
        $('#preview-container').on('click', '.preview-remove', function () {
            var previewItem = $(this).closest('.preview-item');
            var index = $('#preview-container .preview-item').index(previewItem); // 미리보기 이미지의 인덱스
            filesArray.splice(index, 1); // 파일 객체 배열에서 해당 파일 객체 제거
            previewItem.remove(); // 미리보기 이미지 제거
        });
    });


    //리뷰작성 - 별표 클릭 이벤트
    const stars = document.querySelectorAll('.star-rating .star');
    const reviewText = document.getElementById('review-text');
    const ratingInput = document.getElementById('score');

    function setRating(value) {
        for (let i = 0; i < stars.length; i++) {
            if (i < value) {
                stars[i].innerHTML = '&#9733;'; // 클릭한 별 이하의 별만 채움
            } else {
                stars[i].innerHTML = '&#9734;'; // 클릭한 별 이상의 별은 빈 별로 남김
            }
        }
        ratingInput.value = value; // 리뷰 점수 전송을 위해 hidden input의 값을 변경
    }

    // 별표 값 점수로 변환
    stars.forEach((star) => {
        star.addEventListener('click', () => {
            const value = parseInt(star.getAttribute('data-value'));
            setRating(value);
            console.log(value)
        });
    });

    // 이미지 업로드
    function checkFile(input) {
        const files = input.files;
        const maxSize = 5 * 1024 * 1024; // 파일크기 5MB-> 추후 조정가능

        // 2개 이상 파일일 때 유효성 검사
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const ext = file.name.split('.').pop().toLowerCase();

            // 확장자 유효성 검사
            if (ext !== 'jpg' && ext !== 'png' && ext !== 'jpeg') {
                alert('jpg, jpeg, png 파일만 업로드할 수 있습니다.');
                input.value = null;
                return;
            }
            // 파일사이즈 유효성 검사
            if (file.size > maxSize) {
                alert('파일 크기는 5MB 이하여야 합니다.');
                input.value = null;
                return;
            }
        }
    }


    $('#reviewBtn').on('click', function() {
        $('.sec_review').addClass('active');
    });
</script>


<script>
    function review_close() {
        $('.sec_review').removeClass('active');
    }

    function goProfile() {
        $('.myinfo').toggleClass('active');
    }

    function gologin() {
        location.href = '${cpath}/member/login';
    }

    function gojoin() {
        location.href = '${cpath}/member/join';
    }

    function gomechanic() {
        location.href = '${cpath}/order2/orderJoin';
    }

    function goBoard() {
        location.href = '${cpath}/order2/orderForm';
    }

    function gologin2() {
        alert("로그인 후 이용해 주세요.")
        location.href = '${cpath}/member/login';
    }
</script>