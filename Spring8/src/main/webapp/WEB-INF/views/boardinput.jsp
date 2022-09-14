<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board input</title>
</head>
<body>

<form action="boardsave" method="post">
<table border="1" align="center">
<caption><h3> 게시물을 작성해주세요. </h3></caption>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer" value="${member.name }" readonly></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="content" rows="10" cols="50"></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" value="등록">
		<input type="reset" value="취소">
		</td>
	</tr>
</table>
</form>

</body>
</html>