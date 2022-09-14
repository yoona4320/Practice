<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{text-align:center;}
td{text-align:left;}
</style>
<meta charset="UTF-8">
<title>board detail</title>
</head>
<body>

<form action="replyform" method="post">
<table border="1" align="center">
<caption><h3>상세정보</h3></caption>
	<c:forEach items="${list}" var="b">
	<tr>
		<th>글번호</th>
		<td>
		<input type="hidden" name="num" value="${b.num }">${b.num }
		</td>
	</tr>
	<tr>
		<th>작성일자</th>
		<td>
		<fmt:parseDate var="dateString" value="${b.writeday}" pattern="yyyy-MM-dd hh:mm:ss"/>
        <fmt:formatDate value="${dateString}" pattern="yyyy년 MM월 dd일"/>
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${b.writer }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${b.title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${b.content }</td>
	</tr>
	</c:forEach>
	
</table>
<br>
<input type="submit" value="답변글">
<input type="button" value="목록" onclick="location.href='boardout'">
</form>

</body>
</html>