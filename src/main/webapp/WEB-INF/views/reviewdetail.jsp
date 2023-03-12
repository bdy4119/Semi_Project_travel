<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SemiProject</title>

    <%--BootStrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

    <style>
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }
        
        /*  .main-crop {
		    position: relative;
		    width: 100%; // 자를 사이즈를 명시해준다.
		    height: 20px;
		    overflow: hidden;
		
		    .main-img {
		      position: absolute; // 포지션을 주고,
		      top: 100px; 		  // 보이기 원하는 위치를 지정
		      left: 0;
		      width: 300px; // 오리지널 사이즈
		      height: 200px;
		  } */
    </style>

</head>

<body>
<%--container--%>
<div class="container">
    <main>

        <%--헤더--%>
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                <img src="images/logo.png">
            </a>

            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/localtravel.do" class="nav-link px-2 link-dark">지역별 여행</a></li>
                <li><a href="/hotel.do" class="nav-link px-2 link-dark">숙소 추천</a></li>
                <li><a href="/review.do" class="nav-link px-2 link-dark">여행 리뷰</a></li>
                <li><a href="/community.do" class="nav-link px-2 link-dark">커뮤니티</a></li>
            </ul>

            <div class="col-md-3 text-end">
                <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
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
<!-- 작성자 제목 작성일 조회수 정보 내용
		답글버튼, 삭제 버튼, 수정 버튼 -> 삭제랑 수정은 작성자 본인만 할 수 있게
	-->
		<br>
		
        <hr>
        <h1>여행지 리뷰</h1>
        <hr>
		
		<br>
		
        <hr>
        <h2>상세 리뷰</h2>
        <hr>
        
		<div class="main-img">
 	       	<img alt="제주" src="images/jeju.jpg" class="main-img" width="100%" height="50%">
		</div>
		<div id="app" class="container">
			<form>
				<table class="table table-striped">
				<colgroup>
					<col width="150px"/>
					<col width="500px"/>
				</colgroup>
					<tr>
						<th>작성자</th>
						<td>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
						</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>
						</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>
						</td>
					</tr>
					<tr>
						<th colspan="2" style="size:22px;font-weight:bold;">제목</th>
					</tr>
					<tr>
						<td colspan="2" style="background-color:white;">
							<pre style="font-size: 20px;font-family:고딕, arial;background-color:white">내용</pre>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" class="btn btn-primary" onclick="answerBbs()">답글</button>
							<button type="button" class="btn btn-primary" onclick="location.href='review.do'">글목록</button>
							
							<!-- 수정, 삭제는 로그인한 본인한테만 보이게 하기 -->
							<button type="button" class="btn btn-primary" onclick="updateBbs()">수정</button>
							<button type="button" class="btn btn-primary" onclick="deleteBbs()">삭제</button>
							
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<script type="text/javascript">
			function answerBbs(seq) {
				//seq를 넘겨주고 있으므로 seq값 가지고 넘어가기
				location.href = "answer.do?seq=" + seq;
			}
			
			function updateBbs(seq) {
				location.href = "bbsupdate.do?seq=" + seq;
			}
			
			//진짜 지우는 게 아니라 업데이트로 지우기
			//del변수를 1로 바꾸고 보이지 않게 바꾸기
			function deleteBbs(seq) {
				location.href = "bbsdeleteAf.do&seq=" + seq;
			}
		</script>
		
		
		
		
		<br>
		<br>
		<!-- 댓글 -->
		<div id="app" class="container">
			<form action="commentWriteAf.do" method="post">
			<input type="hidden" name="seq" value="">
			<input type="hidden" name="id" value="">
			
				<table>
				<col width="1500px">
				<col width="150px">
					<tr>
						<td>comment</td>
						<td style="padding-left:30px">올리기</td>
					</tr>
					<tr>
						<td>
							<textarea rows="3" class="form-control" name="content"></textarea>
						</td>
						<td style="padding-left:30px">
							<button type="submit" class="btn btn-primary btn-block p-4">완료</button>
						</td>
					</tr>
				</table>
			</form>
			
			<br>
			<br>
			<!-- 댓글 뿌리기  -->
			<table class="table table-sm">
			<col width="500">
			<col width="500">
				<tbody id="tbody">
				</tbody>
			</table>
		</div>

    </main>

    <%--공백--%>
<!--     <div class="b-example-divider"></div> -->

    <%--푸터--%>
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
        <div class="col-md-4 d-flex align-items-center">
            <span class="mb-3 mb-md-0 text-muted">&copy; 2023 Multi campus, Semi project</span>
        </div>
    </footer>
    <%--푸터--%>

</div>
<%--container--%>

<%--BootStrap--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">
</script>
<%--BootStrap--%>

</body>
</html>
