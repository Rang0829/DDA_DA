<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.AdminBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 정보 상세 | 따다 관리자</title>
<style>
    #adminInfo {
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
        border: 1px solid #fff;
        width: 50%;
    }
    
    label {
        display: block;
        margin: 10px 0 5px;
        font-weight: bold;
        color: #333;
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
<%
    String aID = (String) request.getAttribute("id");
    AdminBean adminInfo = (AdminBean) request.getAttribute("adminBean");
%>
<body>
<section id="adminInfo">
    <table class="table2">
        <tr class="tr2">
            <td colspan="2" class="td_title"><%= aID %></td>
        </tr>
        <tr class="tr2">
            <td class="td2"><label for="grade">등급</label></td>
            <td class="td2"><%= adminInfo.getaGrade() %></td>
        </tr>
        <tr class="tr2">
            <td class="td2"><label for="name">이름</label></td>
            <td class="td2"><%= adminInfo.getaName() %></td>
        </tr>
        <tr class="tr2">
            <td class="td2"><label for="birth">생년월일</label></td>
            <td class="td2"><%= adminInfo.getaBirth() %></td>
        </tr>
        <tr class="tr2">
            <td class="td2"><label for="tel">연락처</label></td>
            <td class="td2"><%= adminInfo.getaTel() %></td>
        </tr>
        <tr class="tr2">
            <td class="td2"><label for="email">이메일</label></td>
            <td class="td2"><%= adminInfo.getaEmail() %></td>
        </tr>
    </table>
    <br>
    <%
    	int aGrade = (int) session.getAttribute("aGrade");
        if(aGrade == 1) {
    %>
            <input type="button" value="관리자 목록" onclick="location.href='adminList.ad'" />
    <%
        }
    %>
</section>
<br>
</body>
</html>