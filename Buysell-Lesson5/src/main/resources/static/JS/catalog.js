


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
            }
        })
            .then(data)



        fetch('/favorites/' + id, {
            method: 'GET',
            headers: {
                'X-CSRF-TOKEN': token
            }
            })

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
                favorite.setAttribute('src', './img/svg/favorite-red.svg');


            }
            else{
                console.log("delete")
                favorite.setAttribute('src', './img/svg/favorite.svg');

            }
        }

        )
        .catch(error => console.error(error));
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