<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>따다 상단바 | 따다</title>
    <style type="text/css">
        body {
            font-size: 12px;
            padding-top: 76px;
            font-family: "맑은 고딕", Arial;
            margin: 0;
        }

        ul {
            list-style: none;
            margin: 0;
        }

        a {
            text-decoration: none;
        }

        .top_top > ul {
            background: #2F0B3A;
            margin: 0;
            display: flex;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .top_top > ul > li {
            display: inline-block;
        }

        .top_top > ul > li.search {
        	position: fixed;
            right: 380px;
            z-index: 1000;
        }

        .top > ul {
            text-align: center;
            height: 50px;
            background: #2F0B3A;
            padding: 0;
            display: flex;
            justify-content: center;
            margin: 0;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .top > ul > li {
            display: inline-block;
            width: 100px;
            height: 36px;
            margin-top: 5px;
            position: relative;
            overflow: hidden;
        }

        .top > ul > li > a {
            display: block;
            width: 100%;
            height: 100%;
            font: bold 13px/36px "맑은 고딕", Arial;
            text-align: center;
            color: #fff;
            background: #2F0B3A;
            transition: background 0.5s, color 0.5s;
            border-radius: 50px;
            position: relative;
        }

        .top > ul > li:hover > a {
            color: #fff;
            top: -5px;
        }

        .top > ul > li:after {
            content: "";
            position: absolute;
            left: 50%;
            bottom: 0;
            height: 2px;
            width: 0;
            background: #fff;
            transition: all 0.3s ease-in-out;
        }

        .top > ul > li:hover:after {
            left: 0;
            width: 100%;
        }

        .top ul ul {
            display: none;
        }

        button {
            background-color: #555;
            color: #fff;
            border: none;
            padding: 5px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
            margin-bottom: 0;
            transition: background 0.5s, color 0.5s;
            display: inline-block;
            margin: 0 10px;
        }

        button:hover {
            background-color: #333;
        }

        .logo {
            margin-top: 30px;
        }

        .logout {
            margin-top: 80px;
            margin-right: 20px;
            margin-bottom: 30px;
            text-align: right;
        }

        .list {
            color: #2F0B3A;
            margin-top: 30px;
        }
        
        a {
        	color: #fff;
        }
        
        a:hover{
        	color: #ccc;
        }

        section {
            position: sticky;
            top: 0;
            z-index: 1000;
            border-radius: 10px;
        }

        #searchInput {
            padding: 15px;
            border: none;
            border-radius: 50px;
            margin-top: 45px;
            width: 600px;
        }
        
        @media only screen and (max-width: 768px) {
        #searchInput {
            width: 80%;
        }
    }

        #searchButton {
            background-color: #555;
            color: #fff;
            border: none;
            padding: 8px;
            cursor: pointer;
            border-radius: 5px;
            transition: background 0.5s, color 0.5s;
        }

        #searchButton:hover {
            background-color: #333;
        }
    </style>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        var searchInput = document.getElementById('searchInput');
        var searchButton = document.getElementById('searchButton');
        
        // 엔터키 클릭 시 검색 결과 페이지로 이동
        searchInput.addEventListener('keyup', function (event) {
            if (event.key === 'Enter') {
                performSearch();
            }
        });

        // 검색 버튼을 클릭 시 검색 결과 페이지로 이동
        searchButton.addEventListener('click', performSearch);

        function performSearch() {
            var searchInputValue = searchInput.value.trim();
            if (searchInputValue !== '') {
                window.location.href = 'bookSearch.book?query=' + encodeURIComponent(searchInputValue);
            }
        }
    });
</script>
</head>
<body>
<section>
    <div class="top_top">
        <ul>
            <li class="logo"><a href="${pageContext.request.contextPath}/main/main.jsp"><img src="${pageContext.request.contextPath}/images/dda_bantu(g).png"></a></li>
            <li class="search">
                <input type="text" id="searchInput" placeholder="여기서 도서 검색을 할 수 있어요.">
                <button type="submit" id="searchButton">검색</button>
            </li>
 <li class="logout"><a href="${pageContext.request.contextPath}/personInfo.us?uNick=${sessionScope.uNick}">
        ${sessionScope.uNick}</a><span style="color: #ccc;">님, 반가워요✨</span><button type="button" onclick="location.href='${pageContext.request.contextPath}/logoutPro.log'">로그아웃</button></li>
        </ul>
    </div>
    <div class="top">
        <ul>
            <li class="list"><a href="${pageContext.request.contextPath}/allLibrary.book">도 서 관</a></li>
            <li class="list"><a href="${pageContext.request.contextPath}/myLibrary.book">내 서 재</a></li>
            <li class="list"><a href="${pageContext.request.contextPath}/review.us">한 줄 평</a></li>
            <li class="list"><a href="${pageContext.request.contextPath}/payForm.us">구 독 권</a></li>
            <li class="list"><a href="${pageContext.request.contextPath}/personInfo.us">내 정 보</a></li>
        </ul>
    </div>
</section>
</body>
</html>