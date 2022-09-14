<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{text-align:center;}
h4{text-align:center;}
</style>
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	session.setAttribute("d_id", id);
%>

<c:forEach items="${list}" var="d">
<form action="deletedata" method="post">

<table style="width:500px">
	<tr>
		<th><h4>${d.name}님의 정보를 삭제하시겠습니까?</h4></th>
	</tr>
</table>
<br>
<input type="submit" value="삭제">
<input type="button" value="취소" onclick="location.href='deleteui'">
	
</form>
</c:forEach>

</body>
</html>