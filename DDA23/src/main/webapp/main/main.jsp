<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="static common.KeyCheck.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>따다 | 책의 우주 속에서 나만의 별을, 따다</title>
    <style type="text/css">
        html, body {
        	margin: 0;
        	padding: 0;
        	width: 100%;
        }
        body {
            font-size: 12px;
            font-family: "맑은 고딕", Arial;
            flex-wrap: wrap;
        }

        #userTop {
            position: fixed;
            top: 0;
            width: 100vw;
            z-index: 1000;
        }
        
       #rolling2-container {
            font-size: 12px;
            font-family: "맑은 고딕", Arial;
            margin: 0;
        }

        #table1 {
            margin: 0;
            padding: 0;
            width: 100vw;
            border-collapse: collapse;
            border: none;
            margin-top: 130px;
            z-index: 100;
        }

        td {
            padding-top: 30px;
        }

        #welcome {
            text-align: center;
        }
        
        #contents {
        	position: relative;
        	margin-top: 200px;
        	width: 100%;
        	z-index: 100;
        }
        
        footer {
        	clear: both;
        	width: 100vw;
        }
        #bgEff {
         z-index: -50;
        }
        #noDataHR {
        	font-size: 22px;
            font-family: "맑은 고딕", Arial;
            color: #FFF;
            text-align: center;
        }
    </style>
</head>
<%
    request.setCharacterEncoding("UTF-8");
    if(!checkUserLogin(request, response)) {
        return;
    }
%>
<body>
    <div id="userTop">
        <jsp:include page="userTop.jsp"></jsp:include>
    </div>
    <c:choose>
    	<c:when test="${pagefile eq null}">
    		<table id="table1">
		        <tr>
		            <td>
		                <div id="welcome">
		                    <jsp:include page="userMain.jsp"></jsp:include>
		                </div>
		            </td>
		        </tr>
		        <tr>
					<td>
					    <div id="rolling2-container">
					        <jsp:include page="rolling2.jsp"></jsp:include>
					    </div>
					</td>
		        </tr>
		        <tr>
		            <td>
		            	<h3 id="noDataHR">- Coming Soon -</h3>
		                <jsp:include page="rolling.jsp"></jsp:include>
		            </td>
		        </tr>
		    </table>
    	</c:when>
    	<c:otherwise>
    		<div id="contents">
    			<jsp:include page="${pagefile}"></jsp:include>
    		</div>
    	</c:otherwise>
    </c:choose>
    <br>
    <br>
    <br>
    <footer>
    	<jsp:include page="/main/footer.jsp"></jsp:include>
    </footer>
    <div id="bgEff">
    <jsp:include page="/main/mainBack.jsp"></jsp:include>
    </div>
</body>
</html>
