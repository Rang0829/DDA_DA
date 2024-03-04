const carousel = () => {
    let carouselSlider = document.querySelector('.carousel-slider');
    let list = document.querySelector('.carousel-list');
    let item = document.querySelector('.carousel-item');
    let list2;

    const speed = 1;

    const width = list.offsetWidth;
    let x = 0;
    let x2 = width;

    const clone = () => {
        list2 = list.cloneNode(true)
        carouselSlider.appendChild(list2)
        list2.style.left = `${width}px`;
    }

    const moveFirst = () => {
        x -= speed;

        if(width >= Math.abs(x)){
            list.style.left = `${x}px`
        }else{
            x = width
        }
    }

    const moveSecond = () => {
        x2 -= speed;

        if(list2.offsetWidth >= Math.abs(x2)){
            list2.style.left = `${x2}px`
        }else{
            x2 = width;
        }
    }

    const hover = () => {
        clearInterval(a);
        clearInterval(b);
    }

    const unHover = () => {
        a = setInterval(moveFirst, 10)
        b = setInterval(moveSecond, 10)
    }

    clone()

    let a = setInterval(moveFirst, 10);
    let b = setInterval(moveSecond, 10);

    carouselSlider.addEventListener('mouseenter', hover)
    carouselSlider.addEventListener('mouseleave', unHover)
}

carousel();