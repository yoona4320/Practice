<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th{	background-color: skyblue;
color: white;}
</style>
<meta charset="UTF-8">
<title>mem update</title>
</head>
<body>

<form action="update" method="post">
<table border="1" align="center">
<caption><h3>회원정보수정</h3></caption>
	
	<c:forEach items="${dt}" var="dt">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" value="${dt.id}" readonly></td>
	</tr>
	<tr>
		<th>패스워드</th>
		<td><input type="text" name="pw" value="${dt.pw}"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" value="${dt.name}"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="tel" value="${dt.tel}"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" value="${dt.email}"></td>
	</tr>
	<tr>
		<th>거주지</th>
		<td><input type="text" name="address" value="${dt.address}"></td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td><input type="date" name="birth" value="${dt.birth}"></td>
	</tr>
	<tr style="text-align:center;">
		<td colspan="2"><input type="submit" value="수정"></td>
	</tr>
	</c:forEach>
</table>
</form>

</body>
</html>