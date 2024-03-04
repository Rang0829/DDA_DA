<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <style>
        body {
            font-size: 12px;
            font-family: "맑은 고딕", Arial;
            margin: 0;
        }

        #rolling2-container {
            font-size: 12px;
            font-family: "맑은 고딕", Arial;
            margin: 0;
        }
        
.slideshow-container {
  max-height: 750px;
  position: relative;
  margin: auto;
}
.slideshow-container .mySlides img {
  width: 100%;
  height: 750px;
}

.mySlides {
  display: none;
}

.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
    </style>
    <script>
        var slideIndex = 0; //slide index

        // HTML 로드가 끝난 후 동작
        window.onload=function(){
            showSlides(slideIndex);

            // 자동 슬라이드
            var sec = 10000;
            setInterval(function(){
                slideIndex++;
                showSlides(slideIndex);

            }, sec);
        }

        // 이전, 다음 제어
        function moveSlides(n) {
            slideIndex = slideIndex + n
            showSlides(slideIndex);
        }

        function currentSlide(n) {
            slideIndex = n;
            showSlides(slideIndex);
        }

        function showSlides(n) {
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            var size = slides.length;

            if ((n+1) > size) {
                slideIndex = 0; n = 0;
            } else if (n < 0) {
                slideIndex = (size-1);
                n = (size-1);
            }

            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }

            slides[n].style.display = "block";
            dots[n].className += " active";
        }
    </script>
</head>
<body>
    <div id="rolling2-container" class="slideshow-container">
        <div class="mySlides fade">
            <div class="numbertext">1 / 6</div>
            <img src="../rolling/rolling(1).jpg" style="width:100%">
            <div class="text"></div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">2 / 6</div>
            <img src="../rolling/rolling(2).jpg" style="width:100%">
            <div class="text"></div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">3 / 6</div>
            <img src="../rolling/rolling(3).jpg" style="width:100%">
            <div class="text"></div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">4 / 6</div>
            <img src="../rolling/rolling(4).jpg" style="width:100%">
            <div class="text"></div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">5 / 6</div>
            <img src="../rolling/rolling(5).jpg" style="width:100%">
            <div class="text"></div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">6 / 6</div>
            <img src="../rolling/rolling(6).jpg" style="width:100%">
            <div class="text"></div>
        </div>

        <!-- 이전, 다음 버튼 -->
        <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
        <a class="next" onclick="moveSlides(1)">&#10095;</a>
    </div>
    <br/>

    <!-- 아래 동그라미 버튼 -->
    <div style="text-align:center">
        <span class="dot" onclick="currentSlide(0)"></span>
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
        <span class="dot" onclick="currentSlide(4)"></span>
        <span class="dot" onclick="currentSlide(5)"></span>
    </div>
</body>
</html>
