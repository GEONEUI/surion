<%--
  Created by IntelliJ IDEA.
  User: deukkwonpark
  Date: 2023/05/07
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Review 전체 조회</title>
</head>
<body>
<h1>Review 전체 조회</h1>
<table>
  <thead>
  <tr>
    <th>번호</th>
    <th>업체명</th>
    <th>작성자</th>
    <th>리뷰점수</th>
    <th>리뷰별점표시</th>
    <th>리뷰내용</th>
    <th>리뷰작성일</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="review" items="${reviewList}">
    <tr>
      <td>${review.id}</td>
      <td>${review.mechanicId}</td>
      <td>${review.memberId}</td>
      <td>${review.score}</td>
      <td>
      <span class="stars">
        <span class="star">&#9734;</span>
        <span class="star">&#9734;</span>
        <span class="star">&#9734;</span>
        <span class="star">&#9734;</span>
        <span class="star">&#9734;</span>
      </span>
      </td>
      <td>${review.content}</td>
      <td>${review.createdAt}</td>
      <td><a href="/review/detail/${review.id}">보기</a></td>
      <td><a href="/review/update/${review.id}">수정</a></td>
      <td><a href="/review/delete/${review.id}">삭제</a></td>
    </tr>
  </c:forEach>

  <script>
    // 페이지 로드시 자동으로 별 모양 채우기
    const rows = document.querySelectorAll('tbody tr');
    rows.forEach(row => {
      const score = row.querySelector('td:nth-child(4)').textContent;
      const stars = row.querySelector('.stars');
      fillStars(score, stars);
    });

    function fillStars(score, stars) {
      // score 변수에 저장된 점수를 기준으로 별 모양을 채웁니다.
      for (let i = 0; i < score; i++) {
        stars.children[i].innerHTML = '&#9733;'; // 채워진 별 모양
      }
    }
  </script>
  </tbody>
</table>
</body>
</html>

