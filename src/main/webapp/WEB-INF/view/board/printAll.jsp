<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시판 메인 화면</title>
<c:import url="classpath:static/importer.html" />
</head>
<body>
	<div class="container ">
		<nav class="navbar bg-light">
			<div class="container-fluid">
				<a class="navbar-brand">게시판</a>
				<form class="d-flex" role="search">
					<a href="/member/update" class="btn btn-outline-primary">회원 정보
						수정 </a> <a href="/member/logOut" class="btn btn-outline-secondary">로그아웃</a>
				</form>
			</div>
		</nav>
		<div class="row justify-content-center align-items-center">
			<div class="col-8">
				<div class="table-responsive">
					<table
						class="table table-striped table-hover text-center align-middle">
						<thead>
							<tr>
								<th class="col-1">번호</th>
								<th class="col-5">제목</th>
								<th class="col-2">작성자</th>
								<th class="col-2">작성일</th>
								<th class="col-2">수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="board">
								<tr onclick="location.href='/board/showOne/${board.id}'">
								<c:if test="${replyMap.get(board.id) ne null}">
								    <c:set var="QNT" value="[+${replyMap.get(board.id).QNT}+]" />
								</c:if>
									<td class="col-1">${board.id}</td>
									<td class="col-5">${board.title }</td>
									<td class="col-2">${board.nickname }</td>
									<td class="col-2"><fmt:formatDate
											value="${board.entryDate }" pattern="yyMMdd HHmmss" /></td>
									<td class="col-2"><fmt:formatDate
											value="${board.modifyDate }" pattern="yyMMdd HHmmss" /></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="5" class="table-info">
									<ul
										class="pagination justify-content-center align-items-center">
										<li class="page-item"><a class="page-link"
											href="/board/showAll/1"><<</a></li>

										<c:forEach begin="${startPage}" end="${endPage}" var="i">
											<c:choose>
												<c:when test="${i ne currentPage}">
													<li class="page-item"><a class="page-link"
														href="/board/showAll/${i }">${i }</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item active"><span class="page-link">${i }</span>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<li class="page-item"><a class="page-link"
											href="/board/showAll/${totalPage }">>></a></li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-2 btn btn-outline-info"
				onclick="location.href='/board/write'">
				<span>새로운 글 작성</span>
			</div>
		</div>
	</div>
</body>
</html>








