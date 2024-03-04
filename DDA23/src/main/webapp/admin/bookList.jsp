<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.BookBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>도서 목록 | 따다 관리자</title>
    <style>
        #bookForm {
            width: 900px;
            margin: auto;
            background-color: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 20px;
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .table2 {
           width: 700px;
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
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .tr_top {
            background-color: #333;
            color: #fff;
        }

        .div_empty {
            text-align: center;
            padding: 20px;
            background-color: #f5f5f5;
            border-radius: 8px;
            margin-top: 20px;
        }

        #commandList {
            text-align: center;
            margin-top: 20px;
        }

        input[type="button"] {
            background: none;
            color: #2F0B3A;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 5px;
            transition: background 0.3s, color 0.3s;
        }

        input[type="button"]:hover {
            background-color: #555;
            color: #fff;
        }
        
        #req {
            background-color: #2F0B3A;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 10px;
            transition: background 0.3s, color 0.3s;        
        }
        
        #req:hover {
        	background-color: #555;
        	}

        .td_edit {
            color: #4CAF50;
        }

        .td_delete {
            color: #f44336;
        }
    </style>
</head>
<script>
	function chkDel(v) {
		if(confirm("선택한 도서를 삭제하시겠습니까?")) {
			window.location.replace("bookDelPro.book?bID=" + v);
			
		}
	}
</script>
<body>
    <section id="bookForm">
            <c:choose>
                <c:when test="${bookList != null}">
                	<table class="table2">
			            <tr class="tr2">
			                <td class="td_title" colspan="7">도서 목록</td>
			            </tr>
			            <tr class="tr_top">
			                <td class="td2">썸네일</td>
			                <td class="td2">제목</td>
			                <td class="td2">저자</td>
			                <td class="td2">장르</td>
			                <td class="td2">발행처</td>
			                <td class="td2">가격</td>
			                <td class="td2">변경</td>
			            </tr>
                    <c:forEach var="book" items="${bookList}">
                        <tr>
                            <td class="td2"><img src="${pageContext.request.contextPath}/${book.contents}/thumb.jpg" width="80px"></td>
                            <td class="td2">${book.bID}</td>
                            <td class="td2">${book.author}</td>
                            <td class="td2">${book.genre}</td>
                            <td class="td2">${book.publisher}</td>
                            <td class="td2">${book.price}원</td>
                            <td class="td2">
                                <input type="button" class="td_edit" value="수정" onclick="location.href='bookModForm.book?bID=${book.bID}'">
                                <input type="button" class="td_delete" value="삭제" onclick="javascript:chkDel('${book.bID}')">
                            </td>
                        </tr>
                    </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                    <section class="div_empty">
                    도서 정보가 없어요.
                    </section>
                </c:otherwise>
            </c:choose>
        <nav id="commandList">
            <input type="button" name="req" id="req" value="등록" onclick="location.href='bookRegForm.book'">
        </nav>
    </section>
        <br>
</body>
</html>
