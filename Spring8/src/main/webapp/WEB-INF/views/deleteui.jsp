<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{text-align:center;}
</style>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>

<form action="deleteform" method="post">
<table style="width:500px">
	<tr>
		<th><h4>삭제할 회원의 ID를 입력해주세요!</h4></th>
		<td><input type="text" name="id"></td>
	</tr>
</table>
<br>
<input type="submit" value="삭제">
<input type="button" value="취소" onclick="location.href='main'">
</form>

</body>
</html>