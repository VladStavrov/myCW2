<!DOCTYPE html>
<html>
<head>
    <title>BUYSELL</title>
</head>
<body>
<h1>BUYSELL | <a href="/login">Войти</a></h1><hr>

<#--<form action="/" method="get">
    Поиск по названию объявления: <input type="text" name="title"><br>
    <input type="submit" value="Поиск"/>
</form>-->
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее...</a> |
            <#if user.email??>
                <#--<#if user.favorites.products.contains(product)>
                    <a&lt;#&ndash; href="/favorites/delete/${product.id}" &ndash;&gt;>Delete from favorites...</a>
                    <!-- блок кода, который будет выполнен, если условие истинно &ndash;&gt;
                <#else>
                    <a href="/favorites/${product.id}" >Add to favorites...</a>
                </#if>-->

                        <#if user.favorites.products?seq_contains(product)>
                            <a href="/favorites/delete/${product.id}" >Delete from favorites...</a>
                            <!-- блок кода, который будет выполнен, если условие истинно -->
                        <#else>
                            <a href="/favorites/${product.id}" >Add to favorites...</a>
                        </#if>


            </#if>





    </div>
    <#else>
    <h3>Товаров нет</h3>
</#list>

<hr>
<h3>Создать новый товар</h3>
<form action="/product/create" method="post" enctype="multipart/form-data">
    Название объявления: <input type="text" name="title"/><br><br>
    Описание объявления: <input type="text" name="information"/><br><br>
    Цена: <input type="number" name="price"/><br><br>
    Город: <input type="text" name="address"/><br><br>
    Площадь: <input type="number" name="livingArea"/><br><br>
    Первая фотография: <input type="file" name="files"/><br><br>
    Вторая фотография: <input type="file" name="files"/><br><br>
    Третья фотография: <input type="file" name="files"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Добавить товар"/>
</form>
</body>
</html>