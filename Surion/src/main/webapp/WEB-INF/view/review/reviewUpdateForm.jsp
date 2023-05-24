<%--
  Created by IntelliJ IDEA.
  User: deukkwonpark
  Date: 2023/05/08
  Time: 12:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.6.4.js"
          integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
  <style>
    .preview-image{
      width: 200px;
      height:200px;
    }
    .star {
      font-size: 20px;
    }
  </style>
  <meta charset="UTF-8">
  <title>개별 리뷰 업데이트</title>
</head>
<body>
<h1>리뷰 업데이트</h1>

<form id="frm" method="post" enctype="multipart/form-data" action="/review/update/${review.id}">
  <input type="file" name="files" id="upload-input" accept=".jpg,.png,.jpeg" onchange="checkFile(this)" multiple> <br>
  <div id="preview-container">
    <!-- 기존 이미지 리스트 -->
    <c:forEach var="photo" items="${photoList}" varStatus="status">
      <div class="preview-item" data-index="${status.index}">
        <img class="preview-image" src="${pageContext.request.contextPath}/${photo.filePath}" alt="image">
        <button type="button" class="preview-remove-btn">X</button>
      </div>
    </c:forEach>
  </div>
  <div class="star-rating">
    <span class="star" data-value="1">&#9734;</span>
    <span class="star" data-value="2">&#9734;</span>
    <span class="star" data-value="3">&#9734;</span>
    <span class="star" data-value="4">&#9734;</span>
    <span class="star" data-value="5">&#9734;</span>
  </div>
  <textarea id="review-text" name="content" rows="4" cols="50" placeholder="리뷰내용을 입력해주세요">${review.content}</textarea>
  <input type="hidden" name="score" id="score">
  <input type="hidden" name="memberId" value="${member.id}">
  <input type="hidden" name="mechanicId" value="${mechanic.id}">
  <input id="submit-btn" type="submit" value="작성완료" class="btn btn-primary btn-sm">
</form>

<script>
  $(function () {
    // 이미지 삭제 기능
    $('#preview-container').on('click', '.preview-remove-btn', function () {
      $(this).closest('.preview-item').remove();
    });

    // 파일 선택 시, 미리보기 이미지 업데이트
    $('#upload-input').on('change', function () {
      var files = $(this)[0].files;
      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        var reader = new FileReader();
        reader.onload = function (e) {
          var img = $('<img>').attr('src', e.target.result).addClass('preview-image');
          var removeBtn = $('<button>').text('X').addClass('preview-remove-btn');
          var preview = $('<div>').addClass('preview-item').append(img).append(removeBtn);
          $('#preview-container').append(preview);
        }
        reader.readAsDataURL(file);
      }
    });

    // submit 버튼 클릭 시, 변경된 photoList 값을 hidden input에 설정하고 폼 submit
    $('#submit-btn').on('click', function (e) {
      e.preventDefault();

      var photoList = [];
      $('.preview-item').each(function (index) {
        var filePath = $(this).find('.preview-image').attr('src');
        var photo = {
          filePath: filePath
        };
        photoList.push(photo);
      });

      $('#photoList-input').val(JSON.stringify(photoList));
      $('#frm').submit();
    });
  });




  <%--$(function (){--%>
  <%--  $('.preview-item').on('click', function () {--%>

  <%--    var files = ${photoList}--%>
  <%--    goDelete(oper);--%>
  <%--    $(this).css('display','none');--%>
  <%--  });--%>
  <%--})--%>

  <%--function goDelete(oper){--%>
  <%--  alert(oper)--%>
  <%--}--%>

  // $(function () {
  //   // 이미지 삭제 기능 추가
  //   $('#preview-container').on('click', '.preview-remove-btn', function () {
  //     const fileId = $(this).data('id'); // 삭제할 이미지의 ID
  //     $(this).closest('.preview-item').remove();
  //     // 이미지 삭제를 위해 서버로 fileId 전송 (Ajax를 사용하여 비동기 요청 가능)
  //     $.post('/photo/delete/' + fileId)
  //             .done(function (response) {
  //               console.log('이미지 삭제 성공');
  //             })
  //             .fail(function (xhr, status, error) {
  //               console.error('이미지 삭제 실패:', error);
  //             });
  //   });
  // });


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

  // 기존 리뷰 점수로 초기화
  setRating(${review.score});

  // 별표 값 점수로 변환
  stars.forEach((star) => {
    star.addEventListener('click', () => {
      const value = parseInt(star.getAttribute('data-value'));
      setRating(value);
    });
  });

  // 이미지 업로드
  function checkFile(input) {
    const files = input.files;
    const maxSize = 5 * 1024 * 1024; // 파일 크기 5MB-> 추후 조정 가능

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
      // 파일 사이즈 유효성 검사
      if (file.size > maxSize) {
        alert('파일 크기는 5MB 이하여야 합니다.');
        input.value = null;
        return;
      }
    }
  }
</script>
</body>
</html>