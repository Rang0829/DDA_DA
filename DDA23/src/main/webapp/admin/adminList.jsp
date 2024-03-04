<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.AdminBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	@SuppressWarnings("unchecked")
	ArrayList<AdminBean> list = (ArrayList<AdminBean>)request.getAttribute("adminList");
%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 목록 | 따다 관리자</title>
<style>
    #adminList {
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
        padding: 10px;
        text-align: center;
        color: #ccc;
    }

    #pagebar {
        color: #ccc;
    }

    #pagebar a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
<section id="adminList">
<table class="table2">
	<tr class="tr2">
		<td colspan="2" class="td_title">관리자 목록</td>
	</tr>
	<%
	if(list != null) {
		for(AdminBean admin : list) {
	%>
	<tr class="tr2">
		<td class="td2">
			<a href="adminInfo.ad?id=<%= admin.getaID() %>">
				<%= admin.getaID() %>
			</a>
		</td>
		<td class="td2">
		<%
		if(!(admin.getaGrade() == 1)) {
		%>
			<a class="a_admin" href="javascript:deleteChk('<%= admin.getaID() %>')" class="delete">
				삭제
			</a>
		<%} %>
		</td>
	</tr>
<% 
		}
	} else {
%>
<tr>
	<td colspan="2">관리자 목록이 없습니다.</td>
</tr>
<% 	} %>
</table>
<br>
<script>
    function deleteChk(id) {
        if(confirm(id + "관리자를 정말 삭제 하시겠습니까?")) {
            location.href = "adminDelete.ad?aID=" + id;
        }
    }
</script>
</section>
<br>
</body>
</html>