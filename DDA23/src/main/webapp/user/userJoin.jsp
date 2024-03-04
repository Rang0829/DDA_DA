<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입 | 따다</title>
    <style>
        body {
            font-family: Arial;
            margin: 0;
            padding: 0;
        }

        #top {
            margin: auto;
            width: 1000px;
            border: 1px solid #ddd;
            text-align: center;
        }

        table {
            margin: auto;
            width: 600px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            z-index: 100;
        }

        .td_title {
            font-weight: bold;
            font-size: large;
            text-align: center;
            background-color: #555;
            color: #fff;
            padding: 15px;
            z-index: 100;
        }

        label {
            display: inline-block;
            width: 120px;
            text-align: right;
            padding: 10px;
            color: #333;
        }

        input[type="text"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 10px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            transition: background-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            background-color: #fff;
        }

        input[type="submit"],
        input[type="button"],
        input[type="reset"] {
            width: 40%;
            padding: 8px;
            margin: 10px 5%;
            box-sizing: border-box;
            background-color: #555;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
            z-index: 100;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover,
        input[type="reset"]:hover {
            background-color: #333;
            z-index: 100;
        }

        .td2 {
            border: 1px dashed #ddd;
        }

        h6 {
            color: #555;
            margin: 5px 0;
        }
    </style>
    <script>
        var chkId = false;
        var idCheck;
        var chkNick = false;
        var nickCheck;

        function validateId(id) {
            var regex = /^[a-z0-9]+$/;

            if (!regex.test(id)) {
                alert('아이디는 영어 소문자와 숫자만 입력이 가능해요.');
                return false;
            }

            if (id.length > 15 || id.length < 6) {
                alert('아이디는 6글자 이상 15글자 미만으로 입력이 가능해요.');
                return false;
            }

            return true;
        }

        function validateNick(uNick) {
            var regex = /^[가-힣]+$/;

            if (!regex.test(uNick)) {
                alert('닉네임은 올바른 한글로만 입력이 가능해요.');
                return false;
            }

            if (uNick.length > 6) {
                alert('닉네임은 6자 이하로 입력이 가능해요.');
                return false;
            }

            return true;
        }

        function chkForm(f) {
            if (!chkId || idCheck != f.uId.value.trim()) {
                alert("아이디 중복 확인을 해 주세요.");
                return false;
            }

            if (!chkNick || nickCheck != f.uNick.value.trim()) {
                alert("닉네임 중복 확인을 해 주세요.");
                return false;
            }

            f.historyback();
        }

        function check_pass(f) {
            if (f.uPW.value != f.passChk.value) {
                alert("비밀번호가 일치하지 않아요. 확인 후 다시 입력해주세요.");
                f.uPW.value = "";
                f.passChk.value = "";
                f.uPW.focus();
            }
        }
</script>
</head>
<body>
    <form name="userJoin" action="userJoinPro.us" method="post" onsubmit="chkForm(document.userJoin)">
        <br>
        <br>
        <table>
            <tr>
                <td colspan="2" class="td_title">회 원 가 입</td>
            </tr>
            <tr>
                <td class="td2"><label for="id">아이디</label></td>
                <td class="td2" align=left>
                    <input type="text" name="id" id="id" placeholder="영어 소문자와 숫자를 조합하여 6~14자 이내로 작성" onblur="return validateId(document.userJoin.id.value)" required/>
                    <input type="button" name="idCheck" value="아이디 중복 확인" id="idCheck"
                        onclick="window.open('idCheck.jsp?openInit=true&colName=uID','','width=500, height=300')"/>
                </td>
            </tr>
<tr>
    <td class="td2"><label for="uPW">비밀번호</label></td>
    <td class="td2" align="left">
        <input type="password" name="uPW" id="uPW" placeholder="영어 소문자와 숫자를 조합하여 8~15자 이내로 작성" pattern="^(?=.*[a-z])(?=.*\d)[a-z\d]{8,15}$" 
               title="8~15자 이내의 영어 소문자와 숫자의 조합으로 입력이 가능해요." required/>
    </td>
</tr>
            <tr>
                <td class="td2"><label for="passChk">비밀번호 확인</label></td>
                <td class="td2"align=left>
                    <input type="password" name="passChk" id="passChk" onblur="check_pass(this.form)" required/>
                </td>
            </tr>
<tr>
    <td class="td2"><label for="uName">이름</label></td>
    <td class="td2" align=left>
        <input type="text" name="uName" id="uName" pattern="[가-힣]{2,}" 
               title="올바른 한글로 2자 이상 입력이 가능해요." required/>
    </td>
</tr>
            <tr>
                <td class="td2"><label for="uNick">닉네임</label></td>
                <td class="td2"align=left>
                    <input type="text" name="uNick" id="uNick" placeholder="한글 6자 이내로 작성" onblur="return validateNick(document.userJoin.uNick.value)" required/>
                	<h6>　🔥 닉네임은 변경이 불가하니 신중히 선택해 주세요!</h6>
                    <input type="button" name="ninkCheck" value="닉네임 중복 확인" id="nickCheck"
                        onclick="window.open('nickCheck.jsp?openInit=true', '', 'width=500, height=300')"/>
                </td>
            </tr>
            <tr>
                <td class="td2"><label for="email">이메일</label></td>
                <td class="td2"align=left><input type="text" name="uEmail" id="uEmail" required/></td>
            </tr>
            <tr>
                <td class="td2" align=center colspan="2">
                    <input type="submit" name="submit" value="회 원 가 입" style="width: 100px; margin-top: 20px; margin-bottom: 20px;">
                    <input type="reset" name="reset" value="다 시 작 성" style="width: 100px; margin-top: 20px; margin-bottom: 20px;">
                </td>                
            </tr>
        </table>
        <br>
        <br>
    </form>
    <jsp:include page="../admin/adminMain.jsp"></jsp:include>
</body>
</html>
