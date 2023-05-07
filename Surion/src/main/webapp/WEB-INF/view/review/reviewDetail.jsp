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
    <meta charset="UTF-8">
    <title>개별 리뷰 조회</title>
</head>
<body>
<h1>개별 리뷰 조회</h1>
<table>
    <tr>
        <th>작성자</th>
        <td>${review.id}</td>
    </tr>
    <tr>
        <th>제목</th>
    </tr>
    <tr>
        <th>내용</th>
        <td>${review.content}</td>
        <td>${review.score}</td>
    </tr>
    <tr>
        <th>사진</th>
        <td>
            <c:forEach var="photo" items="${photoList}">
                <img src="${pageContext.request.contextPath}/${photo.filePath}" alt="image">
            </c:forEach>
        </td>
    </tr>
</table>
</body>
</html>

