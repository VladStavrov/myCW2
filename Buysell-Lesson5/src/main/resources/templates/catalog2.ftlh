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
                <#if user.email??>
                    <a href="/profile" class="header_link"  >${user.email}</a>

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
            <div class="input-panel">

                <button class="input-text" onclick="togglePanel()">Нажмите, чтобы ввести число</button>
                <div class="panel" >
                    <input type="number" id="input-number">
                    <button onclick="sendNumber()">Отправить</button>
                </div>
            </div>
            <div class="dropdown"  id = "dropdown-price" data-id="price">
                <div class="select">

                            <span class="selected">
                                Любое
                            </span>
                    <div class="caret">

                    </div>
                </div>
                <ul class="menu">
                    <li data-id="0"><input type="number" id="input-number">
                        <button onclick="sendNumber()">Отправить</button></li>
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
                <li class="filter_item" onclick="sortByPrice()">

                    <img src="./img/svg/sort-amount-asc.svg" alt="" class="img_filter" id="priceSortingImage" >
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

                                <img src="./img/house_catalog.jpg" alt="" class="image_catalog">
                                <div class="info_block_catalog">
                                    <div class="catalog_name_product">${product.title}</div>
                                    <div class="catalog_group_info_product">
                                        <div class="catalog_info_product">
                                            <div class="parametr_catalog">Тип:</div>
                                            <div class="catalog_info_text">ХАТА</div>
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

                                    <div class="catalog_price_product">
                                        <div class="label_price_catalog">Стоимость:</div>
                                        <div class="price_catalog">
                                            ${product.price}$
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
                                <#if user.email??>
                                    <#if user.favorites.products?seq_contains(product)>
                                        <img data-id="${product.id}" src="./img/svg/favorite-red.svg" class="favorite" onclick="favoriteChangeImage(this,'${_csrf.token}')" />
                                    <#else>
                                        <img data-id="${product.id}" src="./img/svg/favorite.svg" class="favorite" onclick="favoriteChangeImage(this, '${_csrf.token}')" />
                                    </#if>

                                </#if>

                            </div>
                        </div>


                    </#list>


                    <#--<div class="block_item_catalog" name="product_id" value="2">
                        <div class="line"></div>
                        <div class="block_flatt">

                            <img src="./img/flatt_catalog.jpg" alt="" class="image_catalog">
                            <div class="info_block_catalog">
                                <div class="catalog_name_product">3-х комнатная квартира с выходом в окно</div>
                                <div class="catalog_group_info_product">
                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Тип:</div>
                                        <div class="catalog_info_text">Квартира</div>
                                    </div>
                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Адрес:</div>
                                        <div class="catalog_info_text">г.Минск</div>
                                    </div>
                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Жилая площадь:</div>
                                        <div class="catalog_info_text">353м</div>
                                    </div>

                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Этаж:</div>
                                        <div class="catalog_info_text">8</div>
                                        <div class="parametr_catalog">из:</div>
                                        <div class="catalog_info_text">8</div>
                                    </div>

                                </div>

                                <div class="catalog_price_product">
                                    <div class="label_price_catalog">Стоимость:</div>
                                    <div class="price_catalog">
                                        123456$
                                    </div>
                                </div>
                                <div class="catalog_button_view_product">

                                    <button  type="submit" class="button_sign catalogView ">
                                        Посмотреть
                                    </button>
                                </div>
                            </div>
                            <img src="./img/svg/favorite.svg" alt="" class="favorite" onclick="favoriteChangeImage(this)">
                        </div>
                    </div>
                    <div class="block_item_catalog" name="product_id" value="3">
                        <div class="line"></div>
                        <div class="block_house">

                            <img src="./img/house_catalog.jpg" alt="" class="image_catalog">
                            <div class="info_block_catalog">
                                <div class="catalog_name_product">3-х этажный дом с выходом в лес</div>
                                <div class="catalog_group_info_product">
                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Тип:</div>
                                        <div class="catalog_info_text">Дом</div>
                                    </div>
                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Адрес:</div>
                                        <div class="catalog_info_text">г.Минск</div>
                                    </div>
                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Жилая площадь:</div>
                                        <div class="catalog_info_text">353м</div>
                                    </div>
                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Площадь участка:</div>
                                        <div class="catalog_info_text">353м</div>
                                    </div>
                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Этажей:</div>
                                        <div class="catalog_info_text">8</div>

                                    </div>

                                </div>

                                <div class="catalog_price_product">
                                    <div class="label_price_catalog">Стоимость:</div>
                                    <div class="price_catalog">
                                        123456$
                                    </div>
                                </div>
                                <div class="catalog_button_view_product">

                                    <button  type="submit" class="button_sign catalogView ">
                                        Посмотреть
                                    </button>
                                </div>
                            </div>
                            <img src="./img/svg/favorite.svg" alt="" class="favorite" onclick="favoriteChangeImage(this)">
                        </div>
                    </div>

                    <div class="block_item_catalog" name="product_id" value="4">
                        <div class="line"></div>
                        <div class="block_flatt">

                            <img src="./img/flatt_catalog.jpg" alt="" class="image_catalog">
                            <div class="info_block_catalog">
                                <div class="catalog_name_product">3-х комнатная квартира с выходом в окно</div>
                                <div class="catalog_group_info_product">
                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Тип:</div>
                                        <div class="catalog_info_text">Квартира</div>
                                    </div>
                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Адрес:</div>
                                        <div class="catalog_info_text">г.Минск</div>
                                    </div>
                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Жилая площадь:</div>
                                        <div class="catalog_info_text">353м</div>
                                    </div>

                                    <div class="catalog_info_product">
                                        <div class="parametr_catalog">Этаж:</div>
                                        <div class="catalog_info_text">8</div>
                                        <div class="parametr_catalog">из:</div>
                                        <div class="catalog_info_text">8</div>
                                    </div>

                                </div>

                                <div class="catalog_price_product">
                                    <div class="label_price_catalog">Стоимость:</div>
                                    <div class="price_catalog">
                                        123456$
                                    </div>
                                </div>
                                <div class="catalog_button_view_product">

                                    <button  type="submit" class="button_sign catalogView ">
                                        Посмотреть
                                    </button>
                                </div>
                            </div>
                            <img src="./img/svg/favorite.svg" alt="" class="favorite" onclick="" onclick="favoriteChangeImage(this)">
                        </div>
                    </div>-->

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
            <form action="" class="footer_form" id="footer_form_id" onsubmit=" return checkForm(this)" method="post">
                <img src="./img/svg/avatar-form.-catalogPage.svg" alt="/" class="form_img">

                <div class="input_info">
                    <div class="form_field-text">
                        Как вас зовут?
                    </div>
                    <input type="text" class="form_name" name="form_name_ctlg" id="form_name_ctlg">
                    <div class="form_field-text" >
                        Номер телефона
                    </div>
                    <input type="text" class="form_name" name="form_phone_ctlg">
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
<script>



</script>
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



</script>
</html>