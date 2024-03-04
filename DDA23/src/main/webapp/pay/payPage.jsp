<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>구독 | 따다</title>
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
        }

        .td2 {
            padding: 10px;
            border: 1px dashed #ddd;
        }
        
        .td2:first-child {
            border-top: none;
        }
        
        #IDText,
        #reqDate,
        input[type="radio"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
            background-color: #f9f9f9;
            transition: background-color 0.3s;
            border: none;
            border-radius: 8px;
        }

        #IDText:checked,
        #reqDate:checked,
        input[type="radio"]:checked {
            background-color: #fff;
        }

        #payBut {
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

        #payBut:hover {
            background-color: #333;
        }

        .radio-group label {
            display: inline-block;
            margin: 10px;
            padding: 40px;
            border-radius: 10px;
            cursor: pointer;
            text-align: center;
            border: 1px dashed #ddd;
        }

        .radio-group label:last-child {
            border-right: 1px dashed #ddd;
        }
        
        .radio-group {
            padding: 10px;
            border: 1px dashed #ddd;
        }
        
        .extra-small-text {
            font-size: x-small;
        }
    </style>
    <script>
        function showAlert() { // 즉시 결제, 나중에 결제 눌렀을 때 뜨는 알림창 함수.
            var paymentMethod = document.querySelector('input[name="payWay"]:checked').value;
            var message = '';

            if (paymentMethod === '즉시결제') {
                message = '결제가 완료되었습니다.';
            } else if (paymentMethod === '나중결제') {
                message = '관리자의 결제 확인 후 결제가 완료됩니다(평균 1일 소요).';
            }

            alert(message);
        }

        window.onload = function() { // 결제일에 금일 날짜를 적용하는 함수.
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0');
            var yyyy = today.getFullYear();

            today = yyyy + '-' + mm + '-' + dd;
            document.getElementById('reqDate').value = today;

            document.getElementById('reqDate').addEventListener('keydown', function (e) {
                e.preventDefault();
            });
        };
    </script>
</head>
<body>
    <form name="payPage" action="UserPayPro.us" method="post" onsubmit="showAlert()">
        <br>
        <br>
        <table>
            <tr>
                <td colspan="2" class="td_title">구 독 권 &nbsp;&nbsp;결 제</td>
            </tr>
            <tr>
                <td class="td2"><label for="uID">사용자 ID</label></td>
                <td class="td2">
                    <%
                        String uID = (String) session.getAttribute("id");
                		Date expDate = (Date) session.getAttribute("expDate");
                    %>
                    <input type="text" id="IDText" name="uID" value="<%= uID %>" readonly>
                    <input type="hidden" name="expDate" value="<%= expDate %>">
                </td>
            </tr>
            <tr>
                <td class="td2"><label>구독권 종류</label></td>
                <td class="radio-group">
                    <label><input type="radio" name="subType" value="1" required><br>1개월 <br><span class="extra-small-text">(30일)</span><br><br><b>10,000원</b></label>
                    <label><input type="radio" name="subType" value="2" required><br>3개월 <br><span class="extra-small-text">(90일)</span><br><br><b>27,000원</b></label>
                    <label><input type="radio" name="subType" value="3" required><br>6개월 <br><span class="extra-small-text">(120일)</span><br><br><b>51,000원</b></label>
                </td>
            </tr>
            <tr>
                <td class="td2"><label for="reqDate">신청일</label></td>
                <td class="td2"><input type="text" name="reqDate" id="reqDate" readonly></td>
            </tr>
            <tr>
                <td class="td2"><label for="payWay">결제 방법</label></td>
                <td class="radio-group">
                    <label><input type="radio" name="payWay" value="즉시결제" required><br>즉시 결제<br><span class="extra-small-text">(카드 / 페이 결제)</span></label>
                    <label><input type="radio" name="payWay" value="나중결제" required><br>나중에 결제<br><span class="extra-small-text">(현금 결제)</span></label>
                </td>
            </tr>
            <tr>
                <td class="td2" colspan="2">
                    <input type="submit" id="payBut" value="결제하기" style="width: auto; margin-top: 20px; margin-bottom: 20px;">
                </td>
            </tr>
        </table>
        <br>
        <br>
    </form>
</body>
</html>
