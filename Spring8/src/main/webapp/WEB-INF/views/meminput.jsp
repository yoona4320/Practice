<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mem input</title>
</head>
<body>

<form action="memsave" method="post">
<table border="1" align="center">
<caption><h3>회원정보입력</h3></caption>
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<th>패스워드</th>
		<td><input type="text" name="pw"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="tel"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<th>거주지</th>
		<td><input type="text" name="address"></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><input type="date" name="birth"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="입력"></td>
	</tr>
</table>
</form>

</body>
</html>