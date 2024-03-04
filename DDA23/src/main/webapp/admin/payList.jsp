<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 목록 | 따다 관리자</title>
    <style>
        #listForm {
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
        	width: 700px;
            text-align: center;
            padding: 20px;
            background-color: #f5f5f5;
            border-radius: 8px;
            margin-top: 20px;
        }

        #commandList, #pagebar {
            text-align: center;
            margin-top: 20px;
        }
        
        #pagebar {
        	color: #ccc;
        	}

        .btn {
            background-color: #2F0B3A;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 10px;
            transition: background 0.3s, color 0.3s;
        }

        .btn:hover {
            background-color: #555;
        }
       
        
        .td_check {
            background: none;
            color: #2F0B3A;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 5px;
            transition: background 0.3s, color 0.3s;
        }

        .td_check:hover {
            background-color: #555;
            color: #fff;
        }
    </style>
</head>
<body>
    <section id="listForm">
        <c:choose>
            <c:when test="${checkPayList eq null}">
                <c:if test="${payList != null && payList.size() > 0}">
                    <table class="table2">
                    <tr class="tr2">
                    <td class="td_title" colspan="8">결제 목록</td>
                    </tr>
                        <tr class="tr_top">
                            <td class="td2">번호</td>
                            <td class="td2">신청 ID</td>
                            <td class="td2">이용권</td>
                            <td class="td2">신청 날짜</td>
                            <td class="td2">승인 날짜</td>
                            <td class="td2">결제 방식</td>
                            <td class="td2">결제 상태</td>
                            <td class="td2">만료 날짜</td>
                        </tr>
                        <c:forEach var="pay" items="${payList}">
                            <tr>
                                <td class="td2">${pay.idx}</td>
                                <td class="td2">${pay.uID}</td>
                                <td class="td2">${pay.subType}</td>
                                <td class="td2">${pay.reqDate}</td>
                                <td class="td2">${pay.perDate}</td>
                                <td class="td2">${pay.payWay}</td>
                                <td class="td2">${pay.payState}</td>
                                <td class="td2">${pay.expDate}</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <nav id="commandList">
                        <input type="button" class="btn" value="결제 승인 대기 목록" onclick="location.href='payStateCheck.ad'" />
                        <input type="button" class="btn" value="매출 목록" onclick="location.href='sales.ad'" />
                    </nav>
                </c:if>
                <c:if test="${payList == null && salesList == null}">
                    <section class="div_empty">
						로그가 존재하지 않습니다.
                    </section>
                    <br>
                        <input type="button" class="btn" value="뒤로 가기" onclick="history.back()" style="margin-bottom: -20px;">
                </c:if>
                <c:if test="${salesList != null}">
	            <table class="table2">
	                <tr class="tr_top">
	                    <th class="td_title" colspan="3">매출 목록</th>
	                </tr>
	                <tr class="tr_top">
	                    <th class="td2">이용권</th>
	                    <th class="td2">횟수</th>
	                    <th class="td2">합계</th>
	                </tr>
	            <c:if test="${salesList[0][0] == 1}">
	            	<tr>
	                    <td class="td2">1</td>
	                    <td class="td2">${salesList[0][1]}</td>
	                    <td class="td2">${salesList[0][1] * 10000}원</td>
	                </tr>
	                <tr>
	                    <td class="td2">2</td>
	                    <td class="td2">${salesList[1][1]}</td>
	                    <td class="td2">${salesList[1][1] * 27000}원</td>
	                </tr>
	                <tr>
	                    <td class="td2">3</td>
	                    <td class="td2">${salesList[2][1]}</td>
	                    <td class="td2">${salesList[2][1] * 51000}원</td>
	                </tr>
	                <tr class="tr_top">
			            <td class="td2">총 합계</td>                    
			            <td class="td2" colspan="2">${salesList[0][1] * 10000 + salesList[1][1] * 27000 + salesList[2][1] * 51000}원</td>
			        </tr>
	            </c:if>
	            <c:if test="${salesList[0][0] == 2}">
	            	<tr>
	                    <td class="td2">1</td>
	                    <td class="td2">0</td>
	                    <td class="td2">0원</td>
	                </tr>
	                <tr>
	                    <td class="td2">2</td>
	                    <td class="td2">${salesList[0][1]}</td>
	                    <td class="td2">${salesList[0][1] * 27000}원</td>
	                </tr>
	                <tr>
	                    <td class="td2">3</td>
	                    <td class="td2">${salesList[1][1]}</td>
	                    <td class="td2">${salesList[1][1] * 51000}원</td>
	                </tr>
	                <tr class="tr_top">
			            <td class="td2">총 합계</td>                    
			            <td class="td2" colspan="2">${salesList[0][1] * 27000 + salesList[1][1] * 51000}원</td>
			        </tr>
	            </c:if>
	            <c:if test="${salesList[0][0] == 3}">
	            	<tr>
	                    <td class="td2">1</td>
	                    <td class="td2">0</td>
	                    <td class="td2">0원</td>
	                </tr>
	                <tr>
	                    <td class="td2">2</td>
	                    <td class="td2">0</td>
	                    <td class="td2">0원</td>
	                </tr>
	                <tr>
	                    <td class="td2">3</td>
	                    <td class="td2">${salesList[0][1]}</td>
	                    <td class="td2">${salesList[0][1] * 51000}원</td>
	                </tr>
	                <tr class="tr_top">
			            <td class="td2">총 합계</td>                    
			            <td class="td2" colspan="2">${salesList[0][1] * 51000}원</td>
			        </tr>
	            </c:if>
	            </table>
	            <br>
	            <input type="button" class="btn" value="뒤로 가기" onclick="history.back()" style="margin-bottom: -20px;">
	        	</c:if>
            </c:when>
            <c:otherwise>
                <c:if test="${checkPayList != null && checkPayList.size() > 0}">
                    <table class="table2">
	                    <tr>
	                    	<td class="td_title" colspan="6">결제 확인 요청 목록</td>
	                    </tr>
                        <tr class="tr_top">
                            <td class="td2">번호</td>
                            <td class="td2">신청 ID</td>
                            <td class="td2">이용권 타입</td>
                            <td class="td2">결제 신청 날짜</td>
                            <td class="td2">결제 방식</td>
                            <td class="td2">승인 확인</td>
                        </tr>
                        <c:forEach var="pay" items="${checkPayList}">
                            <tr>
                                <td class="td2">${pay.idx}</td>
                                <td class="td2">${pay.uID}</td>
                                <td class="td2">${pay.subType}</td>
                                <td class="td2">${pay.reqDate}</td>
                                <td class="td2">${pay.payWay}</td>
                                <td class="td2">
                                    <input type="button" class="td_check" value="결제 확인" onclick="location.href='payPermission.ad?uID=${pay.uID}&subType=${pay.subType}'">
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <nav id="commandList">
                        <input type="button" class="btn" value="결제 승인 대기 목록" onclick="location.href='payStateCheck.ad'" />
                        <input type="button" class="btn" value="매출 목록" onclick="location.href=''" />
                    </nav>
                </c:if>
            </c:otherwise>
        </c:choose>
    </section>
    <br>
</body>
</html>