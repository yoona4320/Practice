<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">

<style type="text/css">
table{width: 90%;
margin: 0 auto;}
</style>	

<title>Insert title here</title>
</head>
<body>

<header>
	<table>
		<tr>
			<td><a href="main"><img src="./imagee/home.png" width="50" height="50"></a></td>
			<td style="text-align:center;"><h1>조랭닷컴</h1></td>
			<td>
				<c:choose>
				<c:when test="${isLogOn == true && member != null }">
					환영합니다. ${member.name }님!&emsp; <a href="logout">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="login">로그인</a>
				</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
	<hr color="pink">
</header>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		
		<ul class="nav navbar-nav">
			<li class="active">
				<li><a href="memin">회원입력</a></li>
        	</li>
		</ul>
		<ul class="nav navbar-nav">
			<li class="active">
				<li><a href="memout">회원출력</a></li>
        	</li>
		</ul>
		<ul class="nav navbar-nav">
			<li class="active">
				<li><a href="deleteui">회원삭제</a></li>
        	</li>
		</ul>
		
		<ul class="nav navbar-nav">
			<li class="active">
				<li><a href="boardinput">글작성</a></li>
				
        	</li>
		</ul>
		<ul class="nav navbar-nav">
			<li class="active">
				<li><a href="boardout">글목록</a></li>
        	</li>
		</ul>
		
	</div>
</nav>
</body>
</html>