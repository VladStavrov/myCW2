<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Личный кабинет</title>


    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/style2.css">


    <script src="./JS/personalAccountPage2.js"></script>
</head>

<body>
<header class=" header realEstatePage ">

    <div class="wrapper" id="header_wrapper_id">
        <div class="header_wrapper">
            <div class="header_logo">

                <a href="mainPage.html" class="header_logo-link">
                    <img src="img/svg/logo-diamond.svg" alt="ЛОГОТИП" class="header_logo-pic">
                    ЛОГОТИП
                </a>

            </div>
            <nav class="header_nav">
                <ul class="header_list">
                    <li class="header_item">
                        <a href="mainPage.html" class="header_link">Главная</a>
                    </li>
                    <li class="header_item">
                        <a href="catalog.html" class="header_link">Выбрать недвижимость</a>
                    </li>
                    <li class="header_item">
                        <a onclick="scrollToBottom()" class="header_link">Контакты</a>
                    </li>
                </ul>

            </nav>
            <nav class="header_sign ">
                <#if user.email??>
                    <a href="/profile" class="header_link"  >${user.email}</a>

                <#else>
                    <a href="/login"  class="header_link">Войти</a>

                </#if>
            </nav>
        </div>
    </div>

</header>
<main class="main">




    <div class="emptiness"></div>
    <div class="welcome">
        <img src="img/svg/avatar-PersonalPage.svg" alt="" class="avatarPersonalAccount">
        <div class="textAreaWelcome">
            <div class="welcomeText">Добро пожаловать, ${user.name}!</div>
            <div class="instructionWelcomeText">Вы можете добавить понравившуюся вам недвижимость в Избранное,чтобы не потерять ее!</div>

        </div>
    </div>

    <div class="textFavorites">Избранное</div>
    <div class="wrapper_catalog">
        <div class="full_items_catalog">

            <#list user.favorites.products as product>
                <div class="block_item_catalog" name="product_id" value="1" data-mainDivProduct-id="${product.id}">
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

                                <button  type="submit" class="button_sign catalogView " onclick="window.location.href='/product/${product.id}'"  >
                                    Посмотреть
                                </button>
                            </div>
                        </div>
                        <#if user.email??>
                            <#if user.favorites.products?seq_contains(product)>
                                <img data-id="${product.id}" src="./img/svg/favorite-red.svg" class="favorite" onclick="favoriteChangeImage(this,  '${_csrf.token}')" />
                            <#else>
                                <img data-id="${product.id}" src="./img/svg/favorite.svg" class="favorite" onclick="favoriteChangeImage(this,'${_csrf.token}')" />
                            </#if>

                        </#if>

                    </div>
                </div>


            </#list>


            <div class="block_item_catalog">
                <div class="line"></div>
                <div class="block_flatt">

                    <img src="img/flatt_catalog.jpg" alt="" class="image_catalog">
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
                    <img src="img/svg/favorite.svg" alt="" class="favorite">
                </div>
            </div>

        </div>






    </div>
</main>

<footer class="footer realEstate" >
    <div class="wrapper">
        <div class="footer_logo">

            <img src="img/svg/logo-diamond.svg" alt="ЛОГОТИП" class="header_logo-pic">
            ЛОГОТИП



        </div>
        <div class="footer_wrapper">
            <div class="footer_text">
                Если есть вопросы, то оставьте заявку и наш менеджер вам перезвониит!
            </div>
            <form action="" class="footer_form" id="footer_form_id" onsubmit=" return checkForm(this)" method="post">
                <img src="img/svg/avatar-form.svg" alt="/" class="form_img">

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
                <button id="submit_application" type="submit" class="button_sign ">
                    Оставить заявку
                </button>
            </form>

        </div>



    </div>
    <div class="footer_wrapper_links">
        <ul class="footer_links">
            <li class="footer_item">
                <div class="footer_category">Телефон</div>
                <a href="/static" class="footer_link">375(44)553-65-21</a>
            </li>
            <li class="footer_item">
                <div class="footer_category">Почта</div>
                <a href="/static" class="footer_link">label@mail.ru</a>
            </li>
            <li class="footer_item">
                <div class="footer_category">Адресс</div>
                <a href="/static" class="footer_link">г. Минск ул. Л.Беды 4</a>
            </li>
            <li class="footer_item">
                <img src="img/svg/instagram.svg" alt="/">
            </li>
            <li class="footer_item">
                <img src="img/svg/Telegram.svg" alt="/">
            </li>
            <li class="footer_item">
                <img src="img/svg/instagram.svg" alt="/">
            </li>
        </ul>
    </div>

</footer>

</body>
</html>