<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${bookList != null ? "도서 목록" : "내 서재"} | 따다</title>
    <style>
        body {
            font-family: Arial;
            margin: 0;
            padding: 0;
            flex-direction: column;
        }
        
        .lib_list {
            display: flex;
            flex-wrap: wrap;
            margin-left: 200px;
            margin-right: 200px;
        }

        .book-container {
            width: calc(33.33% - 40px); 
            margin: 50px 20px;
            display: flex;
            align-items: center;
            color: #ccc;
            position: relative;
        }

        .top_line {
            width: 100%;
            height: 1px;
            background-color: #ddd;
            margin-bottom: 10px;
            position: absolute;
            top: -20px;
        }

        .thumbnail {
            width: 150px;
            height: auto;
            cursor: pointer;
        }

        .book-details {
            margin-left: 20px;
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .title {
            width: 150px;
            font-size: 20px;
            font-weight: bold;
            margin-top: 0;
            margin-bottom: 5px;
        }

        .genre {
            font-size: 12px;
            margin-top: 0;
        }

        .author {
            width: 150px;
            font-size: 12px;
            margin-top: 0;
        }

        .company {
            width: 150px;
            font-size: 12px;
            margin-top: 0;
        }

        .read-btn {
            margin-top: 20px;
            padding: 5px 20px;
            font-size: 12px;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            display: flex;
            align-items: center;
            width: fit-content;
        }
        
        .read-btn span {
            margin: 0;
        }

        .read-btn:hover {
            background-color: #555;
        }
        
            @media screen and (max-width: 1200px) {
        .book-container {
            width: calc(50% - 40px);
        }
    }

    @media screen and (max-width: 768px) {
        .book-container {
            width: calc(100% - 40px);
        }
    }
    </style>
</head>
<body>
<div class="lib_list">
    <c:forEach var="book" items="${bookList != null ? bookList : myLibrary}" varStatus="status">
        <div class="book-container" id="book-container_${book.genre}">
            <div class="top_line" id="top_line_${book.genre}"></div>
            <div>
                <a href="bookDetail.book?bID=${book.bID}">
                    <img class="thumbnail" src="${pageContext.request.contextPath}/${book.contents}/thumb.jpg" alt="Thumbnail">
                </a>
            </div>
            <div class="book-details">
                <p class="title">${book.bID}</p>
                <p><span class="genre">/ 장르 : ${book.genre}</span></p>
                <p class="author">${book.author} 저</p>
                <p class="company">${book.company}</p>
                <a href="bookDetail.book?bID=${book.bID}" class="read-btn"><span>상세 정보</span></a>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
