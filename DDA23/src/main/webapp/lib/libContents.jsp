<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="https://unpkg.com/pdfobject@2.2.12/pdfobject.js"></script>
    <title>${bID} | 따다</title>
<style>
	#box button {
        padding: 15px;
        background-color: #323639;
        left: 5px;
        color: #fff;
        border: none;
        border-radius: 50px;
        cursor: pointer;
        float: right;
    }

    #box button:hover {
        background-color: #555;
        transition: background-color 0.1s;
    }
</style>
</head>
<body>
	<div id="box" style="right: 10px; width: 150px; height: 50px; z-index: 100; background-color: #323639; position: fixed;">
		<button onclick="location.replace('bookDetail.book?bID=${bID}')">나가기</button>
	</div>
    <div id="contents" style="height: 100vh;"></div>
    <script>PDFObject.embed("${contents}/contents.pdf", "#contents");</script>
</body>
</html>