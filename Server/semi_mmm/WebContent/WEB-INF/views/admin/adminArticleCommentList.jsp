<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
 -->
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Adimn - 중고장터 댓글 관리 페이지</title>
<link href="/admin/css/tg_styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
<style>
nav a {
	cursor: pointer;
}

</style>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">

	<a class="navbar-brand" href="/admin" style="height: 100%"><img
		src="/admin/img/logo.png" style="height: 100%">&nbsp;관리자 페이지</a>
	<button class="btn btn-link btn-sm order-1 order-lg-0"
		id="sidebarToggle" href="/admin">
		<i class="fas fa-bars"></i>
	</button>
	<!-- Navbar Search-->
	<form
		class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
	</form>
	<!-- Navbar-->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			id="userDropdown" href="#" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"><i
				class="fas fa-user fa-fw"></i></a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="/logout">Logout</a>
			</div></li>
	</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
					<div class="sb-sidenav-menu-heading">Core</div>
					<a class="nav-link" href="/admin">
						<div class="sb-nav-link-icon">
							<i class="fas fa-tachometer-alt"></i>
						</div> 관리자 메인 페이지
					</a>
					<div class="sb-sidenav-menu-heading">게시글 관리</div>
					<a class="nav-link collapsed" data-toggle="collapse"
						data-target="#collapseLayouts" aria-expanded="false"
						aria-controls="collapseLayouts">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> 자랑게시판 관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseLayouts"
						aria-labelledby="headingOne" data-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav"> <a class="nav-link"
							href="/adminNoticeList?reqPage=1">게시글 관리</a> <a class="nav-link"
							href="/adminCommentList?reqPage=1">댓글 관리</a> </nav>
					</div>
					<a class="nav-link collapsed" data-toggle="collapse"
						data-target="#collapsePages" aria-expanded="false"
						aria-controls="collapsePages">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> Q&A 관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapsePages"
						aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav accordion"
							id="sidenavAccordionPages"> <a class="nav-link"
							href="/adminQnaList?reqPage=1">질문 관리</a> <a class="nav-link"
							href="/adminAnswerList?reqPage=1">응답 관리</a> </nav>
					</div>
					<a class="nav-link collapsed" data-toggle="collapse"
						data-target="#collapseArticle" aria-expanded="false"
						aria-controls="collapseArticle">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> 중고장터 관리
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapseArticle"
						aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav accordion"
							id="sidenavAccordionArticle"> <a class="nav-link"
							href="/adminArticleNoticeList?reqPage=1">게시글 관리</a> <a class="nav-link"
							href="/adminArticleCommentList?reqPage=1">댓글 관리</a> </nav>
					</div>
					<div class="sb-sidenav-menu-heading">회원관리</div>
					<a class="nav-link" href="/adminUserList?reqPage=1">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> 일반 회원
					</a> <a class="nav-link" href="/adminBusinessList?reqPage=1">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> 사업자 회원
					</a>
					<div class="sb-sidenav-menu-heading">사이트관리</div>
					<a class="nav-link" href="/adminFnaList?reqPage=1">
						<div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> F&A 관리
					</a>
				</div>
			</div>
			<div class="sb-sidenav-footer">
				<div class="small">Logged in as:</div>
				Administrator Page
			</div>
			</nav>
		</div>
        <script>
            function articlePopup(articleCommentNo) {
                var status = "left=500px, top=100px, width=600px, height=300px, menubar=no, status=no,scrollbars=yes";
                var title = "adminArticleComment";
                var url = "/adminArticleComment";
                var popup = window.open("", title, status);
                
                $("input[name=articleCommentNo]").val(articleCommentNo);
                $("#page").attr("action", url);
                $("#page").attr("method", "post");
                $("#page").attr("target", title); //새로 열린 popup창과 form 태그를 연결
                $("#page").submit();
            }
        </script>
		<div id="layoutSidenav_content">
			<main>
                <form id="page">
                    <input type="hidden" name="articleCommentNo">
                </form>
				<h1 style="margin: 20px;">중고장터 댓글 관리</h1>
				<hr>
				<table class="list_table comment_notice">
                    <tr>
                        <th>댓글번호</th>
                        <th>게시물번호</th>
                        <th>내용</th>
                        <th>작성자</th>
                        <th>작성일</th>
                    </tr>
                    <c:forEach items="${data.list }" var="comment">
                    	<c:if test="${comment.articleCommentDeleteBool eq 0 }">
                    		<tr class="delete_false">
                    			<td>${comment.articleCommentNo }</td>
                    			<td><a class="delete_false" href="/adminArticleRead?articleNoticeNo=${comment.articleRef }">${comment.articleRef }</a></td>
                                <td><a class="delete_false" href="javascript:void(0)" onclick="articlePopup(${comment.articleCommentNo })">${comment.articleCommentContent }</a></td>
                    			<td>${comment.articleCommentWriter }</td>
                    			<td>${comment.articleCommentDate }</td>
                    		</tr>
                    	</c:if>
                    	<c:if test="${comment.articleCommentDeleteBool eq 1 }">
                    		<tr class="delete_true">
                    			<td>${comment.articleCommentNo }</td>
                    			<td><a class="delete_true" href="/adminArticleRead?articleNoticeNo=${comment.articleRef }">${comment.articleRef }</a></td>
                                <td><a class="delete_true" href="javascript:void(0)" onclick="articlePopup(${comment.articleCommentNo })">${comment.articleCommentContent }</a></td>
                    			<td>${comment.articleCommentWriter }</td>
                    			<td>${comment.articleCommentDate }</td>
                    		</tr>
                    	</c:if>
                    </c:forEach>
                </table>
                <div class="pageNavi">
                    ${data.pageNavi }
                </div>
                <div class="searchBox">
                	<div>
	                	<form action="/adminArticleCommentList" method="get">
	                		<input type="hidden" name="reqPage" value="1">
	                		<select name="type" class="form-control" style="width: 150px;">
	                			<option value="article_ref">게시글 번호</option>
	                			<option value="article_comment_writer">작성자</option>
	                			<option value="article_comment_content">내용</option>
	                		</select>
	                		<input type="text" class="form-control" style="width: 300px" name="search">
	                		<input type="submit" class="btn btn-primary" style="width: 80px; height: 40px" value="검색" onclick="return check();">
	                	</form>
                	</div>
                </div>
			</main>
			<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Your Website 2019</div>
					<div>
						<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
							&amp; Conditions</a>
					</div>
				</div>
			</div>
			</footer>
		</div>
	</div>
    <script>
        function check() {
            if ($("input[name=search]").val() == "") {
                alert("검색 내용을 입력하세요.");
                return false;
            }
            
            var regExp = /\D/;
            if ($("option:selected").val() == "article_ref" && regExp.test($("input[name=search]").val())) {
                alert("숫자를 입력하세요.");
                return false;
            }
        }
    </script>
    <c:if test="${not empty search}">
        <script>
            var option = $("option");
			for (var i = 0; i < option.length; i++) {
                console.log(option.eq(i).val());
				if (option.eq(i).val() == "${type}") {
                    option.eq(i).prop("selected", "true");
                    break;
                }
			}
            
            $("input[name=search]").val("${search}");
        </script>
    </c:if>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/admin/js/tg_scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
</body>
</html>