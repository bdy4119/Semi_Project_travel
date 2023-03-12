<%@page import="mul.cam.a.dao.ReviewDao"%>
<%@page import="mul.cam.a.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.cam.a.util.Utility"%>
<%@page import="mul.cam.a.dto.BbsDto"%>
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
        
        .travel-photo {
        	margin: 20px;
        	width: 270px;
        	border: solid 5px aqua;
        }
        
        
        /* 화면 넓어졌을때 */
        @media (min-width: 1000px) {
		  table {
		    width: 1000px;
		  }
		  
		  .order {
		  	margin-left: 147px;
		  }
		  
		  .class {
		  	margin-right: 147px;
		  }
		}
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
						<a class="btn btn-outline-primary me-2" href="/loginpage.do" role="button">Login</a>
                    </li>
                    <li>
                        <button type="button" class="btn btn-primary">Sign-up</button>
                    </li>
                </ul>
            </div>
        </header>
        <%--헤더--%>

        <%--공백--%>
        <div class="b-example-divider"></div>

        <%--내용--%>
        <br>
        
        <%
        List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("review");
		int pageBbs = (Integer)request.getAttribute("pageBbs");
		int pageNumber = (Integer)request.getAttribute("pageNumber");
		String choice = (String)request.getAttribute("choice");
		String search = (String)request.getAttribute("search");
        %>
        <hr>
        <h1>여행지 리뷰</h1>
        <hr>
		
		<!-- 사진링크 -->
		<div align="center">
			<button type="button" style="font-size:20px;padding-top:1px;padding-bottom:1px;">«</button>
			<img alt="철원" src="images/cheolwon.jpg" class="travel-photo">
			<img alt="제주" src="images/jeju.jpg" class="travel-photo">
			<button type="button" style="font-size:20px;padding-top:1px;padding-bottom:1px;">»</button>
		</div>
		
		
		<br>
		<br>
		<br>
		<!-- 원하는 순서로 보기 -->
		<div style="float: left;" class="order">
			<select id="order">
				<option value="wdate">최신순</option>
				<option value="longdate">오래된순</option>
				<option value="readcount">조회수</option>
			</select>
		</div>
		<!-- 원하는 순서로 보기 -->
		
		<!-- 검색 -->
		<div style="float: right;" class="class">
			<select id="choice">
				<option value="">검색</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>
			<input type="text" id="search" value="">
			
			<button type="button" onclick="searchBtn()">검색</button>
		</div>
		<!-- 검색 끝 -->

		
		<br>
		<div align="center">
		<br>
			<table border="1">
				<col width="70">
				<col width="450">
				<col width="120">
				<col width="200">
				<col width="150">
				<thead>
					<tr align="center">
						<th>번호</th>
						<th>제목</th>
						<th>ID</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody align="center" class="b-example-divider">
					<%
						if(list == null || list.size() == 0) {
							%>
							<tr>
								<td colspan="4">작성된 글이 없습니다.</td>
							</tr>
							<%
						} else {
							for(int i=0; i<list.size(); i++) {
								ReviewDto dto = list.get(i);
							%>
						<tr>
							<td>1</td>
							<td><%=dto.getTitle() %></td>
							<td><%=dto.getId() %></td>
							<td><%=dto.getWdate() %></td>
							<td><%=dto.getReadcount() %></td>
						</tr>
						<%
							}
						}
						%>
				</tbody>
			</table>
				
			<br>
			<br>
			<div class="container">
				   <nav aria-label="Page navigation">
				       <ul class="pagination" id="pagination" style="justify-content:center"></ul>
				   </nav>
			</div>
	 			
			<button type="button" style="float:right;">글쓰기</button>
		       <br>
		       <br>
		       <br>
		</div>
        
        <%--내용end--%>
        

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
