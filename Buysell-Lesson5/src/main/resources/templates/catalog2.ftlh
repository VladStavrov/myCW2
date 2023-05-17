<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
   <#-- <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">-->
    <title>Каталог</title>


    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/style2.css">

    <script src="./JS/catalog3.js"></script>
    <script src="/JS/catalog3.js"></script>

    <script src="JS/catalog3.js"></script>
    <script src="./JS/newFilter.js"></script>

</head>

<body>
<header class="header">

    <div class="wrapper" id="header_wrapper_id">
        <div class="header_wrapper">
            <div class="header_logo">

                <a href="mainPage.html" class="header_logo-link">
                    <img src="././img/svg/logo-diamond.svg" alt="ЛОГОТИП" class="header_logo-pic">
                    ЛОГОТИП
                </a>

            </div>
            <nav class="header_nav">
                <ul class="header_list">
                    <li class="header_item">
                        <a href="mainPage.html" class="header_link">Главная</a>
                    </li>
                    <li class="header_item">
                        <a onclick="foooo()" class="header_link">Выбрать недвижимость</a>
                    </li>
                    <li class="header_item">
                        <a  class="header_link" onclick="scrollToBottom()">Контакты</a>
                    </li>
                </ul>

            </nav>
            <nav class="header_sign ">
                <#if user.phoneNumber??>
                    <a href="/profile" class="header_link"  >${user.phoneNumber}</a>


                    <#else>
                         <a href="/login"  class="header_link">Войти</a>
                       <#-- <form action="/login">

                           &lt;#&ndash; <input type="hidden" name="_csrf" value="${_csrf.token}">&ndash;&gt;
                            <input type="submit" value="Войти  "/>
                        </form>-->
                       <#-- <a  href="/login" class="header_link">Войти</a>-->
                       <#-- <input type="hidden" name="_csrf" value="${_csrf.token}">-->
                </#if>

            </nav>
        </div>
    </div>


</header>
<main class="main">
    <section class="intro intro_catalog">
        <div class="wrapper">
            <div class="wrapper_intro" >
                <h1 class="intro_title">
                    Лучшие квартиры в Минске!
                </h1>'
                <button type="submit" class="button_sign catalog_sign_Button">
                    Войти бесплатно
                </button>
                <p class="under_intro_text">Листайте вниз, чтобы узнать больше</p>
                <img src="./img/svg/under-intro-img.svg" alt="-|-" class="under_intro_img">
            </div>
        </div>

    </section>
    <selection>
        <div class="wrapper_filter">

           <#-- <div class="select">
                <div class="select_header">
                    <span class="select_current">Value 1</span>
                    <div class="select_icon">&times;</div>
                </div>

                <div class="select_body">
                    <div class="select_item">Value 1</div>
                    <div class="select_item">Value 2</div>
                    <div class="select_item">Value 3</div>
                    <div class="select_item">Value 4</div>
                    <div class="select_item">Value 5</div>
                </div>
            </div>-->
            <div class="dropdown" data-id="rooms">
                <div class="select">

                            <span class="selected">
                                Любое
                            </span>
                    <div class="caret">

                    </div>
                </div>
                <ul class="menu">
                    <li data-id="0">Любое</li>
                    <li data-id="1" >1 комната</li>
                    <li data-id="2">2 комнаты</li>
                    <li data-id="3">3 комнаты</li>
                    <li data-id="4"></li>
                </ul>

            </div>
            <#--<div >
                <div> <a  class="filter_link" onclick="linkPrice()">Филтр</a></div>

                <div class="content-block" id="test-content">
                    <p>Это контент, который будет появляться при нажатии на ссылку.</p>
                </div>
            </div>-->
            <#--<div class="custom-dropdown">
                <button class="custom-dropdown__button">Выберите опцию</button>
                <ul class="custom-dropdown__menu">
                    <li class="custom-dropdown__menu-item">
                        <div class="text">
                            Введем тест:
                            <input type="text" class="form_name" name="form_phone_ctlg">
                        </div>
                    </li>
                    <li class="custom-dropdown__menu-item">Опция 2</li>
                    <li class="custom-dropdown__menu-item">Опция 3</li>
                </ul>
            </div>-->
            <#--<div class="input-panel">

                <button class="input-text" onclick="togglePanel()">Нажмите, чтобы ввести число</button>
                <div class="panel" >
                    <input type="number" id="input-number">
                    <button onclick="sendNumber()">Отправить</button>
                </div>
            </div>-->
            <div class="dropdown"  id = "dropdown-price" data-id="price">
                <div class="select">

                            <span class="selected">
                                Любое
                            </span>
                    <div class="caret">

                    </div>
                </div>
                <ul class="menu">
                    <li data-id="0">
                        <a href="#" filter_link >Цена от</a>
                        <input type="number" id="input-price-min">
                        <a href="#" filter_link >Цена до</a>
                        <input type="number" id="input-price-max">
                        <button id="btn-input-price">Отправить</button>
                    </li>

                </ul>
            </div>
            <ul class="filter_list">
                <li class="filter_item">




                    <#--<a  class="filter_link" onclick="openTab(event,'tab1')">Фильтры</a>
                    <div id="tab1" class="tabcontent">
                            Пример фильтра
                        <div class="tabcontent">
                            1 Фильтр
                        </div>
                        <div class="dropdown-menu">
                            2 Фильтр
                        </div>
                        <div class="dropdown-menu">
                            3 Фильтр
                        </div>
                    </div>-->


                </li>
                <li class="filter_item" id="sort-price-item" >

                    <img src="./img/svg/no-sort-amount.svg" alt="" class="img_filter" id="priceSortingImage" >
                    <a  class="filter_link">По цене</a>
                </li>
                <li class="filter_item" onclick="sortByAlphabet()">
                    <img src="./img/svg/sort-alpha-asc.svg" alt="" class="img_filter" id="alphabetSortingImage">
                    <a  class="filter_link">По алфавиту</a>
                </li>
            </ul>




        </div>

    </selection>
    <nav class="header_nav">


    </nav>
    <selection class="catalog">
        <div class="wrapper">
            <div class="wrapper_catalog">
                <div class="full_items_catalog">
                    <#list products as product>
                        <div class="block_item_catalog" name="product_id" value="1" >
                            <div class="line"></div>
                            <div class="block_house">

                                <img src="/images/${product.previewImageId}" alt="" class="image_catalog">
                                <div class="info_block_catalog">
                                    <div class="catalog_name_product">${product.title}</div>
                                    <div class="catalog_group_info_product">
                                        <div class="catalog_info_product">
                                            <div class="parametr_catalog">Тип:</div>
                                            <div class="catalog_info_text">${product.getType().typeName}</div>
                                        </div>
                                        <div class="catalog_info_product">
                                            <div class="parametr_catalog">Адрес:</div>
                                            <div class="catalog_info_text">${product.address}</div>
                                        </div>
                                        <div class="catalog_info_product">
                                            <div class="parametr_catalog">Жилая площадь:</div>
                                            <div class="catalog_info_text">${product.livingArea}</div>
                                        </div>
                                        <div class="catalog_info_product rooms">
                                            <div class="parametr_catalog">Комнат:</div>
                                            <div class="catalog_info_text">${product.rooms}</div>
                                        </div>

                                        <#--<div class="catalog_info_product">
                                            <div class="parametr_catalog">Этажей:</div>
                                            <div class="catalog_info_text">${product.totalFloor}</div>

                                        </div>-->
                                        <#--<#if product.class.simpleName=="Flatt">
                                            <div class="catalog_info_product">
                                                <div class="parametr_catalog">Комнат:</div>
                                                <div class="catalog_info_text">${product.rooms}</div>
                                            </div>
                                        </#if>-->

                                    </div>

                                    <div class="catalog_price_product ">
                                        <div class="label_price_catalog">Стоимость:</div>
                                        <div class="price_catalog">
                                            <div class="priceValue">${product.price}</div>
                                            <div class="money">$</div>

                                        </div>
                                    </div>
                                    <div class="catalog_button_view_product">

                                        <button  type="submit" data-id="1231" class="button_sign catalogView " onclick="window.location.href='/product/${product.id}'"  >
                                            Посмотреть
                                        </button>
                                    </div>
                                </div>
                                <#--<#if user.email??>
                                    <#if  (user.favorites.products?seq_contains(product))>
                                        <img data-id= ${product.id} src="./img/svg/favorite-red.svg"  class="favorite" &lt;#&ndash;onclick="favoriteChangeImage(this)"&ndash;&gt; &lt;#&ndash;onclick="window.location.href='/favorites/${product.id}'"&ndash;&gt;

                                             onclick="favoriteChangeImage(this, ${(user.favorites.products?seq_contains(product))?c },'${_csrf.token}')">
                                        <#else >
                                            <img data-id= ${product.id} src="./img/svg/favorite.svg"  class="favorite" &lt;#&ndash;onclick="favoriteChangeImage(this)"&ndash;&gt; &lt;#&ndash;onclick="window.location.href='/favorites/${product.id}'"&ndash;&gt;
                                                 onclick="favoriteChangeImage(this, ${(user.favorites.products?seq_contains(product))?c },'${_csrf.token}')">

                                    </#if>
                                </#if>-->
                                <#if user.phoneNumber??>
                                    <#if user.favorites.products?seq_contains(product)>
                                        <img data-id="${product.id}" src="./img/svg/favorite-red.svg" class="favorite" onclick="favoriteChangeImage(this,'${_csrf.token}')" />
                                    <#else>
                                        <img data-id="${product.id}" src="./img/svg/favorite.svg" class="favorite" onclick="favoriteChangeImage(this, '${_csrf.token}')" />
                                    </#if>

                                </#if>

                            </div>
                        </div>


                    </#list>




                </div>





               <!-- <div class="line"></div>
                <button  type="submit" class="button_sign catalogViewMore  " style="align-self: center">
                    Загрузить ещё
                </button>-->

            </div>


            </div>








    </selection>
</main>

<footer class="footer catalog" >
    <div class="wrapper">
        <div class="footer_logo">

            <img src="./img/svg/logo-diamond.svg" alt="ЛОГОТИП" class="header_logo-pic">
            ЛОГОТИП



        </div>
        <div class="footer_wrapper">
            <div class="footer_text">
                Если есть вопросы, то оставьте заявку и наш менеджер вам перезвониит!
            </div>
            <form action="/order/Question" method="post" class="footer_form" id="footer_form_id" >
                <img src="./img/svg/avatar-form.-catalogPage.svg" alt="/" class="form_img">

                <div class="input_info">
                    <div class="form_field-text">
                        Как вас зовут?
                    </div>
                    <input type="text" class="form_name" name="userName" id="form_name_ctlg">
                    <div class="form_field-text" >
                        Номер телефона
                    </div>
                    <input type="text" class="form_name" name="phoneNumber">

                </div>

                <button id="submit_application" type="submit" class="button_sign catalogBTN">
                    Оставить заявку
                </button>
            </form>

        </div>



    </div>
    <div class="footer_wrapper_links">

            <ul class="footer_links">
                <li class="footer_item">
                    <div class="footer_category">Телефон</div>
                    <a href="/" class="footer_link">375(44)553-65-21</a>
                </li>
                <li class="footer_item">
                    <div class="footer_category">Почта</div>
                    <a href="/" class="footer_link">label@mail.ru</a>
                </li>
                <li class="footer_item">
                    <div class="footer_category">Адресс</div>
                    <a href="/" class="footer_link">г. Минск ул. Л.Беды 4</a>
                </li>
                <li class="footer_item">
                    <img src="./img/svg/instagram.svg" alt="/">
                </li>
                <li class="footer_item">
                    <img src="./img/svg/Telegram.svg" alt="/">
                </li>
                <li class="footer_item">
                    <img src="./img/svg/instagram.svg" alt="/">
                </li>
            </ul>



    </div>

</footer>

</body>

<#--<script>

    var dropdownButton = document.querySelector('.custom-dropdown__button');
    var dropdownMenu = document.querySelector('.custom-dropdown__menu');

    function toggleDropdown() {
        dropdownMenu.classList.toggle('show');
    }

    dropdownButton.addEventListener('click', toggleDropdown);

    window.addEventListener('click', function(event) {
        if (!event.target.matches('.custom-dropdown__button')) {
            if (dropdownMenu.classList.contains('show')) {
                dropdownMenu.classList.remove('show');
            }
        }
    });

</script>-->
<script>
    // Получаем ссылки на элементы
    /*function sortByPrice(){

        var image = document.getElementById("priceSortingImage");
        if (image.src.match("./img/svg/sort-amount-asc.svg")) {
            image.src = "./img/svg/sort-amount-desc.svg";
        } else {
            image.src = "./img/svg/sort-amount-asc.svg";
        }

    }*/


    const sortButton = document.getElementById('sort-price-item');

    // Привязываем обработчик событий на кнопку сортировки
    sortButton.addEventListener('click',()=>{
        var image = document.getElementById("priceSortingImage");

        if (image.src.match("./img/svg/sort-amount-asc.svg")) {
            lowSort=true;
            higthSort=false;
            nextImageSort= "./img/svg/sort-amount-desc.svg";
        } else if(image.src.match("./img/svg/sort-amount-desc.svg")) {
            lowSort=false;
            higthSort=false;
            nextImageSort = "./img/svg/no-sort-amount.svg";
        }
        else{
            lowSort=false;
            higthSort=true;
            nextImageSort= "./img/svg/sort-amount-asc.svg";
        }
        filteredAll();
    });

    // Функция для сравнения элементов по цене
    function comparePrices(a, b) {
        const aPrice = parseInt(a.getAttribute('data-price'));
        const bPrice = parseInt(b.getAttribute('data-price'));
        return aPrice - bPrice;
    }

    // Функция для сортировки элементов и добавления их на страницу


    /*---------------------------------*/
    let nextImageSort= "./img/svg/no-sort-amount.svg";;
    let lowSort=false;
    let higthSort=false;
    let typeHouse="";


    let roomsFilter='-4';
    let price=23;
    let minPrice=0;
    let maxPrice=0;
    let filterPrice=false;
    let filterRooms=false;
    function foooo(){
        console.log("qwerty + "+roomsFilter);
    }

    const catalogItems = document.querySelectorAll('.block_item_catalog');
    let filteredItems=catalogItems;

    const dropdowns=document.querySelectorAll('.dropdown')
    dropdowns.forEach(dropdown=>{
        const select1=dropdown.querySelector('.select');
        const caret=dropdown.querySelector('.caret');
        const menu=dropdown.querySelector('.menu');
        const dropdownId=dropdown.dataset.id;

        document.addEventListener('click', function(event) {
            const isClickInsideMenu = menu.contains(event.target) || select1.contains(event.target);
            if (!isClickInsideMenu) {

                select1.classList.remove('select-clicked');
                caret.classList.remove('caret-rotate');
                menu.classList.remove('menu-open');
            }
        });
        console.log(dropdownId+ " = dropdownId");
        if(dropdownId==='rooms'){

            const options=dropdown.querySelectorAll('.menu li');
            const selected=dropdown.querySelector('.selected');

            select1.addEventListener('click',()=>{
                select1.classList.toggle('select-clicked');
                caret.classList.toggle('caret-rotate');
                menu.classList.toggle('menu-open');

            });
            options.forEach((option,index)=>{
                option.addEventListener('click',event =>{
                    if(dropdownId==='rooms'){
                        roomsFilter = event.target.dataset.id;
                        selected.innerText=option.innerText;
                    }
                    else {
                        return;
                    }
                    console.log(index+" = "+roomsFilter+  " = "+ catalogItems.length);
                    filterRooms=true;
                    filteredAll();

                    Array.from(catalogItems).forEach((item) => item.style.display = 'none');
                    filteredItems.forEach((item) => item.style.display = 'block');

                    select1.classList.remove('select-clicked')
                    caret.classList.remove('caret-rotate');
                    menu.classList.remove('menu-open');
                    options.forEach(option=>{
                        option.classList.remove('active')

                    })
                    option.classList.add('active')
                    if(option.innerText)
                        console.log("Херово")
                    console.log(`Selected value: `+ option.innerText);
                });
            })
        }
        else if (dropdownId==='price'){

            const option=dropdown.querySelector('.menu li');
            const selected=dropdown.querySelector('.selected');

            const btnInputPrice=document.getElementById("btn-input-price");
            select1.addEventListener('click',()=>{
                select1.classList.toggle('select-clicked');
                caret.classList.toggle('caret-rotate');
                menu.classList.toggle('menu-open');

            });

            btnInputPrice.addEventListener('click',event =>{
                var inputMin = document.getElementById("input-price-min");
                var inputMax = document.getElementById("input-price-max");
                if(inputMin.value===""){
                    minPrice=0;

                }
                else{
                    minPrice=inputMin.value;
                }

                if(inputMax.value===""){
                    maxPrice=999999999;
                }
                else{
                    maxPrice=inputMax.value;
                }


                console.log("min price = "+ minPrice+ "max price =  "+maxPrice); // Выводим в консоль полученное число

                /* maxPrice.value = "";
                 minPrice.value = "";*/
                filterPrice=true;
                filteredAll();
                Array.from(catalogItems).forEach((item) => item.style.display = 'none');
                filteredItems.forEach((item) => item.style.display = 'block');

                select1.classList.remove('select-clicked')
                caret.classList.remove('caret-rotate');
                menu.classList.remove('menu-open');

                option.classList.remove('active')

                option.classList.add('active')

            });



        }
        else{

        }



    })



    function filteredAll(){
        filteredItems=Array.from(catalogItems);
        if(filterRooms){
            filteredItems = filteredItems.filter((item) => {
                const rooms = item.querySelector('.catalog_info_product.rooms .catalog_info_text').textContent;

                if(roomsFilter!='0') {
                    filterRooms=true;
                    return rooms === roomsFilter;
                }
                else {
                    filterRooms=false;
                    return rooms;
                }
            });
        }
        if(filterPrice){

            filteredItems =filteredItems.filter((item) => {

                const priceDiv = parseInt((item.querySelector('.catalog_price_product .price_catalog').textContent).replace(/\s+/g, ''));
                if(priceDiv<=maxPrice&&priceDiv>=minPrice){
                    return true;
                }
                else {
                    return false;
                }

            });
        }
        var image = document.getElementById("priceSortingImage");
        if(lowSort){



            image.src =nextImageSort;

            filteredItems=filteredItems.sort((a, b) => {
                const priceA =  parseInt(a.querySelector('.catalog_price_product .price_catalog').textContent.replace(/\s+/g, ''));
                const priceB =  parseInt(b.querySelector('.catalog_price_product .price_catalog').textContent.replace(/\s+/g, ''));
                if (priceA > priceB) {
                    return -1;
                } else if (priceA < priceB) {
                    return 1;
                } else {
                    return 0;
                }
            });
        }
        else if(higthSort){



            image.src = nextImageSort;
            filteredItems=filteredItems.sort((a, b) => {
                const priceA =  parseInt(a.querySelector('.catalog_price_product .price_catalog').textContent.replace(/\s+/g, ''));
                const priceB =  parseInt(b.querySelector('.catalog_price_product .price_catalog').textContent.replace(/\s+/g, ''));
                if (priceA > priceB) {
                    return 1;
                } else if (priceA < priceB) {
                    return -1;
                } else {
                    return 0;
                }
            });

        }
        else{
            image.src = nextImageSort;
        }
        const container = document.querySelector('.full_items_catalog');
        container.innerHTML = '';
        filteredItems.forEach(item => container.appendChild(item));

    }


</script>
</html>