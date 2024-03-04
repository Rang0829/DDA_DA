<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>따다 | 책의 우주 속에서 나만의 별을, 따다</title>
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #loginBox {
            display: flex;
            align-items: center;
            margin-left: auto;
            margin-right: 5vw;
            text-align: center;
        }

        #loginArea {
            background-color: #fff;
            margin-top: 30px;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 16px 3px rgba(0 0 0/ 15%);
        }

        ul {
            list-style-type: none;
            padding: 0;
            z-index: 100;
        }

        li {
            line-height: 1.4;
            text-align: justify;
        }

        input {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.8s, box-shadow 0.5s;
            background-color: #f9f9f9;
        }

        input:hover {
            border-color: #555;
            background-color: #fff;
        }

        input:focus {
            background-color: #fff;
        }

        button {
            margin: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.5s, color 0.5s;
        }

        button.login, button.register {
            width: 150px;
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

        button:hover {
            background-color: #333;
        }

        .toggleTotal {
            position: fixed;
            bottom: 20px;
            right: 20px;
            opacity: 0;
            transition: opacity 0.5s;
        }

        .toggleTotal:hover {
            opacity: 1;
        }

        .toggleSwitch {
            width: 50px;
            height: 25px;
            display: inline-block;
            position: relative;
            border-radius: 15px;
            background-color: #fff;
            box-shadow: 0 0 16px 3px rgba(0 0 0/ 15%);
            cursor: pointer;
            margin-left: 5px;
        }

        .toggleSwitch .toggleButton {
            width: 20px;
            height: 20px;
            position: absolute;
            top: 50%;
            left: 5px;
            transform: translateY(-50%);
            border-radius: 50%;
            background: #f03d3d;
        }

        #toggle:checked ~ .toggleSwitch {
            background: #f03d3d;
        }

        #toggle:checked ~ .toggleSwitch .toggleButton {
            left: calc(100% - 22px);
            background: #fff;
        }

        .toggleSwitch, .toggleButton {
            transition: all 0.2s ease-in;
        }

        #Image {
            position: fixed;
            top: 50%;
            left: 45%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        #Image img {
            width: 250px;
            height: auto;
            margin-bottom: 10px;
            margin-right: 10px;
        }

        #copyright {
            position: fixed;
            bottom: 20px;
            left: 10px;
            opacity: 1;
            transition: opacity 0.5s;
            display: flex;
            align-items: flex-start;
            flex-direction: column;
            font-size: 10px;
            color: #BDBDBD;
            margin-top: -5px;
        }
        
        @media (max-width: 768px) {
		    #Image img {
    	    width: 150px;
       		 height: auto;
       		 margin-bottom: 5px;
       		 margin-right: 5px;
   		}
        #Image {
       		 left: 22.5%;
  	  	}

    	#copyright {
    	  	  font-size: 8px;
    	}
}
    </style>
</head>
<body>
    <div id="loginBox">
        <div id="loginArea">
            <form action="loginPro.log" method="post">
                <ul>
                    <li>
                        <label for="id">ID</label><br>
                        <input type="text" name="id" id="id" placeholder="영소문자  + 숫자 조합">
                    </li>
                    <li>
                        <br>
                        <label for="pass">PassWord</label><br> 
                        <input type="password" name="pass" id="pass" placeholder="비밀번호">
                        <br>
                        <br>
                    </li>
                    <li>
                        <button type="submit" class="login">로 그 인</button>
                    </li>
                    <li>
                        <button type="button" onclick="location.href='userJoinForm.us'" class="register">회 원 가 입</button>
                    </li>
                </ul>
                <div class="toggleTotal">
                    <input type="checkbox" id="toggle" name="toggle" value="1" hidden="hidden" />
                    <label for="toggle" class="toggleSwitch">
                        <span class="toggleButton"></span>
                    </label>
                </div>
            </form>
        </div>
    </div>
    <div id="Image">
        <img src="images/dda_bantu(g).png" alt="로고">
    </div>
    <div id="copyright">copyright © 2023 DDA DA All Rights Reserved.</div>
    <jsp:include page="admin/adminMain.jsp"></jsp:include>
</body>
</html>
