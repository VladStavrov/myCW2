


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
function favoriteChangeImage(favorite){

        var id = this.getAttribute('product-id');
        var heart = this;
    if (favorite.getAttribute('src') === './img/svg/favorite.svg') {

        favorite.setAttribute('src', './img/svg/favorite-red.svg');
    } else {
        favorite.setAttribute('src', './img/svg/favorite.svg');
    }
        // отправляем запрос на сервер
        fetch('/favorites/' + id, { method: 'POST' })
            .then(function(response) {
                // обновляем состояние сердечка на странице
                if (response.status === 200) {
                    heart.classList.add('red-heart');
                } else {
                    heart.classList.remove('red-heart');
                }
            })
            .catch(function(error) {
                console.error('Ошибка при выполнении запроса:', error);
            });
    }


    console.log("Работает")

}

function sortByAlphabet(){

    var image = document.getElementById("alphabetSortingImage");
    var array1=document.getElementsByClassName("block_house");
    var array2=document.getElementsByClassName("block_flatt")
    if (image.src.match("./img/svg/sort-alpha-asc.svg")) {
        image.src = "./img/svg/sort-alpha-desc.svg";
    } else {
        image.src = "./img/svg/sort-alpha-asc.svg";
    }

}
function sortByPrice(){

    var image = document.getElementById("priceSortingImage");
    if (image.src.match("./img/svg/sort-amount-asc.svg")) {
        image.src = "./img/svg/sort-amount-desc.svg";
    } else {
        image.src = "./img/svg/sort-amount-asc.svg";
    }

}

function checkForm(element){

    var name=element.form_name_ctlg.value;
    var phone=element.form_phone_ctlg.value;
    console.log(name + " --- "+ phone);

    let myRegex = /^\+375(29|44|33)\d{3}\d{4}$/;
    console.log("Телефон перед проверкой: " + phone);

    var fail="";
    if(phone==""||name==""){
        fail="Введите данные!";
    }

    else if(name.length<=1||name.length>=20){
        fail="Введите корректное имя";
    }
    else if (!(phone.match(myRegex))){
        fail="Введите корректный номер телефона";
    }
    console.log("Телефон после проверки: " + phone);

    if(fail!=""){
        alert(fail);
        return false;
    }

   /* var name= document.getElementById("form_name_ctlg");
   */
    console.log("Все хорошо")
    alert("Все данные корректно введены!")

    return true;

}

function scrollToBottom() {
    window.scrollTo(0, document.body.scrollHeight);
}