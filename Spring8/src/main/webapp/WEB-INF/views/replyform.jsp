<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply form</title>
</head>
<body>

<form action="reply" method="post">
<c:forEach items="${list }" var="b">
	<input type="hidden" name="num" value="${b.num }">
	<input type="hidden" name="writer" value="${b.writer }">
	<input type="hidden" name="title" value="${b.title }">
	<input type="hidden" name="content" value="${b.content }">
	<input type="hidden" name="writeday" value="${b.writeday }">
	<input type="hidden" name="readcnt" value="${b.readcnt }">
	<input type="hidden" name="groups" value="${b.groups }">
	<input type="hidden" name="step" value="${b.step }">
	<input type="hidden" name="indent" value="${b.indent }">			
</c:forEach>
<table border="1" align="center">
	<tr>
		<th>작성자</th>
		<td><input type="text" name="r_writer"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="r_title"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="r_content" rows="10" cols="50"></textarea></td>
	</tr>
	<tr>
		<td>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
		</td>
	</tr>
</table>
</form>
</body>
</html>