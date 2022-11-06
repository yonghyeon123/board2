<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>
<meta charset="UTF-8">
<title>${pageTitle}</title>
<c:import url="classpath:static/importer.html" />
</head>
<body>
	<div class="container">
		<nav class="navbar bg-light">
			<div class="container-fluid">
				<a class="navbar-brand">게시판</a>
				<form class="d-flex" role="search">
					<a href="/member/update" class="btn btn-outline-primary">회원 정보
						수정 </a> <a href="/member/logOut" class="btn btn-outline-secondary">로그아웃</a>
				</form>
			</div>
		</nav>
        <c:set var="buttonText" value="수정하기" />
        <c:set var="id" value="${boardDTO.id}" />
        <c:if test="${boardDTO eq null}">
            <c:set var="buttonText" value="등록하기" />
            <c:set var="id" value="0" />
        </c:if>
		<form action="/board/upsert" method="post">
		    <input type="hidden" value="${id}" name="id">
			<div class="row justify-content-center">
				<div class="col-8">
					<input type="text" class="form-control" name="title"
						placeholder="제목" value="${boardDTO.title}">
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-8">
					<textarea name="content" id="editor" value="${boardDTO.content}"></textarea>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="col-8">
					<button type="submit" class="btn btn-info col-12 text-center"> ${buttonText} </button>
				</div>
			</div>
		</form>
	</div>

    <script>
        CKEDITOR.replace("editor");
    </script>
</body>
</html>


















