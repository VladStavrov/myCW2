function scrollToBottom() {
    window.scrollTo(0, document.body.scrollHeight);
}
window.addEventListener('scroll', function() {
    var header = document.querySelector('.header');
    var headerHeight = header.offsetHeight;
    var scrolled = window.pageYOffset || document.documentElement.scrollTop;
    var wrapper = document.querySelector('.wrapper');

    if (scrolled > headerHeight) {
        header.classList.add('black-bg');
    } else {
        header.classList.remove('black-bg');
    }
});
function favoriteChangeImage(favorite , isFavorite,token){
    var id = favorite.getAttribute('data-id');

    console.log(id);
    console.log(isFavorite);
    if(!isFavorite) {
        console.log("Зашло в Favorites");
        fetch('/favorites/' + id, {
            method: 'GET',
            headers: {
                'X-CSRF-TOKEN': token
            } })

            .then(function(response) {
                if (response.status === 200) {
                    favorite.setAttribute('src', './img/svg/favorite-red.svg');
                    location.reload();
                }
            })
            .catch(function(error) {
                console.error('Ошибка при выполнении запроса:', error);
            });
    }
    else {
        console.log("Зашло в Favorites/delete");
        fetch('/favorites/delete/' + id, {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': token
            }})

            .then(function(response) {
                if (response.status === 200) {
                    favorite.setAttribute('src', './img/svg/favorite.svg');
                    location.reload();
                }
            })
            .catch(function(error) {
                console.error('Ошибка при выполнении запроса:', error);
            });
    }




    /*if (favorite.getAttribute('src') === './img/svg/favorite.svg') {


    } else {

    }*/
    // отправляем запрос на сервер




    console.log("Работает");

}