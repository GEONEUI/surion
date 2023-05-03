<%--
  Created by IntelliJ IDEA.
  User: deukkwonpark
  Date: 2023/05/01
  Time: 6:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>리뷰 모음</title>
</head>
<body>

<c:forEach var="review" items="${reviews}">
  <div class="review">
    <p>${review.content}</p>
    <div class="rating" data-rating="${review.point}">
      <span class="stars">
        <span class="star">&#9734;</span>
        <span class="star">&#9734;</span>
        <span class="star">&#9734;</span>
        <span class="star">&#9734;</span>
        <span class="star">&#9734;</span>
      </span>
      <span class="average">${review.point}</span>
    </div>
  </div>
  <script>
    const rating = document.querySelector(".rating[data-rating='${review.point}']");
    setRating(rating, ${review.point});
  </script>
</c:forEach>


</body>
</html>
