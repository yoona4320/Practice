<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th{	background-color: skyblue;
color: white;}
</style>
<meta charset="UTF-8">
<title>mem out</title>
</head>
<body>

<table border="1" align="center">
<caption><h3>회원정보관리</h3></caption>
	<tr>
		<th>아이디</th><th>패스워드</th><th>이름</th><th>전화번호</th>
		<th>이메일</th><th>거주지</th><th>생년월일</th>
	</tr>
	
	<c:forEach items="${list}" var="li">
	<tr>
		<td><a href="updateui?id=${li.id}">${li.id}</a></td>
		<td>${li.pw}</td>
		<td>${li.name}</td>
		<td>${li.tel}</td>
		<td>${li.email}</td>
		<td>${li.address}</td>
		<td>
			<fmt:parseDate var="dateString" value="${li.birth}" pattern="yyyy-MM-dd 00:00:00"/>
         	<fmt:formatDate value="${dateString}" pattern="yyyy년 MM월 dd일"/>
		</td>
	</tr>
	</c:forEach>
	
</table>

</body>
</html>