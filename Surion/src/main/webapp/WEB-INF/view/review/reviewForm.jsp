<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">

<html>
<head>

    <meta charset="UTF-8">
    <title>Image Upload</title>
    <script src="https://code.jquery.com/jquery-3.6.4.js"
            integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <style>
        .preview-image {
            max-width: 150px;
            height: auto;
        }
    </style>
</head>
<body>
<h1>이미지 및 리뷰 업로드</h1>

<form method="post" enctype="multipart/form-data" action="/review/upload" >
<%--      onsubmit="submitReview(); return false;">--%>
    <input type="file" name="files" id="upload-input" accept=".jpg,.png" onchange="checkFile(this)" multiple>
    <br>
    <div id="preview-container"></div>
    <br>
    <div class="star-rating">
        <span class="star" data-value="1">&#9734;</span>
        <span class="star" data-value="2">&#9734;</span>
        <span class="star" data-value="3">&#9734;</span>
        <span class="star" data-value="4">&#9734;</span>
        <span class="star" data-value="5">&#9734;</span>
    </div>
    <br>
    <textarea id="review-text" name="content" rows="4" cols="50" placeholder="리뷰내용을 입력해주세요"></textarea>
    <input type="hidden" name="score" id="score">
    <input type="hidden" name="memberId" value="{member.id}">
    <input type="hidden" name="mechanicId" value="{mechanic.id}">
    <input type="hidden" name="orderId" value="{orderForm.id}">
    <br>
    <input type="submit" value="제출">
</form>



<script>

    <%--이미지 업로드 --%>
    $(function () {
        // file input 변경 시, 미리보기 이미지 업데이트
        $('#upload-input').on('change', function () {
            var files = $(this)[0].files;
            $('#preview-container').empty(); // 기존 미리보기 이미지 제거
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
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

        // remove 버튼 클릭 시, 미리보기 이미지와 remove 버튼 제거
        $('#preview-container').on('click', '.preview-remove', function () {
            $(this).closest('.preview-item').remove();
        });
    });


    <%--리뷰작성- 별표 클릭 이벤트--%>
    const stars = document.querySelectorAll('.star-rating .star');
    const reviewText = document.getElementById('review-text');
    const ratingInput = document.getElementById('score');

    function setRating(value) {
        for (let i = 0; i < stars.length; i++) {
            if (i < value) {
                stars[i].innerHTML = '&#9733;';  // 클릭한 별 이하의 별만 채움
            } else {
                stars[i].innerHTML = '&#9734;';  // 클릭한 별 이상의 별은 빈 별로 남김
            }
        }
        ratingInput.value = value;  // 리뷰 점수 전송을 위해 hidden input의 값을 변경
    }

    // 별표 값 점수로 변환
    stars.forEach((star) => {
        star.addEventListener('click', () => {
            const value = parseInt(star.getAttribute('data-value'));
            setRating(value);
            console.log(value)
        });
    });

    <%--이미지 업로드--%>
    function checkFile(input) {
        const files = input.files;
        const maxSize = 5 * 1024 * 1024; // 파일크기 5MB-> 추후 조정가능

        // 2개 이상 파일일 때 유효성 검사
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const ext = file.name.split('.').pop().toLowerCase();

            // 확장자 유효성 검사
            if (ext !== 'jpg' && ext !== 'png') {
                alert('jpg와 png 파일만 업로드할 수 있습니다.');
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




    <%--제출--%>
    function submitReview() {
        const score = $('#score').val();
        const content = $('#review-text').val();
        console.log(score, content)

        // 서버에 리뷰를 저장하는 Ajax 요청
        $.ajax({
            type: 'POST',
            url: '/review/api/review',
            data: {
                score: score
                ,
                content: content
            },
            success: function(response) {

                // 서버에서 응답이 왔을 때 실행되는 코드
                console.log('리뷰 저장 성공:', response);
                alert('리뷰가 저장되었습니다.');
                location.reload(); // 페이지 새로고침
            },
            error: function(xhr, status, error) {
                // 서버에서 에러 응답이 왔을 때 실행되는 코드
                console.error('리뷰 저장 실패:', status, error);
                alert('리뷰 저장에 실패하였습니다. 다시 시도해주세요.');
            }
        });
    }
</script>


</body>
</html>
