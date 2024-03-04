<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="static common.KeyCheck.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>따다 관리자</title>
    <style type="text/css">
        body {
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            font-size: 14px;
            font-family: "맑은 고딕", Arial;
            color: #333;
        }
        
        #table1 {
            margin: auto;
            width: 1000px;
            border: 0;
            background-color: rgba(225, 225, 225, 0.1);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        td {
            padding: 15px;
        }

        a {
            color: #fff;
            text-decoration: none;
        }

        a:hover {
            color: #ccc;
        }

        button {
            background-color: #555;
            color: #fff;
            border: none;
            padding: 5px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
            transition: background 0.5s, color 0.5s;
        }

        button:hover {
            background-color: #333;
        }

        .center-content {
            text-align: center;
        }
    </style>
</head>
<%
    request.setCharacterEncoding("UTF-8");
    if(!checkAdminLogin(request, response)) {
        return;
    }
%>
<body>
<br>
<br>
    <table id="table1">
    <tr>
        <td align="right"><br>
<c:if test="${sessionScope.id ne null }">
    <a href="${pageContext.request.contextPath}/adminInfo.ad?id=${sessionScope.id}">
        ${sessionScope.id}</a><span style="color: #ccc;">님 오늘도 파이팅</span>✨　
   
    <button type="button" onclick="location.href='${pageContext.request.contextPath}/logoutPro.log'">로그아웃</button>
</c:if>


        </td>
    </tr>
        <tr>
            <td align="center"><br>
                <jsp:include page="adminTop.jsp"></jsp:include>
            </td>
        </tr>
        <tr>
            <td align="center">
                <jsp:include page="${pagefile eq null ? '/admin/adminMain2.jsp' : pagefile }"/>
            </td>
        </tr>
    </table>
                <jsp:include page="/admin/adminMain.jsp"></jsp:include>
    <br>
    <br>
</body>
</html>