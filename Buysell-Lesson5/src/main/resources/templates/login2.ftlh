<!DOCTYPE html>
<html>
<head>
    <title>BUYSELL</title>
    <link rel="stylesheet" href="./css/login.css">

    <script src="./JS/login.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

<div class="login-page">

    <div class="form">

        <form class="login-form" action="/login" method="post">
            <#if   errorMessage??>

                <span class="container info fa" style=" color: #EF3B3A;">${errorMessage}</span>
                <h1> </h1>
            </#if>
            <#--<input type="text" name="phoneNumber" placeholder="Номер телефона"/>-->
            <input type="text" name="phoneNumber" placeholder="Номер телефона"/>
            <input type="password" name="password" placeholder="Пароль"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button style="background-color: #0C1723" type="submit">Войти</button>
            <p class="message">Нет аккаунта? <a href="/registration">Создать аккаунт!</a></p>
        </form>
    </div>
</div>


<#--<form action="/login" method="post">
    Эл. почта: <input type="email" name="username"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Вход"/>
</form>

<a href="/registration">Зарегистрироваться</a>-->
</body>
</html>