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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
          crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

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
                        <a href="/mainPage" class="header_link">Главная</a>
                    </li>
                    <li class="header_item">
                        <a href="/" class="header_link">Выбрать недвижимость</a>
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


    <div class="logout-button">
        <p>Выход</p>
    </div>

    <div class="emptiness"></div>
    <div class="welcome">
        <img src="img/svg/avatar-PersonalPage.svg" alt="" class="avatarPersonalAccount">
        <div class="textAreaWelcome">
            <div class="welcomeText">Добро пожаловать, ${user.name}!</div>
            <div class="instructionWelcomeText">Вы можете добавить понравившуюся вам недвижимость в Избранное,чтобы не потерять ее!</div>

        </div>
        <#if    user.phoneNumber??>
            <form action="/logout" method="post">
                <img src="./img/svg/logout-black.svg" alt="" class="logout-img" onclick="logoutImage(this)">
                <input type="hidden" name="_csrf" value="${_csrf.token}">


            </form>
        </#if>
    </div>
   <#-- <#if user.isAdmin()>
        <form action="/order/Buying/view" method="post">
            <button class="btn btn-dark mt-3 mb-3 " style="text-align: center; width: 100%" type="submit"> Перейти на страницу Администратора</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
        </form>


        <#elseif user.isManager()>
            <form action="/admin" method="post">
                <button class="btn btn-dark mt-3 mb-3 " style="text-align: center; width: 100%" type="submit"> Перейти на страницу Менеджера</button>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
            </form>
    </#if>-->
    <#if user.isAdmin()>
        <form action="/admin" method="get">
            <button class="btn btn-dark mt-3 mb-3" style="text-align: center;background-color: darkgreen; width: 100%" type="submit">Перейти на страницу Администратора</button>

        </form>
    <#elseif user.isManager()>
        <form action="/order/Buying/view" method="get">
            <button class="btn btn-dark mt-3 mb-3" style="text-align: center;background-color: darkgreen; width: 100%" type="submit">Перейти на страницу Менеджера</button>

        </form>
    </#if>
    <div class="textFavorites"> <a class="btn btn-dark mt-3 mb-3 button_sign catalogView wrapper-MaxEdit" style="text-align: center; width: 100%; margin: 0 ; padding-top: 10px"
                                   data-toggle="collapse" href="#editUser${user.id}" role="button"
                                   aria-expanded="true" aria-controls="editUser${user.id}">
            Редактировать
        </a></div>

    <div class="container mt-4">

        <div class="collapse mb-3" id="editUser${user.id}" style="">
            <form action="/admin/edit/${user.id}" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="name">Имя</label>
                    <input type="text" value="${user.name}" required class="form-control"
                           id="name" name="name">
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Номер телефона</label>
                    <input type="text" value="${user.phoneNumber}" required class="form-control"
                           id="phoneNumber" name="phoneNumber">
                </div>
                <div class="form-group">
                    <label for="password">Пароль</label>
                    <input type="text"  class="form-control" value=""
                           id="password" name="password" placeholder="Введите новый пароль">
                </div>






                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <button type="submit" style="width: 100%" class="btn btn-dark">Сохранить</button>


            </form>

        </div>
    </div>
    <div class="textFavorites">Избранное</div>
    <selection class="catalog">

        <#if user.favorites.products?size == 0>
            <div class="centered-div">
                Нет данных для отображения
            </div>
        <#else >
            <div class="wrapper_catalog">
                <div class="full_items_catalog">

                    <#list user.favorites.products as product>
                        <div class="block_item_catalog" name="product_id" value="1" data-mainDivProduct-id="${product.id}">
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
                                <#if user.phoneNumber??>
                                    <#if user.favorites.products?seq_contains(product)>
                                        <img data-id="${product.id}" src="./img/svg/favorite-red.svg" class="favorite" onclick="favoriteChangeImage(this,  '${_csrf.token}')" />
                                    <#else>
                                        <img data-id="${product.id}" src="./img/svg/favorite.svg" class="favorite" onclick="favoriteChangeImage(this,'${_csrf.token}')" />
                                    </#if>

                                </#if>

                            </div>
                        </div>


                    </#list>




                </div>






            </div>
        </#if>
    </selection>

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

            <form action="/order/Question" class="footer_form" id="footer_form_id"  method="post">
                <img src="img/svg/avatar-form.svg" alt="/" class="form_img">

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
                <button type="button" id="submit_application" class=" button_sign" data-bs-toggle="modal" data-bs-target="#exampleFooter">
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