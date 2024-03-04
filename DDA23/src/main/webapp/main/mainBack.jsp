<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      margin: 0;
      background: linear-gradient(to bottom, #2F0B3A, #3f1b80);
      background: linear-gradient(to top, #3f1b80, #2F0B3A);
    }

    .stars {
      position: absolute;
      width: 2px;
      height: 2px;
      background: #fff;
      box-shadow: 0 0 30px #fff;
      animation: twinkle 6s infinite;
    }

    @keyframes twinkle {
      0%, 100% {
        opacity: 1;
      }
      50% {
        opacity: 0;
      }
    }
  </style>
</head>
<body>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const starField = document.body;
      const numStars = 100;

      for (let i = 0; i < numStars; i++) {
        createStar();
      }

      function createStar() {
        const star = document.createElement('div');
        star.className = 'stars';
        star.style.left = Math.random() * window.innerWidth + 'px';
        star.style.top = Math.random() * window.innerHeight + 'px';
        starField.appendChild(star);
      }
    });
  </script>
</body>
</html>
