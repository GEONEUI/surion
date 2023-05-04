<%--
  Created by IntelliJ IDEA.
  User: deukkwonpark
  Date: 2023/05/01
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
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
<h1>Image Upload</h1>

<form method="post" enctype="multipart/form-data" action="/upload">
    <input type="file" name="files" id="upload-input" multiple>
    <br>
    <div id="preview-container"></div>
    <br>
    <input type="submit" value="Upload">
</form>

<script>
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
</script>
</body>


<%--리뷰 작성란 (별표) --%>
<div class="star-rating">
    <span class="star" data-value="1">&#9734;</span>
    <span class="star" data-value="2">&#9734;</span>
    <span class="star" data-value="3">&#9734;</span>
    <span class="star" data-value="4">&#9734;</span>
    <span class="star" data-value="5">&#9734;</span>
</div>


<%--리뷰 작성란 (텍스트)--%>
<textarea id="review-text" rows="4" cols="50" placeholder="리뷰내용을 입력해주세요"></textarea>
<input type="hidden" name="point" id="point">
<button id="submit-button" onclick="submitReview()">리뷰 작성</button>


<script>
    <%--리뷰작성- 별표 클릭 이벤트    --%>
    const stars = document.querySelectorAll('.star-rating .star');
    const reviewText = document.getElementById('review-text');
    const ratingInput = document.getElementById('point');

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

    // 별포 값 점수로 변환
    stars.forEach((star) => {
        star.addEventListener('click', () => {
            const value = parseInt(star.getAttribute('data-value'));
            setRating(value);
        });
    });

    // 리뷰 submit에 따른 비동기식 전달
    function submitReview() {
        const point = ratingInput.value;
        const content = reviewText.value;
        // TODO: 리뷰 전송 로직 추가
        console.log(point, content)
        // 리뷰 전송이 완료되면 리뷰 작성창을 초기화하는 로직 추가

        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // 서버로부터의 응답을 처리하는 코드
                    console.log("ok")
                } else {
                    // 서버로부터의 응답이 실패한 경우 처리하는 코드
                    console.log(xhr.status)
                }
            }
        };
        xhr.open('POST', '/surion/reveiw/events');
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.send(JSON.stringify({point: point, content: content}));
    }


</script>
</body>
</html>
