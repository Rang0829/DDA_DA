<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.UserBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 목록 | 따다 관리자</title>
<style>
      #userForm {
        width: 900px;
        margin: auto;
        background-color: rgba(255, 255, 255, 0.1);
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-top: 20px;
        border-radius: 10px;
        }
        
     .table2 {
         width: 600px;
         margin-top: 20px;
         border-collapse: collapse;
         background-color: rgba(255, 255, 255, 0.5);
     	 border-radius: 20px;
         overflow: hidden;
         border: 1px solid #ddd;
         table-layout: fixed;
                 }
        
        	.td_title {
        background-color: #f2f2f2;
        font-weight: bold;
        font-size: x-large;
        text-align: center;
        padding: 10px;
        color: #333;
	}

    .td2 {
        text-align: center;
    }

    .table2 button {
        background-color: #333;
        font-size: small;
        color: #fff;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 5px;
        transition: background 0.3s, color 0.3s;

    }

    .table2 button:hover {
        background-color: #555;
    }

     #pagebar {
       	color: #ccc;
   	}
</style>
</head>
<body>
<section id="userForm">
    <table class="table2">
        <tr>
            <td class="td_title" colspan="2">회원 목록</td>
        </tr>
        <c:choose>
            <c:when test="${userList != null}">
                <c:forEach items="${userList}" var="user">
                    <tr class="tr2">
                        <td class="td2">${user.uID}</td>
                        <td class="td2">
                            <button onclick="location.href='userInfo.ad?uID=${user.uID}'">열람</button>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr class="tr2">
                    <td class="td2">회원 목록이 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
</section>
<br>
</body>
</html>
