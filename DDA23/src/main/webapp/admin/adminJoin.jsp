<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 계정 생성 | 따다 관리자</title>
<style>
	
    #joinForm {
        width: 900px;
        margin: auto;
        background-color: rgba(255, 255, 255, 0.1);
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-top: 20px;
        border-radius: 20px;
        }
	
    .table2 {
        width: 600px;
        margin-top: 20px;
        border-collapse: collapse;
        background-color: rgba(255, 255, 255, 0.5);
        border-radius: 10px;
        overflow: hidden;
        border: 1px solid #ddd;
    }
    
        .td_title {
        background-color: #f2f2f2;
        font-weight: bold;
        font-size: x-large;
        text-align: center;
        padding: 10px;
        color: #333;
    }
    
#idCheck {
    background-color: #333;
    font-size: small;
    padding: 5px 10px;
}

#idCheck:hover {
    background-color: #555;
}

	label {
    	display: block;
    	margin: 10px 0 5px;
    	font-weight: bold;
    	color: #333;
    	width: 80%;
	}

    input[type="text"],
    input[type="password"],
    input[type="date"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="button"],
    input[type="reset"] {
        background-color: #2F0B3A;
        color: #fff;
        border: none;
        padding: 8px 15px;
        cursor: pointer;
        border-radius: 5px;
        margin-right: 10px;
        transition: background 0.3s, color 0.3s;
    }
    
    .center-align {
		text-align: center;
    }

    input[type="button"]:hover,
    input[type="reset"]:hover {
        background-color: #555;
    }
    
    .tr2, .td2 {
        padding: 15px;
    }
</style>
</head>

<script>
	var chkId = false;
	var idcheck;
	function chkForm(f) {
		if (!chkId) {
			alert("아이디 중복 확인을 해 주세요.");
			return false;
		}
		f.submit();
	}

	function check_pass(f) {
		if (f.pass.value != f.passChk.value) {
			alert("비밀번호가 일치하지 않아요. 확인 후 다시 입력해주세요.");
			f.pass.value = "";
			f.passChk.value = "";
			f.pass.focus();
		}
	}
</script>

<body>
	<section id="joinForm">
    <form name="adminJoin" action="adminJoinPro.ad" method="post">
        <table class="table2" border="1">
            <tr class="tr2">
                <td class="td_title" colspan="2">관리자 계정 생성</td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="id">아이디 </label></td>
                <td class="td2">
                    <input type="text" name="id" id="id" />
                    <input type="button" name="idCheck" value="아이디 중복 확인" id="idCheck"
                        onclick="window.open('idCheck.jsp?openInit=true&colName=aID','','width=500, height=300')" />
                </td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="pass">비밀번호 </label></td>
                <td class="td2"><input type="password" name="pass" id="pass" required /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="passChk">비밀번호 확인 </label></td>
                <td class="td2"><input type="password" name="passChk" id="passChk"
                        onblur="check_pass(this.form)" required /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="name">이름 </label></td>
                <td class="td2"><input type="text" name="name" id="name" required /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="birth">생년월일 </label></td>
                <td class="td2"><input type="date" name="birth" id="birth" required /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="tel">연락처 </label></td>
                <td class="td2"><input type="text" name="tel" id="tel" required /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="email">이메일 </label></td>
                <td class="td2"><input type="text" name="email" id="email" required /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="grade">등급 </label></td>
                <td class="td2">
                    <input type="radio" name="grade" id="grade" value="2" />2등급&nbsp;&nbsp;
                    <input type="radio" name="grade" id="grade" value="3" checked />3등급
                </td>
            </tr>
        </table>
        <br>
                    <input type="button" name="#" value="계정 생성" onclick="chkForm(document.adminJoin)">&nbsp;&nbsp;
                    <input type="reset" name="reset" value="다시 작성">
    </form>
	</section>
	<br>
</body>
</html>
