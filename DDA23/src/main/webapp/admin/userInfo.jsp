<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.UserBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 정보 | 따다 관리자</title>
<style>
    #userInfo {
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
		padding: 15px;
		text-align: left;
		border-right: 1px solid #f2f2f2;
		border-bottom: 1px solid #f2f2f2;
	}

	input[type="button"] {
		background-color: #2F0B3A;
		color: #fff;
		border: none;
		padding: 8px 16px;
		cursor: pointer;
		border-radius: 5px;
		transition: background 0.3s, color 0.3s;
	}

	input[type="button"]:hover {
		background-color: #555;
	}
</style>
</head>
<body>
<section id="userInfo">
	<table class="table2">
		<tr class="tr2">
			<td colspan="2" class="td_title">회원 정보</td>
		</tr>
		<tr class="tr2">
			<td class="td2"><b>아이디</b></td>
			<td class="td2">${user.uID}</td>
		</tr>
		<tr class="tr2">
			<td class="td2"><b>이름</b></td>
			<td class="td2">${user.uName}</td>
		</tr>
		<tr class="tr2">
			<td class="td2"><b>닉네임</b></td>
			<td class="td2">${user.uNick}</td>
		</tr>
		<tr class="tr2">
			<td class="td2"><b>이메일 주소</b></td>
			<td class="td2">${user.uEmail}</td>
		</tr>
	</table>
	<br>
            <input type="button" value="리스트로 가기" onclick="location.href='userList.ad'" />
</section>
</body>
</html>
