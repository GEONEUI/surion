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
    <style>
        .image{
           width: 200px;
           height:200px;
        }
        .star {
            font-size: 20px;
        }
    </style>
    <meta charset="UTF-8">
    <title>개별 리뷰 조회</title>
</head>
<body>
<h1>개별 리뷰 조회</h1>
<table>
    <tr>
        <th>사진</th>
        <td colspan="2">
            <c:forEach var="photo" items="${photoList}">
                <img class="image" src="${pageContext.request.contextPath}/${photo.filePath}" alt="image">
            </c:forEach>
        </td>
    </tr>
    <tr>
        <th>작성자</th>
        <td>${review.id}</td>
    </tr>
    <tr>
        <th>평점</th>
        <td>
            <span class="stars">
              <span class="star">&#9734;</span>
              <span class="star">&#9734;</span>
              <span class="star">&#9734;</span>
              <span class="star">&#9734;</span>
              <span class="star">&#9734;</span>
            </span>
            ${review.score}
        </td>
    </tr>

</table>

<script>
    function fillStars(score) {
        // 별점을 표시할 span 태그를 선택합니다.
        const stars = document.querySelector('.stars');

        // score 변수에 저장된 점수를 기준으로 별 모양을 채웁니다.
        for (let i = 0; i < score; i++) {
            stars.children[i].innerHTML = '&#9733;'; // 채워진 별 모양
        }
    }

    // 페이지 로드시 자동으로 별 모양 채우기
    const score = ${review.score}; // JSP EL을 사용하여 변수를 가져옵니다.
    fillStars(score);
</script>
</body>
</html>

