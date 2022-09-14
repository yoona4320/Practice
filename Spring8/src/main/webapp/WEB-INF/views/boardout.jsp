<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board out</title>
</head>
<body>

<table border="1" align="center">
<caption><h3>작성글 목록</h3></caption>
	<tr>
		<th style="text-align:center;">글번호</th>
		<th style="text-align:center;">작성자</th>
		<th style="text-align:center;">제목</th>
		<th style="text-align:center;">작성일자</th>
		<th style="text-align:center;">조회수</th>
		<th style="text-align:center;">비고</th>
	</tr>
	
	<c:forEach items="${list}" var="b">
	<tr>
		<td style="text-align:center;">${b.num}</td>
		<td style="text-align:center;">${b.writer}</td>
		<td>
		<c:forEach begin="1" end="${b.indent }">&emsp;</c:forEach>
		<c:if test="${b.indent > 0}">ㄴ</c:if>
		<a href="boarddetail?num=${b.num}">${b.title }</a>
		</td>
		<td style="text-align:center;">
		<fmt:parseDate var="dateString" value="${b.writeday}" pattern="yyyy-MM-dd hh:mm:ss"/>
        <fmt:formatDate value="${dateString}" pattern="yyyy년 MM월 dd일"/>
		</td>
		<td style="text-align:center;">${b.readcnt}</td>
		<td style="text-align:center;">
		<a href="boarddelete?num=${b.num}">삭제</a>
		</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>