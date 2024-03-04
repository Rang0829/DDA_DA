<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>한줄평 등록 | 따다</title>
    <style>
        body {
            font-family: Arial;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        
        table {
            margin: auto;
            width: 700px;
            height: 800px;
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
            padding: 15px;
        }
        
        .td2 {
            padding: 10px;
            border: 1px dashed #ddd;
        }
        
        .td2:first-child {
            border-top: none;
        }

        #text,
        textarea,
        #bID,
        #uID {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            transition: background-color 0.3s;
        }

        textarea {
            resize: vertical;
        }

        #text:focus,
        textarea:focus,
        select:focus {
            background-color: #fff;
        }

        input[type="radio"] {
            margin-right: 10px;
        }

        #reviewBut {
            width: 100%;
            padding: 12px;
            box-sizing: border-box;
            background-color: #555;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        #reviewBut:hover {
            background-color: #333;
        }
        
        h4 {
            color: #555;
            margin: 0;
            margin-top: 5px;
        }

        #counter {
            color: #555;
            margin-top: 5px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#review').on('input', function () {
                let content = $(this).val();

                // 글자수 세기
                if (content.length == 0 || content == '') {
                    $('#counter').text('( 0 / 100)');
                } else {
                    $('#counter').text('( ' + content.length + ' / 100)');
                }

                if (content.length > 100) {
                    $(this).val(content.substring(0, 100));
                    alert('한줄평은 100자까지 입력할 수 있어요.');
                }
            });
        });
    </script>
</head>
<body>
    <form name="reviewReg" action="reviewReg.us" method="post">
        <br>
        <table>
            <tr>
                <td colspan="2" class="td_title">도 서 &nbsp;&nbsp;한 줄 평 &nbsp;&nbsp;작 성</td>
            </tr>
            <tr>
                <td class="td2"><label for="uNick">작성자</label></td>
                <td>
                    <%
                        String uNick = (String) session.getAttribute("uNick");
                        String uID = (String) session.getAttribute("id");
                    %>
                    <input type="text" id="text" name="uNick" value="<%= uNick %>" readonly><br>
                    <input type="hidden" id="uID" name="uID" value="<%= uID %>">
                </td>
            </tr>
            <tr>
                <td class="td2">
                    <label for="bID">도서 제목</label>
                </td>
                <td class="td2">
                    <select id="bID" name="bID" required>
                        <c:forEach var="book" items="${myLibrary}">
                            <option value="${book.bID}">${book.bID} / ${book.author} 저</option>
                        </c:forEach>
                    </select>
                    <br>
                </td>
            </tr>
            <tr>
                <td class="td2">
                    <label for="review">한줄평</label>
                </td>
                <td class="td2">
                    <textarea style="resize: none;" name="review" id="review" rows="7" cols="50" maxlength="100" placeholder="100자 이내로 작성할 수 있어요." required="required"></textarea><br>
                    <div id="counter">( 0 / 100)</div><br>
                </td>
            </tr>
            <tr>
                <td class="td2"><label for="score">추천도</label>
                </td>
                <td class="td2">
                <br>
                    <input type="radio" name="score" value="1" required> 1　　
                    <input type="radio" name="score" value="2" required> 2　　
                    <input type="radio" name="score" value="3" required> 3　　
                    <input type="radio" name="score" value="4" required> 4　　
                    <input type="radio" name="score" value="5" required> 5
                    <br>
                        <h4>⭐높은 숫자일수록 추천도가 높아요.</h4>
                </td>
            </tr>
            <tr>
                <td class="td2" align="center" colspan="2">
                    <br>
                    <input type="submit" id="reviewBut" value="한줄평 등록" style="width: 200px; margin-bottom: 20px;">
                </td>
            </tr>
        </table>
        <br>
        <br>
    </form>
</body>
</html>
