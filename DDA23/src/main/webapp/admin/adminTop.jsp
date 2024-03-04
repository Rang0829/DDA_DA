<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 상단바 | 따다 관리자</title>
    <style type="text/css">
        body, div, ul, li {
            margin: 0;
            padding: 0;
        }

        body {
            font-size: 12px;
            font-family: "맑은 고딕", Arial;
        }

        ul {
            list-style: none;
        }

        a {
            text-decoration: none;
        }

        .top {
            height: 36px;
            margin: auto;
            margin-top: 20px;
        }

        .top > ul {
            text-align: center;
            height: 36px;
            background: #2F0B3A;
            padding: 0;
            display: flex;
            justify-content: center;
            border-radius: 50px;
        }

        .top > ul > li {
            display: inline-block;
            width: 100px;
            height: 36px;
            margin-top: 0;
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
        }

        .top ul li a:hover {
            color: #333;
            background: #C6C6C6;            
        }

        .top ul ul {
            display: none;
        }

        .list {
            color: #fff;
        }
    </style>
</head>
<body class="body2">
    <div class="top">
        <ul>
            <li class="list"><a href="${pageContext.request.contextPath}/admin/admin.jsp">메인</a></li>
            <li class="list"><a href="${pageContext.request.contextPath}/adminJoinForm.ad">계정 생성</a></li>
            <li class="list"><a href="${pageContext.request.contextPath}/payList.ad">결제 목록</a></li>
            <li class="list"><a href="${pageContext.request.contextPath}/bookList.book">도서 관리</a></li>
            <li class="list"><a href="${pageContext.request.contextPath}/userList.ad">회원 목록</a></li>
        </ul>
    </div>
</body>
</html>
