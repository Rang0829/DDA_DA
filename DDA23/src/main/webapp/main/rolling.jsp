<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>rolling | 따다</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<style>
    body {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        margin: 0;
    }

    .swiper-container {
    	position: relative;
        width: 95vw;
        height: 360px;
        overflow: hidden;
    }

    .swiper-slide {
        width: 230px;
        height: 360px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: transform 0.8s ease-in-out;
    }

    .swiper-slide img {
        width: 100%;
        height: 100%;
        object-fit: contain;
    }

    .swiper-button-next,
    .swiper-button-prev {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        width: 30px;
        height: 30px;
        background-color: transparent;
        border: none;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        font-size: 20px;
        color: #ccc;
        transition: background-color 0.3s;
    }

    .swiper-button-next {
        right: 10px;
    }

    .swiper-button-prev {
        left: 10px;
    }

    .swiper-button-next:hover,
    .swiper-button-prev:hover {
        color: #fff;
    }
</style>
</head>
<body>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
            	<a href="../noDataBook.book">
                <img src="../bookImg/arum.jpg" alt="Image 1">
            	</a>
            </div>
            <div class="swiper-slide">
                <a href="../noDataBook.book">
                <img src="../bookImg/eardal.jpg" alt="Image 2">
            	</a>
            </div>
            <div class="swiper-slide">
                <a href="../noDataBook.book">
                <img src="../bookImg/jelly.jpg" alt="Image 3">
				</a>
            </div>
            <div class="swiper-slide">
                <a href="../noDataBook.book">
                <img src="../bookImg/jigu.jpg" alt="Image 4">
				</a>
            </div>
            <div class="swiper-slide">
                <a href="../noDataBook.book">
                <img src="../bookImg/kirin.jpg" alt="Image 5">
				</a>
            </div>
            <div class="swiper-slide">
            	<a href="../noDataBook.book">
                <img src="../bookImg/maledo.jpg" alt="Image 6">
				</a>
            </div>
            <div class="swiper-slide">
				<a href="../noDataBook.book">
                <img src="../bookImg/mul.jpg" alt="Image 7">
				</a>
            </div>            
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var swiper = new Swiper('.swiper-container', {
                loop: true,
                slidesPerView: 4,
                spaceBetween: 100,
                autoplay: {
                    delay: 7000,
                    disableOnInteraction: false,
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                on: {
                    mouseover: function () {
                        swiper.autoplay.stop();
                    },
                    mouseout: function () {
                        swiper.autoplay.start();
                    },
                    init: function () {
                        console.log("Swiper initialized");
                    },
                },
            });

            var slides = document.querySelectorAll('.swiper-slide');

            slides.forEach(function (slide) {
                slide.addEventListener('mouseover', function () {
                    swiper.autoplay.stop();
                    slide.style.transform = 'scale(1.05)';
                });

                slide.addEventListener('mouseout', function () {
                    swiper.autoplay.start();
                    slide.style.transform = 'scale(1)';
                });
            });
        });
    </script>
</body>
</html>
