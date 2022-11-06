<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제하기</title>
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
    </div>
    <script>
        Swal.fire({
          title: 'Error!',
          text: 'Do you want to continue',
          icon: 'error',
          confirmButtonText: 'Cool'
        })
    </script>
</body>
</html>


















