<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SemiProject</title>

<%--BootStrap--%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">

<!-- style은  head-->
<style type="text/css">
.photo-container {
	display: flex;
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.left-menu {
	margin-left: 100px;
	padding-top: 5rem;
	width: 400px;
	display: flex;
}

ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.left-menu li {
	display: inline-block;
	margin-right: 1rem;
	font-size: 1.2rem;
}

.photo-table {
	margin-left: 150px;
	margin-right: 30px;
}

table {
	width: 100%;
	border-collapse: collapse;
	border: none;
}

td {
	width: 25%;
	padding: 5px;
	text-align: center;
	border: none;
	border-radius: 20px;
	overflow: hidden;
}

.photo-table td img {
	width: 230px;
	height: 230px;
	border-radius: 20px;
	margin-right: 30px;
}

#logo img {
	width: 100%;
	height: auto;
}
</style>



</head>

<body>
	<%--container--%>
	<div class="container">
		<main>

			<%--헤더--%>
			<header
				class="d-flex flex-wrap flex-nowrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
				<a href="/" id="logo"
					class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none"
					style="width: 150px;"> <img src="images/logo.png"
					style="width: 100%;">
				</a>

				<ul
					class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
					<li><a href="/localtravel.do" class="nav-link px-2 link-dark">지역별
							여행</a></li>
					<li><a href="/hotel.do" class="nav-link px-2 link-dark">숙소
							추천</a></li>
					<li><a href="/review.do" class="nav-link px-2 link-dark">여행
							리뷰</a></li>
					<li><a href="/community.do" class="nav-link px-2 link-dark">커뮤니티</a></li>
				</ul>


				<div class="col-md-3 text-end">
					<ul
						class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
						<li><a href="/mypage.do" class="nav-link px-2 link-dark">마이페이지</a></li>
						<li>
							<a class="btn btn-outline-primary me-2" href="/login.do" role="button">Login</a>
						</li>
						<li>
							<a class="btn btn-primary" href="/regi.do" role="button">Sign-up</a>
						</li>
					</ul>
				</div>
			</header>
			<%--헤더--%>

			<%--공백--%>
			<div class="b-example-divider"></div>

			<%--내용--%>


			<div class="photo-container">
				<div class="left-menu">
					<ul>

						<li><a href="menu_seoul.do"
							data-img="areaimages/seoul/seoul1.jpg">수도권</a></li>
						<li><a href="menu_gwd.do"
							data-img="areaimages/gangwon/gangwon1.jpg">강원도</a></li>
						<li><a href="menu_ccd.do"
							data-img="areaimages/chungcheong/chungcheong1.jpg">충청도</a></li>
						<li><a href="menu_gsd.do"
							data-img="areaimages/gyeongsang/gyeongsang1.jpg">경상도</a></li>
						<li><a href="menu_jld.do"
							data-img="areaimages/jeolla/jeolla1.jpg">전라도</a></li>
						<li><a href="menu_jeju.do"
							data-img="areaimages/jeju/jeju1.jpg">제주도</a></li>
					</ul>
				</div>


				<div class="photo-table">
					<table>
						<tr>
							<td></td>
							<td></td>
							<td><select id="sort-by">
									<option value="default">기본 정렬</option>
									<option value="views">조회수 순</option>
							</select></td>
						</tr>
						<tr>
							<td><a href="p_seoul1.do"><img
									src="areaimages/seoul/seoul1.jpg"></td>
							<td><a href="p_seoul2.do"><img
									src="areaimages/seoul/seoul2.jpg"></td>
							<td><a href="p_gwd1.do"><img
									src="areaimages/gangwon/gangwon1.jpg"></td>
						</tr>
						<tr>
							<td><a href="p_gwd2.do"><img
									src="areaimages/gangwon/gangwon2.jpg"></td>
							<td><a href="p_ccd1.do"><img
									src="areaimages/chungcheong/chungcheong1.jpg"></td>
							<td><a href="p_ccd1.do"><img
									src="areaimages/chungcheong/chungcheong2.jpg"></td>
						</tr>
						<tr>
							<td><a href="p_gsd1.do"><img
									src="areaimages/gyeongsang/gyeongsang1.jpg"></td>
							<td><a href="p_gsd2.do"><img
									src="areaimages/gyeongsang/gyeongsang2.jpg"></td>
							<td><a href="p_jld1.do"><img
									src="areaimages/jeolla/jeolla1.jpg"></td>
						</tr>
						<tr>
							<td><a href="p_jld2.do"><img
									src="areaimages/jeolla/jeolla2.jpg"></td>
							<td><a href="p_jeju1.do"><img
									src="areaimages/jeju/jeju1.jpg"></td>
							<td><a href="p_jeju2.do"><img
									src="areaimages/jeju/jeju2.jpg"></td>

						</tr>
					</table>

					<!--   
			 		<%
						int page2 = (int) request.getAttribute("page");
						int totalCount = (int) request.getAttribute("totalCount");
						int countList = 10; // 노출될 페이지 개수 ( << < ( 11 12 13 14 15 16 17 18 19 20 ) > >> )
						int countPage = 10; // 페이지 당 노출 개수 (10개 보여준다!)
						int totalPage = totalCount / countList;
						
						if (totalCount % countList > 0) {
						    totalPage++;
						}
						
						if (totalPage < page2) {
						    page2 = totalPage;
						}
						int startPage = ((page2 - 1) / 10) * 10 + 1;
						int endPage = startPage + countPage - 1;
						
						if (endPage > totalPage) {
						    endPage = totalPage;
						}
						
						if (startPage > 1) {
						    %>
						    <a href="?page=1">처음</a>
						    <%
						}
						
						if (page2 > 1) {
						    %>
						    <a href="?page=<%=page2 - 1%>">이전</a>
						    <%
						}
						
						for (int iCount = startPage; iCount <= endPage; iCount++) {
						    if (iCount == page2) {
						        %>
						        <b><%=iCount%></b>
						        <%
						    } else {
						        %>
						        <span><%=iCount%></span>
						        <%
						    }
						}
						
						if (page2 < totalPage) {
						    %>
						    <a href="?page=<%=page2 + 1%>">다음</a>
						    <%
						}
						
						if (endPage < totalPage) {
						    %>
						    <a href="?page=<%=totalPage%>">끝</a>
						    <%
						}
%> 

					
					-->


				</div>
			</div>


			<%--내용--%>

		</main>

		<%--공백--%>
		<div class="b-example-divider"></div>

		<%--푸터--%>
		<footer
			class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
			<div class="col-md-4 d-flex align-items-center">
				<span class="mb-3 mb-md-0 text-muted">&copy; 2023 Multi
					campus, Semi project</span>
			</div>
		</footer>
		<%--푸터--%>

	</div>
	<%--container--%>

	<%--BootStrap--%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
</script>
	<%--BootStrap--%>

</body>
</html>
