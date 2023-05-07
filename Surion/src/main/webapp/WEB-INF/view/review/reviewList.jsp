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
    <th>작성자</th>
    <th>내용</th>
    <th>점수</th>
    <th>작성일</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="review" items="${reviewList}">
    <tr>
      <td>${review.id}</td>
      <td>${review.mechanicId}</td>
      <td>${review.memberId}</td>
      <td>${review.content}</td>
      <td>${review.score}</td>
      <td>${review.createdAt}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>

