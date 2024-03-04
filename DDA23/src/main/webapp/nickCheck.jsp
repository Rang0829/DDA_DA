<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("UTF-8");
    String openInit = "false"; // 초기값 할당.
    if (request.getParameter("openInit") != null) {
        openInit = request.getParameter("openInit"); // "true"
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복 확인</title>
<style>
        body {
            font-family: Arial, sans-serif;
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

        h4 {
            margin-top: 20px;
            color: #333;
        }

        a {
        	text-decoration: none;
            cursor: pointer;
            color: #555;
        }

        a:hover {
            text-decoration: underline;
            color: #333;
        }
</style>
<script>
    function init() {
        if (<%=openInit%>) {
            document.getElementById("uNick").value =
                opener.document.getElementById("uNick").value;
        }
    }

    function useNick(v) {
        opener.chkNick = true; // 닉네임 중복 체크가 됐다.
        opener.nickCheck = v;
        opener.document.getElementById("uNick").value = v;
        window.close();
    }

    function validateNick() {
        var uNick = document.getElementById("uNick").value;

        var regex = /^[가-힣]+$/;

        if (!regex.test(uNick)) {
            alert('닉네임은 한글만 입력 가능해요.');
            return false;
        }

        if (uNick.length > 6) {
            alert('닉네임은 6자 이하로 입력해 주세요.');
            return false;
        }

        return true;
    }
</script>
</head>
<body onload="init()">
    <!--  onload는 페이지가 열릴 때 init() 함수를 호출하라. -->
    <form action="nickCheck.jsp" method="post" name="f" onsubmit="return validateNick()">
        <input type="text" name="uNick" id="uNick" /> <input type="submit" value="중 복 확 인" />
    </form>
    <%
        if (request.getParameter("uNick") != null && !request.getParameter("uNick").trim().equals("")) {
        String uNick = request.getParameter("uNick");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Context init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mySQLDB");
            conn = ds.getConnection();

            pstmt = conn.prepareStatement("select * from user where uNick = ?");
            pstmt.setString(1, uNick);
            rs = pstmt.executeQuery();
            
            if (rs.next()) { // 자료가 있으면 다음을 수행한다.
    %>
    <div style="margin-top: -50px;">
    <h4><%=uNick%>은(는) 중복된 닉네임이에요. 다시 입력해 주세요.
    </h4>
    </div>
   <%
        } else {
	%>
    <div style="margin-top: -50px; text-align:center;">
    <h4><%=uNick%>은(는) 사용 가능한 닉네임이에요.</h4>
    <h3><a href="#" onclick="useNick('<%=uNick%>')">사용할게요!</a></h3>
    </div>
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
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