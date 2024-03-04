<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${BookBean.bID} 상세 | 따다</title>
    <style>
    body, html {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    #read {
        padding: 15px;
        background-color: #2F0B3A;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        float: right;
    }

    #read:hover {
        background-color: #555;
        transition: background-color 0.1s;
    }
    
    .container {
        width: 60%;
        margin-left: 300px;
        color: white;
    }
    hr {
        border: none;
        height: 1px;
        background-color: #fff;
        margin-top: 20px;
        margin-bottom: 20px;
        position: relative;
    }
    hr::before {
        content: "";
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        width: 100%;
        background-color: #111;
        animation: hrSlide 1s ease-out forwards;
    }
    
    @keyframes hrSlide {
        from {
            width: 100%;
        }
        to {
            width: 0;
        }
    }

    .product-info {
        display: flex;
        margin-top: 40px;
    }
    
    .product-info img {
       	width: 500px;
        border: 1px solid #fff;
        border-radius: 5px;
    }
    
    .product-details {
        margin-top: -20px;
        margin-left: 20px;
    }
    
    p {
        line-height: 2;
        font-size: 1.5em;
    }

    .small-text {
        font-size: 90%;
        margin: 5px 0;
    }
    
    .small-details {
		margin-top: 30px;
		margin-bottom: 50px;
    }
    </style>
</head>
<body>
    <div class="container">
        <h1 style="display: flex; justify-content: space-between;">${BookBean.bID}<button id="read" onclick="location.replace('readBook.book?uID=${sessionScope.id}&&bID=${BookBean.bID}')">열람</button></h1>
        <hr>
        <div class="product-info">
            <div>
                <img class="product-image" src="${pageContext.request.contextPath}/${BookBean.contents}/thumb.jpg" alt="썸네일">
            </div>
            <div class="product-details">
                <p><strong>장르</strong> &nbsp;${BookBean.genre} / <strong>별점</strong> &nbsp;${score} (${count}명 참여)</p>
                <br>
                <p><strong>저자</strong> &nbsp;${BookBean.author} / <strong>발행처</strong> &nbsp;${BookBean.company}</p>
                <br>
                <p><strong>줄거리</strong><br>${BookBean.outline}</p>
            </div>
        </div>
        <div class="small-details">
        <p class="small-text"><strong>발행일 </strong> &nbsp;${BookBean.pubDate}</p>
        <p class="small-text"><strong>페이지 수 </strong> &nbsp;${BookBean.page} 쪽</p>
        <p class="small-text"><strong>ISBN </strong> &nbsp;${BookBean.IBSN}</p>
        </div>
        <div style="text-align: center; margin-top: 20px;">
            <button onclick="history.back()">뒤로 가기</button>
        </div>
    </div>
</body>
</html>
