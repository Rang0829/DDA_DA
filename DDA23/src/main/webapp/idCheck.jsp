<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<%
	String openInit = "false"; // 초기값 할당.
	if (request.getParameter("openInit") != null) {
		openInit = request.getParameter("openInit"); // "true"
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            flex-wrap: wrap;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 300px;
        }

        input[type="text"] {
            width: calc(100% - 10px);
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: calc(50% - 5px);
            padding: 10px;
            box-sizing: border-box;
            background-color: #333;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }

        h5 {
            margin-top: 20px;
        }

        a {
            color: #555;
            cursor: pointer;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
            color: #333;
        }
        
</style>
<script>
	function init() {
		if (<%= openInit %>) {
			document.getElementById("id").value =
				opener.document.getElementById("id").value;
		}
	}
	
	function usdId(v){
		opener.chkId = true; // 아이디 중복 체크가 됐다.
		opener.idCheck = v;
		opener.document.getElementById("id").value = v;
		window.close();
	}
	
	function validateID() {
	    var id = document.getElementById("id").value;

	    var regex = /^(?=.*[a-z])(?=.*\d)[a-z0-9]+$/;

	    if (!regex.test(id)) {
	        alert('아이디는 영어 소문자와 숫자의 조합으로 입력할 수 있어요.');
	        return false;
	    }

        if (id.length < 6 || id.length > 12) {
            alert('아이디는 6자 이상 12자 이하로 입력해 주세요.');
            return false;
        }

        return true;
    }
</script>
</head>
<body onload="init()">
	<!--  onload는 페이지가 열릴 때 init() 함수를 호출하라. -->
	<form action="idCheck.jsp" method="post" name="f" onsubmit="return validateID()">
		<input type="text" name="id" id="id" />
		<input type="submit" value="중 복 확 인" />
		<input type="hidden" name="colName" id="colName"
		value=<%= request.getParameter("colName") %>>
	</form>
	<%
		if (request.getParameter("id") != null && !request.getParameter("id").trim().equals("")) {
		String id = request.getParameter("id");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String table = null;
		String colName = request.getParameter("colName");
		
		if(colName.equals("aID")) {
			table = "admin";
		} else {
			table = "user";
		}
		
		String sql = "SELECT * FROM " + table + " WHERE " + colName + " = ?";
		System.out.println(sql);
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mySQLDB");
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) { // 자료가 있으면 다음을 수행한다.
	%>
	<div style="margin-top: -50px;">
	<h4><%= id %>은(는) 중복된 아이디예요. 다시 입력해 주세요.
	</h4>
	</div>
	<%
		} else {
	%>
	<div style="margin-top: -50px; text-align:center;">
		<h4><%= id %>은(는) 사용 가능한 아이디예요.</h4>
		<h3><a href="#" onclick="usdId('<%= id %>')">사용할게요!</a></h3>
	</div>
	<%
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<h3>현재 오류가 발생했습니다. 잠시만 기다려주세요.</h3>");
	} finally {
		try {
			if (rs != null)
		rs.close();
			if (pstmt != null)
		pstmt.close();
			if (conn != null)
		conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
	%>
</body>
</html>