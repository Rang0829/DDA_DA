<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록 | 따다 관리자</title>
<style type="text/css">
    #reqForm {
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

    #command {
        text-align: center;
        margin-top: 20px;
    }

    label {
        display: block;
        margin: 10px 0 5px;
        font-weight: bold;
        color: #333;
    }

    p {
        color: #FAF212;
        line-height: 1.5;
    }
    
    input[type="Date"],
    input[type="text"],
    input[type="number"],
    select,
    textarea,
    input[type="file"] {
        width: calc(100% - 16px);
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="button"],
    input[type="submit"],
    input[type="reset"] {
        background-color: #2F0B3A;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        padding: 8px 16px;
        transition: background 0.3s, color 0.3s;
    }

    input[type="button"]:hover,
    input[type="submit"]:hover,
    input[type="reset"]:hover {
        background-color: #555;
    }
    
</style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	
	function frmCheck() {
		var frm = document.f;
		for(var i = 0; i <= frm.elements.length - 1; i++) {
			if(frm.elements[i].name.indexOf("contents") > -1) {
				if(!frm.elements[i].value) {
					alert("업로드 할 파일을 선택하세요");
					frm.elements[i].focus();
					return false;
				}
			}
		}
	}
	
    $(document).ready(function () {
        $('#outline').on('input', function () {
            let content = $(this).val();

            // 글자수 세기
            if (content.length == 0 || content == '') {
                $('#counter').text('( 0 / 150)');
            } else {
                $('#counter').text('( ' + content.length + ' / 150)');
            }

            if (content.length > 150) {
                $(this).val(content.substring(0, 150));
                alert('줄거리는 150자까지 입력할 수 있어요.');
            }
        });
    });
</script>
</head>

<body>
<section id="regForm">
      <c:choose>
	<c:when test="${bookBean.contents == null}">
		<form name="bookReg" action="bookRegPro.book" method="post" enctype="multipart/form-data" onsubmit="return frmCheck()">
       	<table class="table2" border="1">
			<tr class="tr2">
				<th class="td_title" colspan="2">도서 등록</th>
	        </tr>    
            <tr class="tr2">
                <td colspan="2">
                    <p>
                    	* 표시 항목은 필수 입력 항목입니다.<br>
                    	썸네일은 반드시 'thumb.jpg', 컨텐츠는 'contents.pdf' 형태로 등록해주세요.
                    </p>
                </td>
            </tr>
            <tr class="tr2">
               <td class="td2"><label for="bID">* 제목</label></td>
               <td class="td2"><input type="text" name="bID" id="bID"
                   required="required" /></td>
           	</tr>

            <tr class="tr2">
                <td class="td2"><label for="author">* 저자</label></td>
                <td class="td2"><input type="text" name="author"
                    id="author" required="required" /></td>
            </tr>

            <tr class="tr2">
                <td class="td2"><label for="genre">* 장르</label></td>
                <td class="td2">
                		<select required="required" id="genre" name="genre">
                        <option value="테스트">반드시 선택하세요</option>
                        <option value="드라마">드라마</option>
                        <option value="멜로">멜로</option>
                        <option value="스릴러">스릴러</option>
                        <option value="코믹">코믹</option>
                </select></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="publisher">* 발행인</label></td>
                <td class="td2"><input type="text" name="publisher"
                    id="publisher" required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="pubDate">* 발행일</label></td>
                <td class="td2"><input type="date" name="pubDate"
                    id="pubDate" required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="page">페이지 수</label></td>
                <td class="td2"><input type="number" name="page"
                    id="page" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="company">* 출판사</label></td>
                <td class="td2"><input type="text" name="company"
                    id="company" required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="cAddr">* 출판사 주소</label></td>
                <td class="td2"><input type="text" name="cAddr"
                    id="cAddr" required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="IBSN">* IBSN</label></td>
                <td class="td2"><input type="text" name="IBSN" id="IBSN"
                    required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="price">* 정가 </label></td>
                <td class="td2"><input type="number" name="price"
                    id="price" required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="outline">* 줄거리<br></label>
                <div id="counter">( 0 / 150)</div>
                </td>
                <td class="td2"><textarea name="outline" id="outline"
                        rows="13" cols="40" wrap="soft" required="required"></textarea></td>
            </tr>
            <tr>
                <td class="td2"><label for="contents">* 컨텐츠</label>
                </td>
                <td class="td2">
                	<table id="addTable">
							<tr>
								<td><input type="file" name="contents1" id="contents1"></td>
							</tr>
					</table>
					<input name="pageCnt" id="pageCnt" type="hidden" value=1>
                </td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="image">* 썸네일</label></td>
                <td class="td2"><input type="file" name="image"
                    id="image" required="required" /></td>
            </tr>
		</table>
		<div id="command">
                <input type="submit" value="도서 등록 " />&nbsp;&nbsp;&nbsp;
                <input type="reset" value="다시 작성" />&nbsp;&nbsp;&nbsp;
                <input type="button" value="도서 목록" onClick="location.href='bookList.book'" />
       	</div>
       	</form>
	</c:when>
	<c:otherwise>
		<form name="bookMod" action="bookModPro.book?contents=${bookBean.contents}" method="post" enctype="multipart/form-data" onsubmit="return frmCheck()">
       	<table class="table2" border="1">
			<tr class="tr2">
				<th class="td_title" colspan="2">도서 수정</th>
	        </tr>    
            <tr class="tr2">
                <td colspan="2">
                    <p>* 표시 항목은 필수 입력 항목입니다.</p>
                </td>
            </tr>
            <tr class="tr2">
               <td class="td2"><label for="bID">* 제목</label></td>
               <td class="td2"><input type="text" name="bID" id="bID" value="${bookBean.bID}"
                   readonly /></td>
           	</tr>

            <tr class="tr2">
                <td class="td2"><label for="author">* 저자</label></td>
                <td class="td2"><input type="text" name="author" value="${bookBean.author}"
                    id="author" required="required" /></td>
            </tr>

            <tr class="tr2">
                <td class="td2"><label for="genre">* 장르</label></td>
                <td class="td2">
                		<select required="required" id="genre" name="genre">
                        <option value="테스트">반드시 선택하세요</option>
                        <option value="드라마">드라마</option>
                        <option value="멜로">멜로</option>
                        <option value="스릴러">스릴러</option>
                        <option value="코믹">코믹</option>
                </select></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="publisher">* 발행인</label></td>
                <td class="td2"><input type="text" name="publisher" value="${bookBean.publisher}"
                    id="publisher" required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="pubDate">* 발행일</label></td>
                <td class="td2"><input type="date" name="pubDate" value="${bookBean.pubDate}"
                    id="pubDate" required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="page">페이지 수</label></td>
                <td class="td2"><input type="number" name="page" value="${bookBean.page}"
                    id="page" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="company">* 출판사</label></td>
                <td class="td2"><input type="text" name="company" value="${bookBean.company}"
                    id="company" required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="cAddr">* 출판사 주소</label></td>
                <td class="td2"><input type="text" name="cAddr" value="${bookBean.cAddr}"
                    id="cAddr" required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="IBSN">* IBSN</label></td>
                <td class="td2"><input type="text" name="IBSN" id="IBSN" value="${bookBean.IBSN}"
                    required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="price">* 정가 </label></td>
                <td class="td2"><input type="number" name="price" value="${bookBean.price}"
                    id="price" required="required" /></td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="outline">* 줄거리<br></label>
                <div id="counter">( 0 / 150)</div></td>
                <td class="td2"><textarea name="outline" id="outline" 
                        rows="13" cols="40" wrap="soft" required="required">${bookBean.outline}</textarea></td>
            </tr>
            <tr>
                <td class="td2"><label for="contents">* 내용</label> <!-- 내용을 어떻게 넣어야 할까요. -->
                </td>
                <td class="td2">
                	<table id="addTable">
							<tr>
								<td><input type="file" name="contents1" id="contents1"></td>
							</tr>
					</table>
					<input name="pageCnt" id="pageCnt" type="hidden" value=1> 
					<input name="addButton" type="button" style="cursor:pointer" onClick="insRow()" value="입력창 추가">
                </td>
            </tr>
            <tr class="tr2">
                <td class="td2"><label for="image">* 이미지</label></td>
                <td class="td2"><input type="file" name="image"
                    id="image" required="required" /></td>
            </tr>
		</table>
		<div id="command">
                <input type="submit" value="도서 수정 " />&nbsp;&nbsp;&nbsp;
                <input type="button" value="도서 목록" onClick="location.href='bookList.book'" />
       	</div>
       	</form>
	</c:otherwise>
</c:choose>
</section>
</body>
</html>
