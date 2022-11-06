<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정 페이지</title>
<c:import url="classpath:static/importer.html" />
</head>
<body>
	<div class="container py-5">
		<c:if test="${message ne null}">
			<div class="row justify-content-center align-items-center">
				<div class="col-6 alert alert-danger" role="alert">${message}
				</div>
			</div>
		</c:if>
		<form action="/member/update" method="post">

			<input type="hidden" value="${memberDTO.username }" name="username">

			<div class="row justify-content-center align-items-center">
				<div class="col-2 text-end">
					<label for="username">아이디: </label>
				</div>
				<div class="col-4">
					<input class="form-control" value="${memberDTO.username}" disabled>
				</div>
			</div>
			<div class="row justify-content-center align-items-center mt-2">
				<div class="col-2 text-end">
					<label for="password">기존 비밀번호: </label>
				</div>
				<div class="col-4">
					<input type="password" class="form-control" name="password">
				</div>
			</div>
			<div class="row justify-content-center align-items-center mt-2">
				<div class="col-2 text-end">
					<label for="password">새로운 비밀번호: </label>
				</div>
				<div class="col-4">
					<input type="password" class="form-control" name="newPassword">
				</div>
			</div>
			<div class="row justify-content-center align-items-center mt-2">
				<div class="col-2 text-end">
					<label for="nickname">닉네임: </label>
				</div>
				<div class="col-4">
					<input class="form-control" name="nickname"
						value="${memberDTO.nickname}">
				</div>
			</div>
			<div class="row justify-content-center align-items-center mt-4">
				<div class="col-3 text-end">
					<button type="submit" class="btn btn-outline-success">수정하기</button>
				</div>
				<div class="col-3 justify-content-center">
					<a class="btn btn-outline-primary" href='/board/showAll/1'>게시판
						메인으로 가기</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>