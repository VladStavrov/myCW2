<#macro template navigationManager>
    <!doctype html>
    <html lang="ru">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

        <title>Менеджер</title>
    </head>
    <body>
    <nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Непонятно что</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link active" aria-current="page" href="#">Главная</a>
                    <a class="nav-link" href="/order/Buying/view">Заявки на покупку</a>
                    <a class="nav-link" href="/order/Question/view">Заявки "Вопросы"</a>

                    <a class="nav-link" href="/manager">Работа с товарами</a>
                    <form  id="logoutForm" action="/logout" method="post">
                        <a class="nav-link " onclick="submitForm2(event)" href="#" style="color: darkred"  >Выйти</a>


                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                    </form>
                    <script>
                        function submitForm2(event) {
                            event.preventDefault();
                            document.getElementById('logoutForm').submit();
                        }
                    </script>

                </div>
            </div>
        </div>
    </nav>
    <div class="container mt-4">
        <#nested/>
    </div>


    </body>

    </html>
</#macro>