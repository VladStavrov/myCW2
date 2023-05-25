<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Недвижимость</title>
    <#--<#assign contextPath = request.contextPath>
    <link rel="stylesheet" href="${contextPath}/static/css/style2.css">-->

    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/style2.css">
  <#--  <link rel="stylesheet" href="./css/style2.css">-->
   <#-- <link rel="stylesheet" href="/static/css/style2.css">
    <link rel="stylesheet" href="static/css/style2.css">-->
   <script src="/JS/realPage.js"></script>

</head>

<body>
<header class=" header realEstatePage ">

    <div class="wrapper" id="header_wrapper_id">
        <div class="header_wrapper">
            <div class="header_logo">

                <a href="mainPage.html" class="header_logo-link">
                    <img src="/img/svg/logo-diamond.svg" alt="ЛОГОТИП" class="header_logo-pic">
                    ЛОГОТИП
                </a>

            </div>
            <nav class="header_nav">
                <ul class="header_list">
                    <li class="header_item">
                        <a href="/mainPage" class="header_link">Главная</a>
                    </li>
                    <li class="header_item">
                        <a onclick="/" class="header_link">Выбрать недвижимость</a>
                    </li>
                    <li class="header_item">
                        <a onclick="scrollToBottom()" class="header_link">Контакты</a>
                    </li>
                </ul>

            </nav>
            <nav class="header_sign ">
                <#if user.phoneNumber??>
                    <a href="/profile" class="header_link"  >${user.phoneNumber}</a>

                <#else>
                    <a href="/login"  class="header_link">Войти</a>

                </#if>
            </nav>
        </div>
    </div>

</header>
<main class="main">




    <div class="emptiness"></div>
    <selection class="realEstateInfo">
        <div class="info_realEstate">

            <div class="realEstate_header_info">

                <div class="realEstate_header_text">
                    <div class="nameRealEstate">${product.title}

                    </div>

                    <div class="addressRealEstate">${product.address}</div>
                </div>


                <div class="realEstateFavorite">
                    <#if user.phoneNumber??>
                        <#if user.favorites.products?seq_contains(product)>
                            <img data-id="${product.id}" src="/img/svg/favorite-red.svg" class="favorite" onclick="favoriteChangeImage(this,'${_csrf.token}')" />
                        <#else>
                            <img data-id="${product.id}" src="/img/svg/favorite.svg" class="favorite" onclick="favoriteChangeImage(this, '${_csrf.token}')" />
                        </#if>

                    </#if>


                </div>

            </div>
            <div class="realEstate_photo">
                <#--<img src="/img/svg/left-arrow.svg" alt="" class="arrow">-->
                <#if images?size == 0>
                    <img src="/img/house_catalog.jpg" class="mainPhoto"/>
                <#else>
                    <div id="carouselExample" class="carousel slide">
                        <div class="carousel-inner">
                            <#list images as img>

                                <div class="carousel-item <#if img?index==0>
                                    active
                                </#if> ">
                                    <img src="/images/${img.id}" class="d-block w-100 image_RealEstatePage" alt="...">
                                </div>
                            </#list>


                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Предыд</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">След</span>
                        </button>
                    </div>
                    <#--<#list images as img>
                        <#if img?index == 0>
                            <img src="/images/${img.id}" class="secondPhoto"/>
                        <#elseif img?index == 1>
                            <img src="/images/${img.id}" class="mainPhoto"/>
                        <#else>
                            <img src="/images/${img.id}" class="secondPhoto"/>
                        </#if>
                    </#list>-->
                </#if>
               <#-- <img src="/img/svg/right-arrow.svg" alt="" class="arrow">-->
                <#--<img src="/img/svg/left-arrow.svg" alt="" class="arrow">
                <img src="/img/house_catalog.jpg" alt="" class="secondPhoto">
               &lt;#&ndash; <img src="/images/${product.imageList.get(0)}">&ndash;&gt;
                <img src="/img/house_catalog.jpg" alt="" class="mainPhoto">
                <img src="/img/house_catalog.jpg" alt="" class="secondPhoto">
                <img src="/img/svg/right-arrow.svg" alt="" class="arrow">
-->


            </div>
            <div class="cost_RealEstate_Block">
                <div class="textCostReal_Estate">Стоимость: </div>
                <div class="cost_RealEstate">${product.price}$</div>
            </div>
            <#if user.phoneNumber??>
                <form class="addOrderBuying" action='/order/Buying/${product.id}' method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary button_sign realEsateBTN" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Оставить заявку
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class=" modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel" style="color: black">Подтверждение</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                                </div>
                                <div class="modal-body">
                                   Вы действительно хотите оставить заявку?
                                </div>
                                <div class="modal-footer">
                                    <button  type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                    <button type="submit" class="btn btn-primary">Оставить</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <#--<button  type="submit" class="button_sign realEsateBTN " >
                        Оставить заявку
                    </button>-->
                </form>

                <#else >
                    <form class="addOrderBuying" action='/login' method="get">

                        <button  type="submit" class="button_sign realEsateBTN " >
                            Оставить заявку
                        </button>
                    </form>


            </#if>

            <div class="characteristicsRealEstate">

                <div class="textCharacteristics">Характеристики</div>
                <#--<div class="catalog_info_product">
                    <div class="parametr_catalog">Тип:</div>
                    <div class="catalog_info_text">${product.type.type}</div>
                </div>-->
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
                <#--<#if product.class.simpleName=="House">
                    <div class="catalog_info_product">
                        <div class="parametr_catalog">Площадь участка:</div>
                        <div class="catalog_info_text">${product.landArea}</div>
                    </div>
                </#if>-->

                <#--<div class="catalog_info_product">
                    <div class="parametr_catalog">Этажей:</div>
                    <div class="catalog_info_text">${product.totalFloor}</div>

                </div>
                <#if product.class.simpleName=="Flatt">
                    <div class="catalog_info_product">
                        <div class="parametr_catalog">Текущий этаж:</div>
                        <div class="catalog_info_text">${product.currentFloor}</div>
                    </div>
                    <div class="catalog_info_product">
                        <div class="parametr_catalog">Комнат:</div>
                        <div class="catalog_info_text">${product.rooms}</div>
                    </div>
                </#if>-->






            </div>
            <div class="informationRealEstate">
                <div class="textCharacteristics">Информация</div>
                <div class="info_text info_RealEstate">
                    <p>${product.information}</p>



                </div>
            </div>
            <div class="block">

                <img src="/img/1-info-MainPage.jpg" alt="Третий" class="info_img">
                <div class="steps_part">
                    <h2 class="info_header">Недвижимость через неделю за 3 шага!</h2>

                    <ul class="info_indicators2">
                        <li class="item_indicators2">
                            <img src="/img/svg/1Step-RealEstatePage.svg" alt="" class="img_numbers">

                            <div class="item_indicators-text2">Выберите недвижимость!</div>
                        </li>
                        <li class="item_indicators2">
                            <img src="/img/svg/2Step-RealEstatePage.svg" alt="" class="img_numbers">
                            <div class="item_indicators-text2">Оставьте заявку!</div>
                        </li>
                        <li class="item_indicators2">
                            <img src="/img/svg/3Step-RealEstatePage.svg" alt="" class="img_numbers">
                            <div class="item_indicators-text2">Ожидайте ответа менеджера!</div>
                        </li>
                    </ul>

                </div>
            </div>
        </div>









    </selection>
</main>

<footer class="footer realEstate" >
    <div class="wrapper">
        <div class="footer_logo">

            <img src="/img/svg/logo-diamond.svg" alt="ЛОГОТИП" class="header_logo-pic">
            ЛОГОТИП



        </div>
        <div class="footer_wrapper">
            <div class="footer_text">
                Если есть вопросы, то оставьте заявку и наш менеджер вам перезвониит!
            </div>

            <form action="/order/Question" class="footer_form" id="footer_form_id"  method="post">
                <img src="/img/svg/avatar-form.svg" alt="/" class="form_img">

                <div class="input_info">
                    <div class="form_field-text">
                        Как вас зовут?
                    </div>
                    <input style="text-align: center;" type="text" class="form_name" name="userName" id="form_name_ctlg">
                    <div class="form_field-text" >
                        Номер телефона
                    </div>
                    <input style="text-align: center;" type="text" class="form_name" name="phoneNumber">
                </div>
                <button type="button" id="submit_application" class="btn btn-primary button_sign" data-bs-toggle="modal" data-bs-target="#exampleFooter">
                    Оставить заявку
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleFooter" tabindex="-1" aria-labelledby="exampleFooterLabel" aria-hidden="true">
                    <div class=" modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel" style="color: black">Подтверждение</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                            </div>
                            <div class="modal-body">
                                Вы действительно хотите оставить заявку?
                            </div>
                            <div class="modal-footer">
                                <button  type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                <button type="submit" class="btn btn-primary">Оставить</button>
                            </div>
                        </div>
                    </div>
                </div>
                <#--<button id="submit_application" type="submit" class="button_sign ">
                    Оставить заявку
                </button>-->
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
                <img src="/img/svg/instagram.svg" alt="/">
            </li>
            <li class="footer_item">
                <img src="/img/svg/Telegram.svg" alt="/">
            </li>
            <li class="footer_item">
                <img src="/img/svg/instagram.svg" alt="/">
            </li>
        </ul>
    </div>

</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

</body>
</html>