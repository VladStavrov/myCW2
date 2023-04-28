window.addEventListener('scroll', function() {
    var header = document.querySelector('.header');
    var headerHeight = header.offsetHeight;
    var scrolled = window.pageYOffset || document.documentElement.scrollTop;


    if (scrolled > headerHeight) {
        header.classList.add('black-bg');
    } else {
        header.classList.remove('black-bg');
    }
});
function scrollToBottom() {
    window.scrollTo(0, document.body.scrollHeight);
}