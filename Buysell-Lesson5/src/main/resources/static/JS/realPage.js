window.addEventListener('scroll', function() {
    console.log("scroll")
    var header = document.querySelector('.header');
    var headerHeight = header.offsetHeight;
    var scrolled = window.pageYOffset || document.documentElement.scrollTop;


    if (scrolled > headerHeight) {
        header.classList.add('black-bg');
    } else {
        header.classList.remove('black-bg');
    }
});
function test(){
    console.log("test")
}
function scrollToBottom() {
    console.log("scroll")
    window.scrollTo(0, document.body.scrollHeight);
}

function favoriteChangeImage(favorite,token){
    var id = favorite.getAttribute('data-id');
    let isFavorite = true;
    fetch('/favorites2/' + id, {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': token,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ isFavorite: isFavorite })
    })
        .then(response => response.json())
        .then(data => {

                isFavorite2= Boolean(data);
                console.log("isFavorite = "+isFavorite2 + " ");
                if(isFavorite2){
                    console.log("add")
                    favorite.setAttribute('src', '/img/svg/favorite-red.svg');


                }
                else{
                    console.log("delete")
                    favorite.setAttribute('src', '/img/svg/favorite.svg');

                }
            }

        )
        .catch(error => console.error(error));
}
