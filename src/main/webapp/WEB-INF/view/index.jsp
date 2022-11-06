<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스</title>
<c:import url="classpath:static/importer.html" />
</head>
<body>
	<div class="container py-5">
		<form action="/member/auth" method="post">
			<div class="row justify-content-center align-items-center">
				<div class="col-2 text-end">
					<label for="username">아이디: </label>
				</div>
				<div class="col-4">
					<input class="form-control" name="username">
				</div>
			</div>
			<div class="row justify-content-center align-items-center mt-2">
				<div class="col-2 text-end">
					<label for="password">비밀번호: </label>
				</div>
				<div class="col-4">
					<input class="form-control" name="password">
				</div>
			</div>
			<div class="row justify-content-center align-items-center mt-4">
				<div class="col-3 text-end">
					<button type="submit" class="btn btn-outline-success">로그인하기</button>
				</div>
				<div class="col-3 justify-content-center">
					<a href="/member/register" class="btn btn-outline-primary">가입하기</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>














