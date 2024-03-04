<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>한줄평 | 따다</title>
    <style>
        body {
            font-family: Arial;
            margin: 0;
            padding: 0;
            flex-direction: column;
        }
        
        .review_total {
            margin-left: 200px;
            margin-right: 200px;
        }

        .top_line {
            width: 100%;
            height: 1px;
            background-color: #ddd;
            margin-bottom: 50px;
            position: relative;
        }

        #reviewReg {
            position: absolute;
            top: -50px;
            right: 200px;
            padding: 10px;
            background-color: #2F0B3A;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #reviewReg:hover {
            background-color: #555;
        }

        .book-container {
            position: relative;
            display: flex;
            margin: 50px 0 20px 0;
            width: 100%;
            max-width: 1100px;
            color: #ccc;
        }

        .thumbnail {
            width: 150px;
            height: auto;
        }

        .book-details {
            margin-left: 20px;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .title {
            font-size: 20px;
            font-weight: bold;
            margin-top: 0;
            margin-bottom: 5px;
        }

        .score {
            font-size: 12px;
            margin-top: 0;
        }

        .author {
            font-size: 12px;
            margin-top: 0;
            margin-bottom: 30px;
        }

        .nick {
            font-size: 14px;
            margin-top: 0;
        }

        .review {
            font-size: 14px;
            margin-top: 0;
        }
        
        .delete-btn {
            position: absolute;
            bottom: 0;
            right: 0;
            margin-top: 200px;
            padding: 5px 20px;
            font-size: 12px;
            background-color: #2F0B3A;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: flex;
            align-items: center;
        }
        
        .delete-btn span {
            margin: 0;
        }

        .delete-btn:hover {
            background-color: #555;
        }
    </style>

</head>
<body>
    <button id="reviewReg" onclick="location.href='reviewRegForm.us'">한줄평 등록</button>
    
    <div class="review_total">
        <c:if test="${reviewList eq null}">
            <div class="top_line" style="margin-top: 250px;"></div>
            <div class="book-container">
                <p>현재 등록된 리뷰가 없어요.</p>
            </div>
        </c:if>
        <c:forEach var="review" items="${reviewList}" varStatus="status">
            <div class="top_line" style="margin-top: ${status.first ? '250px' : '100px'};"></div>
            <div class="book-container">
                <div>
                    <a href="bookDetail.book?bID=${review.bID}">
                        <img class="thumbnail" src="${pageContext.request.contextPath}/images/${review.bID}/thumb.jpg" alt="Thumbnail">
                    </a>
                    <c:if test="${review.uID eq sessionScope.id}">
                        <a href="reviewDel.us?bID=${review.bID}" class="delete-btn"><span>삭제</span></a>
                    </c:if>
                </div>
                <div class="book-details">
                    <p class="title">${review.bID} <span class="score">/ 추천도 : ${review.score}</span></p>
                    <p class="author">${attachList[status.index][0]} 저</p>
                    <p class="nick">${attachList[status.index][1]}</p>
                    <p class="review">${review.review}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>
