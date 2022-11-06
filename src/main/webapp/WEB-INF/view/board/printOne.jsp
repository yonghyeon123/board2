<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${boardDTO.id}번글</title>
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
		<div class="row justify-content-center">
			<div class="col-8">
				<span class="form-control"> ${boardDTO.title } </span>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-8">
				<span class="form-control"> ${boardDTO.nickname } </span>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-8">
				<span class="form-control"> 작성일: <fmt:formatDate
						value="${boardDTO.entryDate }" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" />
				</span>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-8">
				<span class="form-control"> 수정일: <fmt:formatDate
						value="${boardDTO.modifyDate }"
						pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" />
				</span>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-8 text-start">
				<span class="form-control"> ${boardDTO.content } </span>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="row ">
					<c:if test="${boardDTO.writerId eq logIn.id}">
						<div class="col text-center">
							<a href="/board/update/${boardDTO.id}"
								class="btn btn-outline-warning">수정하기</a>
						</div>
						<div class="col text-center">
							<button class="btn btn-outline-danger" onclick="showAlert();">삭제하기</button>
						</div>
					</c:if>
					<div class="col text-center">
						<a href="/board/showAll/1" class="btn btn-outline-secondary">목록으로</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-8 text-start">
				<hr class="border border-primary border-3">
			</div>
		</div>
		<c:forEach items="${replyList}" var="reply">
			<div class="row justify-content-center">
				<div class="col-8 text-start">
					<div class="row">
						<div class="col">
							<form action="/reply/update" method="post">
								<input class="form-control"
									value='${reply.nickname}: ${reply.content} AT 
									<fmt:formatDate value="${reply.modifyDate}" pattern="yyMMdd HH:mm:ss" />'
									disabled name="content" id="txtContent${reply.id}">

								<button type="submit" class="btn btn-outline-warning"
									style="visibility: hidden" disabled id="btnEdit${reply.id}">수정</button>
							</form>
						</div>
						<c:if test="${reply.writerId eq logIn.id}">
							<div class="col-1">
								<img src="/img/pencil-fill.svg"
									onclick="editComment('${reply.id}')"> <a
									href="/reply/delete/id"> <img src="/img/trash-fill.svg">
								</a>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="row justify-content-center">
			<div class="col-8 text-start">
				<form action="/reply/write/${boardDTO.id}" method="post">
					<input type="text" class="form-control" name="content">
					<button type="submit" class="btn">입력</button>
				</form>
			</div>
		</div>
	</div>
	<script>
	    function showAlert() {
	        Swal.fire({
	            icon: 'warning',
	            title: '!!! 경고 !!!',
	            text: '${boardDTO.id}번 글을 정말로 삭제하시겠습니까?',
	            showCancelButton: true,
	            confirmButtonText: '예',
	            cancelButtonText: '아니오'
	        }).then((result) => {
                if(result.isConfirmed){
                    location.href = "/board/delete/${boardDTO.id}";
                }
            });
	    }
	    
	    function editComment(id) {
	    	var btnEdit = document.getElementById("btnEdit"+id);
			btnEdit.style.visibility = 'visible';
			btnEdit.removeAttribute('disabled');
	    	var txtContent = document.getElementById("txtContent"+id);
	    	txtContent.value = "";
	    	txtContent.removeAttribute('disabled');
	    }
	</script>
</body>
</html>


















