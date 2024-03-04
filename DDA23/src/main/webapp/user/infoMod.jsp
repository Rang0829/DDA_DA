<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	    <style>
	        body {
	            font-family: 'Arial';
	            margin: 0;
	            padding: 0;
	            text-align: center;
	        }
	
	        table {
	            margin: auto;
	            width: 500px;
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
	        
	        .td2:first-child,
	        .td2:first-child + .td2 {
	            border-top: none;
	        }
	        
	        label {
	            display: inline-block;
	            width: 120px;
	            padding: 10px;
	            color: #333;
	        }
	
	        #uID,
	        #uName,
	        #uNick,
	        #uEmail,
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
	
	        #uID:focus,
	        #uName:focus,
	        #uNick:focus,
	        #uEmail:focus,
	        input[type="password"]:focus {
	            background-color: #fff;
	        }
	
	        #infoBut {
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
	        }
	
	        #infoBut:hover {
	            background-color: #333;
	        }
	    </style>
	</head>
	<script>
	function check_pass(f) {
	    if (f.uPW.value != f.passChk.value) {
	        alert("비밀번호가 일치하지 않아요. 확인 후 다시 입력해주세요.");
	        f.uPW.value = "";
	        f.passChk.value = "";
	        f.uPW.focus();
	    }
	}
	</script>
	<body>
	<form name="infoMod" action="infoModPro.us" method="post">
	      <br>
	      <br>
	      <table>
	           <tr>
	               <td colspan="2" class="td_title">내 정 보&nbsp; 수 정</td>
	           </tr>
	           <tr>
	               <td class="td2"><label for="uID">아이디</label></td>
	               <td class="td2">
	                   <input type="text" name="uID" id="uID" value="${user.uID}" readonly/>
	               </td>
	           </tr>
	           <tr>
	               <td class="td2"><label for="uPW">비밀번호</label></td>
	               <td class="td2"><input type="password" name="uPW" id="uPW" placeholder="영어 소문자와 숫자 조합의 8~15자 이내" pattern="^(?=.*[a-z])(?=.*\d)[a-z\d]{8,15}$" 
               title="8~15자 이내의 영어 소문자와 숫자의 조합으로 입력이 가능해요." required/></td>
	           </tr>
	           <tr>
	               <td class="td2"><label for="passChk">비밀번호 확인</label></td>
	               <td class="td2">
	                   <input type="password" name="passChk" id="passChk" onblur="check_pass(this.form)" required/>
	               </td>
	           </tr>
	           <tr>
	               <td class="td2"><label for="uName">이름</label></td>
	               <td class="td2"><input type="text" name="uName" id="uName" value="${user.uName}" readonly/></td>
	           </tr>
	           <tr>
	               <td class="td2"><label for="uNick">닉네임</label></td>
	               <td class="td2">
	               	<input type="text" name="uNick" id="uNick" value="${user.uNick}" readonly/>
	               </td>
	           </tr>
	           <tr>
	               <td class="td2"><label for="uEmail">이메일</label></td>
	               <td class="td2"><input type="text" name="uEmail" id="uEmail" value="${user.uEmail}" required/>
	               </td>
	           </tr>
	           <tr>
	               <td class="td2" align=center colspan="2">
	                   <input type="submit" id="infoBut" name="submit" value="정보 변경" style="width: 100px;">
	                   <input type="reset" id="infoBut" name="reset" value="다시 작성" style="width: 100px;">
					<input type="button" id="infoBut" name="cansle" value="취소" onclick="location.href='personInfo.us'" style="width: 100px;">
	               </td>
	           </tr>
	       </table>
	       <br>
	       <br>
	</form>
	</body>
</html>