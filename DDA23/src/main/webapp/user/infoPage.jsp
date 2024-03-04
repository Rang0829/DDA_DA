<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <title>내 정보 | 따다</title>
    <style>
        body {
            font-family: Arial;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .table2 {
            margin: auto;
            width: 500px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 30px;
            overflow: hidden;
        }

        .td_title {
            font-weight: bold;
            font-size: large;
            text-align: center;
            background-color: #555;
            color: #fff;
            padding: 20px;
            border-bottom: 0;
        }

        .td2 {
            padding: 10px;
            border: 1px dashed #ddd;
        }

        
        .td2:last-child + .td2 {
            border-bottom: none;
        }

        #passMod {
            width: 100px;
            padding: 8px;
            margin: 0 auto 20px auto;
            display: inline-block;
            box-sizing: border-box;
            background-color: #555;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        #passMod:hover {
            background-color: #333;
        }
    </style>
<head>
</head>
<script>
    function deleteChk(v1, v2) {
        if(confirm(v2 + "님, 정말 회원 탈퇴 하시겠습니까?")) {
            location.href = "userDelete.us?uID=" + v1;
        }
    }
</script>
<body>
<form action="infoModForm.us" method="post">
<br>
<br>
<table class="table2">
    <tr>
        <td colspan="2" class="td_title">내 &nbsp;정 보</td>
    </tr>
	<tr>
		<td class="td2" style="width: 40%; padding: 20px;">아이디</td>
		<td class="td2">${user.uID}<input type="hidden" name="uID" value="${user.uID}"></td> 
	</tr>
	<tr>
		<td class="td2" style="width: 40%; padding: 20px;">이름</td>
		<td class="td2">${user.uName}<input type="hidden" name="uName" value="${user.uName}"></td>
	</tr>
	<tr>
		<td class="td2" style="width: 40%; padding: 20px;">닉네임</td>
		<td class="td2">${user.uNick}<input type="hidden" name="uNick" value="${user.uNick}"></td>
	</tr>
	<tr>
		<td class="td2" style="width: 40%; padding: 20px;">이메일</td>
		<td class="td2">${user.uEmail}<input type="hidden" name="uEmail" value="${user.uEmail}"></td>
	</tr>
	<tr>
		<td class="td2" style="widht: 40%; padding: 20px;">구독 상태</td>
		<td class="td2">활성화 여부 : ${payState} / 만료일 : ${expDate == null ? '없음' : expDate}</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" id="passMod" value="정보 변경" onclick="this.form.submit()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" id="passMod" value="계정 탈퇴" onclick="javascript:deleteChk(this.form.uID.value, this.form.uNick.value)">
		</td>
	</tr>
</table>
</form>
</body>
</html>