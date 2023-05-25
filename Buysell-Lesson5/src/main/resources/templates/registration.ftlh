<!DOCTYPE html>
<html>
<head>
    <title>BUYSELL</title>
    <link rel="stylesheet" href="./css/login.css">

    <script src="./JS/login.js"></script>
</head>
<body>


<div class="login-page">
    <div class="form">
        <form class="register-form" action="/registration" method="post">
            <#if   errorMessage??>

                <span class="container info fa" style=" color: #EF3B3A;">${errorMessage}</span>
                <h1> </h1>
            </#if>

            <input type="text"name="name" placeholder="Имя"/>
             <input type="text" name="phoneNumber" placeholder="Номер телефона"/>
            <input type="password" name="password" placeholder="Пароль"/>

             <input type="hidden" name="_csrf" value="${_csrf.token}">
             <button style="background-color: #0C1723" type="submit">Создать</button>
            <p class="message">Есть аккаунт? <a href="/login">Войти!</a></p>
        </form>

    </div>
</div>

<#--<form action="/registration" method="post">
    Имя пользователя: <input type="text" name="name"><br><br>
    Эл. почта: <input type="email" name="email"><br><br>
    &lt;#&ndash;Номер телефона: <input type="text" name="numberPhone"><br><br>&ndash;&gt;
    Пароль: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Вход"/>
</form>-->

</body>
</html>