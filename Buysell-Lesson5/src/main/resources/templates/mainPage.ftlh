<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Главная страница</title>



    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/style2.css">

   <#-- <script src="./JS/catalog3.js"></script>
    <script src="/JS/catalog3.js"></script>

    <script src="JS/catalog3.js"></script>
    <script src="./JS/newFilter.js"></script>-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

</head>

<body>
<header class="header">

    <div class="wrapper">
        <div class="header_wrapper">
            <div class="header_logo">

                <a href="/mainPage" class="header_logo-link">
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
    <section class="intro">
        <div class="wrapper">
            <div class="wrapper_intro">
                <h1 class="intro_title" style="color: white">
                    Лучшие квартиры в Минске!
                </h1>
                <button id ="button_sign_mainPage" type="submit" class="button_sign" onclick="foo()">
                    Приобрейтайте сейчас
                </button>
                <p class="under_intro_text">Листайте вниз, чтобы узнать больше</p>
                <img src="img/svg/under-intro-img.svg" alt="-|-" class="under_intro_img">
            </div>
        </div>

    </section>

    <selection class="info">
        <div class="wrapper">
            <div class="block">
                <div class="info_part">
                    <h2 class="info_header">Иформация</h2>
                    <div class="info_text">
                        <p>     Наша компания является профессиональным агентст
                            вом по продаже вторичной недвижимости. Мы специ
                            ализируемся на оказании услуг по поиску, покупк
                            е и продаже квартир, домов, коммерческой недвиж
                            имости и других объектов на вторичном рынке.</p>

                        <p>Мы гордимся нашим опытом и экспертизой в области
                            вторичной недвижимости, что позволяет нам предоставлять
                            нашим клиентам лучшие услуги и максимально эффективно
                            решать их потребности.</p>

                        <p>Мы готовы работать с вами и помочь вам найти идеальный
                            дом или инвестиционный объект на вторичном рынке.
                            Свяжитесь с нами сегодня, чтобы начать!</p>


                    </div>
                    <ul class="info_indicators">
                        <li class="item_indicators">
                            <div class="numbers">20</div>
                            <div class="item_indicators-text">Риелтовро</div>
                        </li>
                        <li class="item_indicators">
                            <div class="numbers">90+</div>
                            <div class="item_indicators-text">Довольных клиентов</div>
                        </li>
                        <li class="item_indicators">
                            <div class="numbers">4</div>
                            <div class="item_indicators-text">Года на рынке</div>
                        </li>
                    </ul>

                </div>
                <img src="img/1-info-MainPage.jpg" alt="ТРетий" class="info_img">

            </div>
            <div class="block">

                <img src="img/1-info-MainPage.jpg" alt="Третий" class="info_img">
                <div class="steps_part">
                    <h2 class="info_header">Недвижимость через неделю за 3 шага!</h2>

                    <ul class="info_indicators2">
                        <li class="item_indicators2">
                            <img src="img/svg/1Step-MainPage.svg" alt="" class="img_numbers">

                            <div class="item_indicators-text2">Выберите недвижимость!</div>
                        </li>
                        <li class="item_indicators2">
                            <img src="img/svg/2Step-MainPage.svg" alt="" class="img_numbers">
                            <div class="item_indicators-text2">Оставьте заявку!</div>
                        </li>
                        <li class="item_indicators2">
                            <img src="img/svg/3Step-MainPage.svg" alt="" class="img_numbers">
                            <div class="item_indicators-text2">Ожидайте ответа менеджера!</div>
                        </li>
                    </ul>

                </div>
            </div>
        </div>


    </selection>
</main>

<footer class="footer mainPage">
    <div class="wrapper">
        <div class="footer_logo">

            <img src="img/svg/logo-diamond.svg" alt="ЛОГОТИП" class="header_logo-pic">
            ЛОГОТИП



        </div>
        <div class="footer_wrapper">
            <div class="footer_text">
                Если есть вопросы, то оставьте заявку и наш менеджер вам перезвониит!
            </div>
            <form action="/order/Question" method="post"  id="footer_form_id"class="footer_form">
                <img src="img/svg/avatar-form.svg" alt="/" class="form_img">

                <div class="input_info">
                    <div class="form_field-text">
                        Как вас зовут?
                    </div>
                    <input  style="text-align: center;" type="text" class="form_name"  name="userName" id="form_name_ctlg">
                    <div class="form_field-text">
                        Номер телефона
                    </div>
                    <input  style="text-align: center;" type="text" class="form_name" name="phoneNumber">
                </div>

                <button type="button" id="submit_application" class=" button_sign " data-bs-toggle="modal" data-bs-target="#exampleFooter">
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
<script src="../static/JS/mainPage.js">

</script>
<script>
    window.addEventListener('scroll', function() {
        var header = document.querySelector('.header');
        var headerHeight = header.offsetHeight;
        var scrolled = window.pageYOffset || document.documentElement.scrollTop;
        var wrapper = document.querySelector('.wrapper');

        if (scrolled > headerHeight) {
            header.classList.add('primary-bg');
        } else {
            header.classList.remove('primary-bg');
        }
    });

    function scrollToBottom() {
        window.scrollTo(0, document.body.scrollHeight);
    }
</script>
</body>
</html>